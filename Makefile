HUGO?='hugo'
SASS?='sass'
CSSMIN?="$${HOME}/bin/cssmin"


all: regen fixstuff rsync

beta: regen fixstuff rsync-beta

clean:
	rm -rf public/*
	rm -rf public/.*

css:
	${SASS} themes/f5norg/sass/v3.sass themes/f5norg/v3.orig.css
	cat themes/f5norg/v3.orig.css | ${CSSMIN} > themes/f5norg/static/media/css/v3.css
	rm themes/f5norg/v3.orig.css themes/f5norg/v3.orig.css.map

generate:
	${HUGO}
	cp public/blog/index.xml public/blog/atom.xml
	cp public/stack/index.xml public/stack/atom.xml

fixstuff:
	bash ./scripts/hook_final.sh

regen: css generate fixstuff

reserve2: regen
	${HUGO} server -D

reserve: regen serve

serve:
	cd public && python3 -m http.server 8081

watch: regen
	${HUGO} server -D -b f5n.org --watch

rsync:
	rsync -av --delete --exclude=media/misc public/ deploy_f5n:www/f5n.org/public

rsync-beta:
	rsync -av --delete --exclude=media/misc public/ deploy_f5n:www/beta.f5n.org/public

lastweek:
	bash ./scripts/lastweek.sh

revert:
	mv lastrun.txt lastrun-reverted.txt
	cp lastrun-old.txt lastrun.txt
