

elm:
	elm-make Warp.elm --output=warp.js

server: elm
	python -m SimpleHTTPServer 8000
