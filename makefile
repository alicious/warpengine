

elm:
	mkdir -p www/js
	elm-make Warp.elm --output=www/js/warp.js
	elm-make Judge.elm --output=www/js/judge.js


www: elm
	mkdir -p www
	mkdir -p www/js 
	mkdir -p www/css
	mkdir -p www/images
	cp -r index.html judge.html js css images www
	cp lib/clipboard.min.js www/js
	cp -r assets www

server: www 
	cd www && python -m SimpleHTTPServer 8000

clean:
	-rm -rf www cats-cradle-chromatic elm-stuff

deploy-base: www
	-rm -rf cats-cradle-chromatic 
	mkdir -p cats-cradle-chromatic 
	cp -r www cats-cradle-chromatic
	cp app.yaml cats-cradle-chromatic

deploy: deploy-base
	cd cats-cradle-chromatic && gcloud app deploy

deploy-init : deploy-base
	cd cats-cradle-chromatic && gcloud init
