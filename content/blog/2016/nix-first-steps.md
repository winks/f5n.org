+++
draft = false
title = "nix - first steps"
date = 2016-06-09T19:30:00Z
+++

After hearing about it for a long time and [also mentioning it](/blog/2015/fosdem-cfgmgmtcamp-2015/)
I finally wanted to try [nix](https://en.wikipedia.org/wiki/Nix_package_manager) (not NixOS though).

I usually have [GNU stow](https://www.gnu.org/software/stow/) installed on every box I admin and use
to allow for some at-least-partially-sane workflow of installing non-os-package-manager software.

As usual I can't just download and test something, so I wanted to use the opportunity to try out
[purescript](http://www.purescript.org/).  Sadly it involves both Node.js and cabal, so to cut a long
story short... I gave up, even after some help from the #nixos irc channel.  You can set the npm prefix
and stuff will be installed somewhere, but packaging node deps apparently isn't as easy as 1-2-3.

I don't really like their install procedure of curl|sh, so I downloaded, edited the script and manually
ran it, but it looked rather well-written.

Anyway, on one one host I'm now running these things from nix instead of manually built with stow:

  * the silver searcher
  * chruby
  * node
  * tmux 2.2

So yeah, success so far, and I'm liking it, although despite their "don't worry, we have binaries" node.js
version 6.1.0 had to be built both on x86 *and* amd64.
