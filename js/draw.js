main();

function main () {
    "use strict";
    
    // Get container for elm controled dom.
    var node = document.getElementById('warp');

    // Start up Elm app
    var app  = Elm.Warp.embed(node);

    // Subscrib to messages from elm to draw warp
    app.ports.warpChange.subscribe(function (data) {
        // Wait for the next browser call to do the paint
        requestAnimationFrame(function() {
            drawAll(data[0], data[1]);
        });
    });

    app.ports.colorChange.subscribe(function (data) {
        // Wait for the next browser call to do the paint
        requestAnimationFrame(function() {
            drawColor(data[1]);
        });
    });

    app.ports.setUrl.subscribe(function (data) {
        // Wait for the next browser call to do the paint
        requestAnimationFrame(function() {
            window.location.hash = data;
            document.getElementById("cpysrc").value = window.location;
        });
    });

    
    // Get canvas element and the drawing context
    var canvas = document.getElementById("canvas");
    var ctx    = canvas.getContext("2d");

    var colorBuffers = [];
    
    // init clip board button
    new Clipboard('.clipboard-copy');
    
    function getBounds ( canvas ) {
        return canvas
            .parentElement
            .getBoundingClientRect();
    }

    function getPixelRatio ( ) {
        // set it up so that we draw at the real dpi of the display
        var devicePixelRatio
            = window.devicePixelRatio || 1;

        var backingStoreRatio
            = ctx.backingStorePixelRatio ||
            ctx.webkitBackingStorePixelRatio ||
            ctx.mozBackingStorePixelRatio ||
            ctx.msBackingStorePixelRatio ||
            ctx.oBackingStorePixelRatio ||
            1;

        var ratio = devicePixelRatio / backingStoreRatio;

        return ratio;
    }

    function initBuffers ( warpWidth, warpHeight, colors ) {
        colorBuffers = [];

        for ( var i = 0 ; i < colors.length ; i++ ) {
            var buf = document.createElement("canvas");
            buf.width  = warpWidth;
            buf.height = warpHeight;
            var btx = buf.getContext('2d');

            btx.fillStyle = "rgba(0,0,0,0)"; 
	    btx.fillRect( 0, 0, warpWidth, warpWidth );
            
            colorBuffers.push(buf);
        }
    }
    
    function drawAll ( warp, colors ) {
        
        var threading   = warp.threading;
        var tieup       = warp.tieup;
        var treadling   = warp.treadling;
        var threads     = warp.warpColors;
        var weftthreads = warp.weftColors;

        var threadWidth = undefined;

        // Make the width of the warp be the
        // width of it's parent element.
        var bounds = getBounds( canvas );

        var warpWidth  = bounds.width;
        var warpHeight = 200; //bounds.height; 

        var ratio = getPixelRatio();
        
        // upscale the canvas if the two ratios don't match
        if ( ratio !== 1 ) {
            canvas.style.width = warpWidth + 'px';
            canvas.style.height = warpHeight + 'px';

            warpWidth  *= ratio;
            warpHeight *= ratio;            

            canvas.width = warpWidth;
            canvas.height = warpHeight;

        }


        initBuffers( warpWidth, warpHeight, colors );
        
        
        if ( threads.length != 0 )
            threadWidth = warpWidth/threads.length;


        // Adjust drawing possition to fill pixles exatly
        // avoiding blurry lines see:
        //   http://www.mobtowers.com/html5-canvas-crisp-lines-every-time/
        //
        var translate = (threadWidth % 2) / 2;
        ctx.translate(translate, translate);
        
        var start = 0;

        if ( treadling.length * threadWidth > warpHeight ) {
            start = Math.ceil(treadling.length/2)
                - Math.floor( warpHeight / threadWidth / 2 );
        }
        
	for ( var i = 0 ; i < threads.length ; i++ ) {
	    var offset     = i * threadWidth;
            var shaft      = threading[i];
            var colorIndex = threads[ i ];

            var buf = colorBuffers[ colorIndex ].getContext('2d');
           
            buf.fillStyle = "#ffffff";

            for ( var j = 0 ; j * threadWidth < warpHeight ; j++ ) {
                var wOffset        = j * threadWidth;
                var treadlingIndex = (j + start) % treadling.length;
                var shafts         = tieup[treadling[treadlingIndex] - 1];

                // continue if is is weft
                if (contains( shaft, shafts ))
                    continue;

                // Draw pixel
	        buf.fillRect( offset, wOffset, threadWidth, threadWidth );
	    }
        }
        
        drawColor( colors );
    }

    function drawColor ( colors ) {

        var width  = canvas.width;
        var height = canvas.height;

        // Fill the canvas with the weft color
        ctx.fillStyle = colors[0].hex; 
	ctx.fillRect( 0, 0, width, height );

        for ( var i = 1; i < colors.length ; i++ ) {
            var buf = colorBuffers[i];
            var btx = buf.getContext('2d');
            
            btx.save();
            btx.fillStyle = colors[i].hex;
            btx.globalCompositeOperation = "source-in";
            btx.fillRect(0, 0, width, height);
            btx.restore();
            
            ctx.drawImage(buf, 0, 0, width, height, 0, 0, width, height);
        }

    }
    
    function contains ( value, list ) {
        
        for ( var i = 0 ; i < list.length ; i++ )
            if ( value === list[i] )
                return true;

        return false;
    }
}
