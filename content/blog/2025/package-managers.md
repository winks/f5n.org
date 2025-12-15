+++
draft = false
title = "Package Managers"
date = 2025-12-14T16:20:30Z
+++

If I look at my `environment.zsh` (just the part of my zsh config that handles
`PATH` - I see the following customizations, although not all are active on
every machine at every time (the curse of shared dotfiles):

  * add rustup's `bin/` and source `.cargo/env`
  * add `/usr/local/go/bin`
  * add JDK via SDKMAN (partial dogfooding for [leiningen-sdkman][]
  * Homebrew
  * `nvm` for node.js

And then stuff I don't currently use:

  * add `node_modules/bin` from nixpkgs
  * add Elixir via `kiex` and Erlang via `kerl`

I kinda hate this - and I get that I could maybe, sometimes just grab a
version that's packaged via the distro's package manager - but I usually
need a specific version (sometimes newer, sometimes LTS) when I am writing
code in that particular language.

Of course it would be easy to wish for a generalized package manager, and
SDKMAN is just that - but they also don't seem to have everything I need.

And so the path mangling continues. Usually it's not even that bad, except
Homebrew, which insists on adding itself to the front of the path, when every
other script appends or prepends at exactly that moment in time when you call
it, so it's relatively easy to get the order how you want it.

But it's still ridiculous I can't have one `bin` folder for all of those.
Maybe cluttering up `/usr/local/bin` wasn't so bad after all, I'd probably
have had less issues if all those tools and package managers would have
symlinked their binaries (even better if configurable) to `~/.local/bin` or
something like that and then you'd simply include that in your path and be
done with it. How likely are naming conflicts with 10 language package
managers anyway?
