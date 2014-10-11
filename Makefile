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

regen: css generate

reserve: regen
	${HUGO} server -D

watch: regen
	${HUGO} server -D -b f5n.org --watch

fixrss:
	mv public/blog/index.xml public/blog/atom.xml
	mv public/stack/index.xml public/stack/atom.xml

rsync: fixrss
	rsync -av --delete public/ ../public2
