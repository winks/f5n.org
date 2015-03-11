+++
draft = false
title = "Lua shenanigans"
date = 2015-03-11T14:30:00Z
+++


After some time away from building stuff with Lua in my spare time I wanted to
revisit it and thus decided to start another project with
[OpenResty](http://openresty.org/) and [Lapis](http://leafo.net/lapis/).

Turns out there's a reason for it being relatively niche.
Lapis works fine, just like a while back.  I reported some minor issues, but
they were promptly fixed or explained and I'm still a happy user trying
to recommend everyone to at least give it a try ;)

So, I was going to use PostgreSQL and Lapis now even uses a better api than
[ngx_postgres](https://github.com/FRiCKLE/ngx_postgres) (which is a cool hack,
but I wasn't entirely sold...) in the form of [pgmoon](https://github.com/leafo/pgmoon) - and it works fine.

My other dependency would be a Markdown library.  I had used [lunamark](https://github.com/jgm/lunamark/) last
year but forgotten about my problems.  To cut the long story short, I found my own bug reports and applied my fixes again. boo.

I don't know how I found out about lunamark, but according to the
[lua toolbox](https://lua-toolbox.com/label/28) it's endorsed by 2 people.

Anyway, this is how you lua: (it's part howto, part rant, part exercise in futility)

  * download latest openresty
    * tar xaf ... ; cd ...
    * `./configure --prefix=/usr/local/openresty-1.7.10.1 \
      --with-luajit --with-pcre-jit`
    * wonder why it doesn't work because of missing ldconfig
    * prefix `PATH=$PATH:/sbin` and retry configure
    * `make && make install`
    * wonder why it doesn't work because libluajit can't be found
    * retry configure as root, make && make install
    * it works?
  * `git clone https://github.com/keplerproject/luarocks; cd luarocks; git checkout v2.0.13`
    * `./configure --prefix=/usr/local/openresty/luajit \
      --with-lua=/usr/local/openresty/luajit/ \
      --lua-suffix=jit-2.1.0-alpha \
      --with-lua-include=/usr/local/openresty/luajit/include/luajit-2.1`
    * `make && make install`
  * `alias luarocks=/path/to/luarocks`
  * `luarocks install lapis` - hey, this works. surprise
  * `luarocks install lunamark`
    * this fails, so back to source
    * `git clone https://github.com/jgm/lunamark/ && cd lunamark && luarocks make lunamark-0.3-2.rockspec`
    * notice the [still unfixed lpeg problem](https://github.com/jgm/lunamark/issues/8#issuecomment-47277487)
      * `luarocks remove --force lpeg && luarocks install lpeg-0.10.2-1`
  * notice the unicode problem with slnunicode
    * notice there hasn't been a release [since your own fix](https://github.com/LuaDist/slnunicode/pull/1), so manually build head
    * `git clone https://github.com/LuaDist/slnunicode slnunicode-1.1a`
    * now move this directory to from where you installed openresty. sounds complicated, but for me it was:
      * `cd /opt/src/ngx_openresty-1.7.10.1/build && ln -s /opt/src/slnunicode-1.1a`
      * `make -f slnunicode-1.1a/Makefile`
      * ignore the error because the test can't run because your lua binary is somewhere else
      * `cp unicode.so /usr/local/openresty-1.7.10.1/luajit/lib/lua/5.1/unicode.so`
      * restart openresty

My project is called [wheee](https://github.com/winks/wheee) and it's a small
wiki engine.  It includes users, pages and revisions.  That's about it.

TL;DR: I love Lua and Lapis is a pretty cool framework if you're just getting
started or not want to care about low level stuff for a fun side project.  BUT
if you're comparing it to the frictionless experience of Rails or something,
you'll probably be annoyed.

Oh, and I'm gonna try out [this markdown library](https://lua-toolbox.com/module/258)
now, it's endorsed by 5 people.
