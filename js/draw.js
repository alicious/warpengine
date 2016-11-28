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

    // Get canvas element and the drawing context
    var canvas = document.getElementById("canvas");
    var ctx    = canvas.getContext("2d");

  
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

        if ( threads.length != 0 ) {
            threadWidth = warpWidth/threads.length;

            // If we can make the thread width
            // and intergern number of pixles
            if ( threadWidth > 1 ) {
                threadWidth = Math.floor(threadWidth);

                // Reduce warp width to exatly fit threads
                warpWidth = threadWidth * threads.length;
            }

            warpHeight = threadWidth * treadling.length;
        }

        // set canvas width and height
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
