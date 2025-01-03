+++
draft = false
title = "git-config: includeIf"
date = 2024-11-03T22:38:25Z
tags = ["git"]
+++

I have been using `includeIf` in my `.gitconfig` for years, usually to
separate out my personal git config on my work machine. Typically the only
directory I have checked out that I am regularly committing to is my
[dotfiles repo](http://github.com/winks/dotfiles), but it can happen.

So anyway, usually it looks something like this:

```
# wrong!

[include]
	path = ~/.gitconfig-default
[includeIf "gitdir:~/code/winks"]
	path = ~/.gitconfig-personal
[includeIf "gitdir:~/code/dotfiles"]
	path = ~/.gitconfig-personal
```

so it would use `company@example.org` by default, but use
`personal@example.org` in those 2 folders.

Apparently at some point I checked in a wrong version to my dotfiles
and because I'm not usually running that on my own machines I missed
the error.

This is how it actually works:

```
# correct

[include]
	path = ~/.gitconfig-default
[includeIf "gitdir:~/code/winks/"]
	path = ~/.gitconfig-personal
[includeIf "gitdir:~/code/dotfiles/.git"]
	path = ~/.gitconfig-personal
```

Yes, the trailing slash is important. Doh.

You can also leave off the `.git`, but maybe that makes it clearer that this
is a single repo, while the first example matches every subdir as well.

Source: [man page](https://git-scm.com/docs/git-config)

**Addendum:** Apparently you can also solve the
"different keys for the same host, e.g. github.com" problem with includes:

https://stevenharman.net/configure-ssh-keys-for-multiple-github-accounts
