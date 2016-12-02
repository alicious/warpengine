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
            drawAll(data[0], data[1], undefined);
        });
    });

    app.ports.colorChange.subscribe(function (data) {
        // Wait for the next browser call to do the paint
        requestAnimationFrame(function() {
            drawColor(data[0], data[1], data[3]);
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
    
    // init clip board button
    new Clipboard('.clipboard-copy');

    
    function drawAll ( warp, colors ) {
        drawColor( warp, colors, undefined );
    }
    
    function drawColor ( warp, colors, index ) {
        
        var threading   = warp.threading;
        var tieup       = warp.tieup;
        var treadling   = warp.treadling;
        var threads     = warp.warpColors;
        var weftthreads = warp.weftColors;

        var threadWidth = undefined;

        // Make the width of the warp be the
        // width of it's parent element.
        var warpWidth =
            canvas
            .parentElement
            .getBoundingClientRect()
            .width;

        // default
        var warpHeight = 200; 

        // set canvas width and height
        canvas.width  = warpWidth;
        canvas.height = warpHeight;

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
        
        // upscale the canvas if the two ratios don't match
        if (devicePixelRatio !== backingStoreRatio) {

            var oldWidth = canvas.width;
            var oldHeight = canvas.height;

            canvas.width = oldWidth * ratio;
            canvas.height = oldHeight * ratio;

            canvas.style.width = oldWidth + 'px';
            canvas.style.height = oldHeight + 'px';
        }

        warpWidth = canvas.width;
        
        if ( threads.length != 0 ) {
            threadWidth = warpWidth/threads.length;

            console.log( "warpWidth %s threadWidth %s", warpWidth, threadWidth); //BOOG
            // If we can make the thread width
            // and intergern number of pixles
            if ( threadWidth > 1 ) {
                threadWidth = Math.floor(threadWidth);

                // Reduce warp width to exatly fit threads
                warpWidth = threadWidth * threads.length;
            }

            warpHeight = threadWidth * treadling.length;
        }

        canvas.style.width = warpWidth/ratio + 'px';
        canvas.style.height = warpHeight/ratio + 'px';

        canvas.width  = warpWidth;
        canvas.height = warpHeight;
        
        // Adjust drawing possition to fill pixles exatly
        // avoiding blurry lines see:
        //   http://www.mobtowers.com/html5-canvas-crisp-lines-every-time/
        //
        var translate = (threadWidth % 2) / 2;
        ctx.translate(translate, translate);

        if ( index === undefined ) {
            // Fill the canvas with the weft color
            ctx.fillStyle = colors[0].hex; 
	    ctx.fillRect( 0, 0, canvas.width, canvas.height );
        }
        
        for ( var j = 0 ; j < treadling.length ; j++ ) {
            var wOffset = j * threadWidth;
            var shafts  = tieup[treadling[j] - 1];

	    for ( var i = 0 ; i < threads.length ; i++ ) {
	        var offset = i * threadWidth;

                var shaft = threading[i];

                var colorIndex = threads[ i ];

                // if we are drawnig just one color contine
                // if this is not that color
                if ( index !== undefined && colorIndex !== index )
                    continue;

                // continue if is is weft
                if (contains( shaft, shafts ))
                    continue;

                // Draw pixel
                ctx.fillStyle = colors[ colorIndex ].hex
	        ctx.fillRect( offset, wOffset, threadWidth, threadWidth );
	    }
        }    
    }
    
    function contains ( value, list ) {
        
        for ( var i = 0 ; i < list.length ; i++ )
            if ( value === list[i] )
                return true;

        return false;
    }
}
