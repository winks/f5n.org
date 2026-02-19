SSG?='nextgen'
SASS?='sass'
CSSMIN?='cssmin'


all: regen rsync

beta: regen rsync-beta

clean:
	rm -rf public/*
	rm -rf public/.*

blueprints/f5n.org/static/media/css/v3.min.css: blueprints/f5n.org/sass/v3.sass
	${SASS} blueprints/f5n.org/sass/v3.sass blueprints/f5n.org/static/media/css/v3.orig.css
	cat blueprints/f5n.org/static/media/css/v3.orig.css | ${CSSMIN} > blueprints/f5n.org/static/media/css/v3.min.css
	#rm themes/f5norg/v3.orig.css themes/f5norg/v3.orig.css.map

css: blueprints/f5n.org/static/media/css/v3.min.css

generate:
	${SSG}

regen: css generate

reserve: regen serve

serve:
	cd public && python3 -m http.server 8085

rsync:
	rsync -av --delete --exclude=media/misc public/ deploy_f5n:www/f5n.org/public

rsync-beta:
	rsync -av --delete --exclude=media/misc public/ deploy_f5n:www/beta.f5n.org/public

lastweek:
	bash ./scripts/lastweek.sh

revert:
	mv lastrun.txt lastrun-reverted.txt
	cp lastrun-old.txt lastrun.txt
