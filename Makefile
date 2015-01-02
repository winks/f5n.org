HUGO?='hugo'
SASS?='sass'
CSSMIN?="$${HOME}/bin/cssmin"

clean:
	rm -rf public/*
	rm -rf public/.*

mrproper:
	rm -rf content/*

convert:
	hyde-hugo.py ~/www/f5n.org/source/content

css:
	${SASS} themes/f5norg/sass/new.sass themes/f5norg/new.orig.css
	cat themes/f5norg/new.orig.css | ${CSSMIN} > themes/f5norg/static/media/css/new.css
	rm themes/f5norg/new.orig.css

generate:
	${HUGO}

fixstuff:
	bash ./_final_hook.sh

regen: css generate

reserve2: regen
	${HUGO} server -D

reserve: regen fixstuff
	cd public && python -mSimpleHTTPServer 8081

watch: regen
	${HUGO} server -D -b f5n.org --watch

rsync: regen fixstuff
	rsync -av --delete public/ _public
