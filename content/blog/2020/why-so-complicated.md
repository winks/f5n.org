+++
draft = false
title = "Why does it have to be so complicated?"
date = 2020-12-30T11:30:00Z
+++

After I wrote my post about Advent of Code 2020 yesterday I wanted to put it live, of course.
I thought my setup of a static site generator couldn't be so complicated, right? I was running this
on a machine where I hadn't run it before.

So I have a Makefile.

```
make reserve
# sass not found
```

Oh right, let's download sass and put it in the PATH. At least this doesn't have any dependencies.

```
make reserve
# file 'themes/.../xyz.sass' not found
```

Oh right, let's actually clone our theme. Why did I not put this as a git submodule? No one knows.

```
make reserve
# cssmin not found
```

Oh right, I didn't install this. It's my own, so I know how to build it.

```
git clone https://github.com/winks/cssmin-go
cd cssmin-go
go get ...
# go not found
```

Yeah, well, I don't usually use go a lot these days... 

```
ll /usr/local/go
/usr/local/go/bin/go version
# go version go1.13.7 linux/amd64
```

Whatever, this will do.

```
go build
cp cssmin-go ~/bin/cssmin
```

Let's go!

```
make reserve
# hugo not found
```

Oh right, the static site generator itself. Which version did I need again?

Looking at the commits in the theme I apparently upgraded to 0.59.1 in November 2019,
whereas the README of this repo still tells me 0.13 (from 2011).


So yeah, 10 minutes later everything was up and running but it's fascinating that every single step failed,
except the actual generation at the end. Maybe I should've tried [nextgen](https://f5n.org/blog/2020/a-static-site-generator/),
but I would've had to build it with rust first, as well...
