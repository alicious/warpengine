main();

function main () {
    var node   = document.getElementById('warp');
    var app    = Elm.Warp.embed(node);

    app.ports.warpChange.subscribe(function (data) {
        draw(data[0], data[1]);
    });

    var canvas = document.getElementById("canvas");
    var ctx    = canvas.getContext("2d");

    function draw ( warp, colors ) {
        console.log("WARP: ", warp);
        console.log("COLORS: ", colors);

        
        var threading   = warp.threading;
        var tieup       = warp.tieup;
        var treadling   = warp.treadling;
        var threads     = warp.warpColors;
        var weftthreads = warp.weftColors;

        var threadWidth;
        var warpWidth = canvas.parentElement.getBoundingClientRect().width;

        if ( threads.length != 0 ) {
            threadWidth = Math.floor(warpWidth/threads.length);
            warpWidth = threadWidth * threads.length;
        }
        console.log( "warpWidth %s threadWidth %s threads.length %s", warpWidth, threadWidth, threads.length); //BOOG
        canvas.width = warpWidth;
        
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        for ( var j = 0 ; j < treadling.length ; j++ ) {
            var wOffset = j * threadWidth;

	    for ( var i = 0 ; i < threads.length ; i++ ) {
	        var offset = i * threadWidth;

                var shaft = threading[i];
                var shafts = tieup[treadling[j] - 1];

                if (contains( shaft, shafts ))
                    "#000000"; //BOOG ctx.fillStyle = colors[ weftthreads[j] ].hex;
                else
                    ctx.fillStyle = colors[ threads[ i ] ].hex;

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
