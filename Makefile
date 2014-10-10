HUGOBIN='hugo'

clean:
	rm -rf public/*
	rm -rf content/*

convert:
	hyde-hugo.py ~/www/f5n.org/source/content

reserve:
	${HUGOBIN} server -b f5n.org -D

watch:
	${HUGOBIN} server -b f5n.org -D --watch
