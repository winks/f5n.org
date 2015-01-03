#!/bin/bash

mv public/blog/index.xml public/blog/atom.xml
mv public/stack/index.xml public/stack/atom.xml

rm public/index.xml

sed -i 's,/index.xml/,/blog/atom.xml,' public/index.html
sed -i 's,/blog/index.xml/,/blog/atom.xml,' public/blog/index.html
sed -i 's,/stack/index.xml/,/stack/atom.xml,' public/stack/index.html
