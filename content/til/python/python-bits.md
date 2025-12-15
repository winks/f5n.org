+++
draft = false
title = "Python bits"
date = 2025-12-15T17:44:13Z
tags = ["python"]
+++


I've not properly used Python for a bit, so here are some random notes so I
don't have to search through scripts and shell history and docs:

## uv

I'm not one of the people who were desperate before and now all problems are
solved, but [uv](https://docs.astral.sh/uv/) does a good job so far.

```
# just run it, if it has numpy and scipy deps
uv run --with numpy --with scipy example.py
```

```
# two methods to run something that installs a binary
uvx black example.py

uv tool install black
black example.py
```

## exec and output

After using `exec` and `subprocess.Popen` and friends, this is finally a
method to run a command and get the output that I might remember without
reading the docs again and again:

```
import subprocess

# to a variable via stdout
args = ['/bin/ls', '-al']
out = subprocess.run(args, stdout=subprocess.PIPE).stdout.decode('utf-8').strip()

# or to a file
(fd, fname) = tempfile.mkstemp(prefix='foo-')
with os.fdopen(fd, 'w+') as fh:
    rv = subprocess.run(args, stdout=fh)
with open(fname, 'r') as fh:
    out = fh.read()
# fname needs to be cleaned up manually, of course
```



## random stuff

`shutil.move()` reliably renames/moves files across
filesystems.
