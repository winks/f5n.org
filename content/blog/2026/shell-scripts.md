+++
draft = false
title = "Shell scripts"
date = 2026-01-09T11:30:08Z
+++

I've long been unhappy with shell scripts for anything that's more than 20
lines of glue code and so I've been looking for replacements for quite a
while.

The problem is usually that you need to fiddle with various versions of
`exec` or `popen` or whatever the language calls their wrapper around the
underlying C functions (or POSIX functionality, whatever). The task is usually
to execute a command, very often piping it into another one, then using the
output.

## Janet

Last year I found something neat. It's the `sh` package for Janet
 ([repo][janetsh]).

Small aside: At my current job we're doing something I really like - every so
often there's a housekeeping day where the whole team works on a list of all
our repos, sorted chronologically by which project has not had such a
so-called "Patch Day" for the longest. This is usually between 2 and 4 months,
and is completely separate from the vulnerability checks and renovate updates.

I love this concept and I wish I'd had that at previous companies, no project
ever really goes stale like this because someone always has looked at it in
the last months, even if it's been running without intervention or adding new
features.

Anyway, we have a checklist of tasks I felt could be automated, or at least
be made easier, as I was doing them anyway. This is not the full list, but I
think it represents exactly that type of small helper script. It's simple
enough it could have been a shell script, but if I needed more stuff, I could
have added it, in a proper programming language.

Comments inline with `#`

```
#!/usr/bin/env janet

# boring header, including the sh package
(use sh)

# One task is cleaning up old branches, so list them
($ echo "# Local branches")
($ git br)
($ echo "# Remote branches")
($ git br -r)

# Let's check that our Renovate setup is doing what it should
($ echo "# Last renovate commits")
($ git log --oneline --grep Renovate -n 3 --pretty=fuller)


# We're not big on using many fancy containers, but corretto and nodejs
# sometimes do need to be bumped to a new major version
($ echo "# Build images: corretto nodejs")
(run git grep corretto)
(run git grep "nodejs: ")


($ echo "# some boring renaming task in a metadata file")
(run rg "a-string-that-should-be-different")

```

That's it, the special sauce is explained [in this post][janetshpost], but the
benefit for me is that I don't have to write anything like

```
["git", "log", "--oneline", ...
```

## Python

Recently I also found a bug in a backup script of mine and annoyed with trying
to debug it, I rewrote it in Python, only to discover that the bug had been
trying to run docker with `--rm -it` via cron (force of habit when typing).

So yeah, it was a lot more debuggable, but the real problem was not shell :D

Fortunately that one only runs a few docker commands in order to dump databases
that are running in a container.

For completeness, this is how the interesting part looks:

```
filter_arg = 'name=postgres' if is_postgres() else 'name=mariadb'
av = [docker, 'ps', '-f', filter_arg, '--format', '\{\{.ID\}\}']
cid = subprocess.run(av, stdout=subprocess.PIPE).stdout.decode('utf-8').strip()
```

(Actually the curly brackets should not be escaped in this snippet, but
apparently I found a rare bug in the templating I use on this site...)

This filters by container name and gives me just the ID. And just the if/else
for the dbms is already better in Python than Shell.

## Lua

And then some time ago I tried to solve the problem on my own but it's also
just a terrible hack: [harsh][harsh]

It might be better if I had a proper parser for it, and I'm still not
completely sold on the idea, but it's meant as a test bed and proof of
concept.

Using it looks like this:

```
V.tokenFile = "/tmp/token"
local curl = run([[
    echo '{"token":"foo","b":3}'
]])
local jq = curl:pipe([[ jq -r .token ]])
spit(V.tokenFile, jq)
-- $ cat /tmp/token yields "foo"
```

Which has the benefit of being able to write the shell code verbatim,
but you pay by the boilerplate around it.

Maybe I should have a deeper look if the aforemention janet shell library
could be ported to [Fennel][fennel].

## Etc

Anyway, I kinda like the `janet-sh` solution but I am not sold on Janet as
a general-purpose programming language (yet) - I don't have any real big
problems but when I looked at it (in 2025) it felt like stuff I expect to be
there to be missing, and it was simply was not better enough than other Lispy
languages I tried. These days I apparently either expect core functionality to
just be there or I am enthusiastic enough to contribute.

> Random aside: Coincidentally I also had that feeling a bit when trying
> `Gleam`, but much less so. For Gleam I found single bugs and rough edges,
> for Janet it felt like: enough is missing to be annoying, not enough
> missing to be one of the first people jumping on the train.

So maybe I am still searching for the "perfect" replacement for shell scripts,
or maybe I should just give up and write some python. What I learned with my
own attempt with harsh, a single:

```
echo "git --foo --bar --whatever='3'" | sed 's, ,", ",g' >> myscript.py
```

already fixes most of my problems, because fixing that is 5 seconds, instead
of having to type `", "` 10 times. Yes, I'm picky sometimes.

And it's not like I rewrite those lines all
the time either, and I can usually replace all the calls to `sed` and `awk`
with Python string manipulation after getting the output of the one
original command.

## Footnote: Perl

I have nothing against Perl per se (except that I don't know it well and have
not had a good experience most of the time), but I don't want to learn it, I
can't (and don't want to make sure) it's installed on every box I use, and
so I can't judge it. I'm not saying it's bad for the task, but not for me.


[janetsh]: https://github.com/andrewchambers/janet-sh
[janetshpost]: https://acha.ninja/blog/dsl_for_shell_scripting/
[harsh]: https://github.com/winks/harsh
[fennel]: https://fennel-lang.org/

