

elm:
	elm-make Warp.elm --output=warp.js


htdocs: elm
	mkdir -p htdocs
	cp -r index.html draw.js warp.js css/ htdocs

server: elm
	cd htdocs && python -m SimpleHTTPServer 8000

clean:
	-rm -rf htdocs
