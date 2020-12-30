HUGO?='hugo'
SASS?='sass'
CSSMIN?="$${HOME}/bin/cssmin"


all: regen fixstuff rsync

beta: regen fixstuff rsync-beta

clean:
	rm -rf public/*
	rm -rf public/.*

#mrproper:
#	rm -rf content/*

convert:
	hyde-hugo.py ~/www/f5n.org/source/content

css:
	${SASS} themes/f5norg/sass/new.sass themes/f5norg/new.orig.css
	cat themes/f5norg/new.orig.css | ${CSSMIN} > themes/f5norg/static/media/css/new.css
	rm themes/f5norg/new.orig.css

generate:
	${HUGO}
	cp public/blog/index.xml public/blog/atom.xml
	cp public/stack/index.xml public/stack/atom.xml

fixstuff:
	bash ./scripts/hook_final.sh

regen: css generate

reserve2: regen
	${HUGO} server -D

reserve: regen fixstuff
	cd public && python -mSimpleHTTPServer 8081

watch: regen
	${HUGO} server -D -b f5n.org --watch

rsync:
	rsync -av --delete --exclude=media/misc public/ ares:www/f5n.org/public

rsync-beta:
	rsync -av --delete public/ ../../beta.f5n.org/public

lastweek:
	bash ./scripts/lastweek.sh

revert:
	mv lastrun.txt lastrun-reverted.txt
	cp lastrun-old.txt lastrun.txt
