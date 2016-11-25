main();

function main () {
    "use strict";
    
    // Get container for elm controled dom.
    var node = document.getElementById('warp');

    // Start up Elm app
    var app  = Elm.Warp.embed(node);

    // Subscrib to messages from elm to draw warp
    app.ports.warpChange.subscribe(function (data) {
        draw(data[0], data[1]);
    });

    // Get canvas element and the drawing context
    var canvas = document.getElementById("canvas");
    var ctx    = canvas.getContext("2d");

  
    function draw ( warp, colors ) {
        
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
            // Couput the threadWidth as a integer number of pixles or
            // 1 if 0.
            threadWidth = Math.max(Math.floor(warpWidth/threads.length), 1);

            // Reduce warp width to exatly fit threads
            warpWidth = threadWidth * threads.length;

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

        // clear the canvas
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        for ( var j = 0 ; j < treadling.length ; j++ ) {
            var wOffset = j * threadWidth;

	    for ( var i = 0 ; i < threads.length ; i++ ) {
	        var offset = i * threadWidth;

                var shaft = threading[i];
                var shafts = tieup[treadling[j] - 1];

                var fillColor;
                if (contains( shaft, shafts ))
                    fillColor = "#000000"; //BOOG colors[ weftthreads[j] ].hex;
                else
                    fillColor = colors[ threads[ i ] ].hex;

                // Draw pixel
                ctx.fillStyle = fillColor
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
