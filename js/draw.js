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
            drawColor(data);
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
        var WARP_HEIGHT = 200;
        var warpWidth  = bounds.width;
        var warpHeight = WARP_HEIGHT; //bounds.height; 

        var ratio = getPixelRatio();
        
        // upscale the canvas if the two ratios don't match
        if ( ratio !== 1 ) {
            canvas.style.width = warpWidth + 'px';
            canvas.style.height = warpHeight + 'px';

            warpWidth  *= ratio;
            warpHeight *= ratio;
        }

        if ( threads.length != 0 )
            threadWidth = Math.ceil(warpWidth/threads.length);

        warpWidth = threads.length * threadWidth;
        warpHeight = WARP_HEIGHT * warpWidth/bounds.width ;
        
        
        canvas.width = warpWidth;
        canvas.height = warpHeight;

        initBuffers( warpWidth, warpHeight, colors );

        
        var tupleBuffer = document.createElement("canvas");
        tupleBuffer.width  = warpWidth;
        tupleBuffer.height = warpHeight;
        
        var tupleOffsets = {};
        var nextTuple    = 0;
        var tupleContext = tupleBuffer.getContext('2d');

        tupleContext.fillStyle = "rgba(0,0,0,0)"; 
	tupleContext.fillRect( 0, 0, warpWidth, warpWidth );
        tupleContext.fillStyle = "#000000";

        var start = 0;

        if ( treadling.length * threadWidth > warpHeight ) {
            start = Math.ceil(treadling.length/2)
                - Math.floor( warpHeight / threadWidth / 2 );
        }

        var trippleWidth = threadWidth * 3;
        
	for ( var i = 0 ; i < threads.length ; i++ ) { // reading warp left to right
	    var offset     = i * threadWidth;
            var shaft      = threading[i];
            var colorIndex = threads[i];

            var nextShaft     = "E";
            var preivousShaft = "E";

            if ( i < (threads.length - 1) )
                nextShaft = threads[i+1]
            
            if ( i !== 0 )
                preivousShaft = threading[i-1];
            
            var tupleKey    = shaft + "-" + nextShaft;
            var cashOffset = tupleOffsets[tupleKey];

            if ( cashOffset === undefined ) {
                cashOffset = nextTuple;
                nextTuple  += trippleWidth;

                tupleOffsets[tupleKey] = cashOffset;
                
                var wOffset  = undefined;
                    
                for ( var j = 0 ; j < Math.ceil(warpHeight/threadWidth) ; j++ ) {
                        
                    var treadlingIndex = (j + start) % treadling.length;
                    var shafts         = tieup[treadling[treadlingIndex] - 1];

                    // continue if is is weft
                    if (contains( shaft, shafts )) {
                        if ( wOffset !== undefined ) {
                            var end = j * threadWidth;
                            // Draw pixel
                            tupleContext.fillRect(
                                cashOffset + 1, wOffset,
                                threadWidth   , end - wOffset );
                        }

                        wOffset = undefined;
                    }
                    else if ( wOffset === undefined )
                        wOffset = j * threadWidth;
                        
	        }
                
                if ( wOffset !== undefined ) {
                    var end = j * threadWidth;
                    // Draw pixel
                    tupleContext.fillRect(
                        cashOffset + 1, wOffset,
                        threadWidth   , end - wOffset );
                }

            }
            
            var buf = colorBuffers[ colorIndex ].getContext('2d');

            buf.drawImage(tupleBuffer,
                          cashOffset , 0, trippleWidth, warpHeight,
                          offset -1  , 0, trippleWidth, warpHeight);

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
