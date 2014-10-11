HUGO?='hugo'
SASS?='sass'
CSSMIN?="$${HOME}/bin/cssmin"

clean:
	rm -rf public/*

mrproper:
	rm -rf content/*

convert:
	hyde-hugo.py ~/www/f5n.org/source/content

regen: css
	${HUGO}

reserve: css
	${HUGO} server -D

watch: css
	${HUGO} server -D -b f5n.org --watch

css:
	${SASS} themes/f5norg/sass/new.sass themes/f5norg/new.orig.css
	cat themes/f5norg/new.orig.css | ${CSSMIN} > themes/f5norg/static/media/css/new.css
	rm themes/f5norg/new.orig.css
