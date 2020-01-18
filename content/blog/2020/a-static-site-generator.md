+++
draft = false
title = "A Static Site Generator"
date = 2020-01-18T01:40:00Z
+++

A little while ago I wrote about micropub and this meant I needed a way to integrate dynamic content into this static site.

Of course the easiest way is to just let some dynamic part create a new file (or append to one) in this input folder and then rebuild the website,
but I didn't find that very elegant. But i looked into it and hugo's data feature and it looked ok.

Anyway, I tried to upgrade hugo from a 4 year old version and while it worked there were some things that felt needlessly changed and I had to rewrite some
templates and overall I was a little annoyed at the thousand features I didn't need and the amount of docs to be read.

This was a while ago and a week ago I thought it might be fun to see just how much time and effort it would take to write a static site generator from scratch.

And I think I'm finished now and decided to write a bit about it.

  * Written in Rust
  * 333 lines of code (plus a few external crates, of course)
  * Fast enough (250 markdown pages in 0.1s)
  * It can build this website kind of identical, not bit by bit but structurally the same
  * It took roughly a week to build it, a few hours each night


[The first commit][commit1] still uses a lot of regex parsing, was mostly playing around.
But the basic flow is the same already and the static asset handling hasn't really changed: Use the [`walkdir`][cwalkdir] crate to look for matching files in a directory and
copy them to `./public/static`.

The [`pulldown_cmark`][cpull] crate for Markdown parsing works great.

[The second commit][commit2] introduces the [`tera`][ctera] create for templating, which is similar to Jinja. I tried [`liquid`][cliquid] at first, but it really didn't click.

[Then][commit3] I introduced sections, which means that for example everything under `/blog/` is grouped under the `blog` section. Also for years I had kinda wondered how
websites calculate this "takes 5 minutes to read" but never looked it up. Well, hugo has that feature and so I searched a bit and settled on a very basic algorithm.
Count the words in the Markdown file, divide by 200. This was close to hugo's output, but not perfect, so I am simply adding one minute and it seems to mostly match.

The [next planned dependency][commit4] was [`toml`][ctoml] to read the front matter of the markdown files (and also the site config) and it also needed [`serde`][cserde].

Then I noticed that I should generate directories with an `index.html` inside and not a file called e.g. `/foo.html` - thus [this boring commit][commit5].

Next up were [the section index pages][commit6] ([live example](/blog)). If there's a file called `_index.md` in the `blog` folder, this gets generated, otherwise nothing happens.
I got the idea how this is handled from [Zola](https://www.getzola.org/documentation/content/section/) because of course I looked at a few static site generators this week.

I couldn't really work with/format dates yet, thus [the next commit][commit7] introduced the [`chrono`][cchrono] crate, as expected.

[Next up][commit8] were the section index pages, which made me restructure how I keep the parsed pages in memory. These can only be generated once all the pages in this
section have been parsed. I first implemented these in Rust and not in the template.

[Commit #9][commit9] introduced section rss feeds (Atom actually), which was pretty straightforward.

[Then][commit10] the section index pages were converted to the template language and everything was [cleaned][commit11] [up][commit12] a bit.

[Here][commit13] all parsed markdown pages are finally sorted into a defined section. `_index` for the `/index.html`, `_default` for normal pages (like my
[about page](/about)) and the section for e.g. `/blog/` pages. Everything that is not a section index or index also goes into `_pages`.
This makes it possible to show the latest posts on the index page, in my case the last 10 of the sections `blog` or `stack`.

[Now a little refactoring][commit14] to eliminate a fourfold code duplication of 4 lines to write the resulting pages to disk.

[And finally][commit15] only the main RSS feed is missing, but the list of pages is already there, so it's easy.


And that's how the final program looks:

  * read `config.toml`
  * let `tera` read all the template files
  * copy static files
  * identify the sections
  * parse every markdown page and prepare the variables for the templates
  * if it's a normal page, just generate it
  * if it's the index or a section index, defer writing, but save the variables
  * sort by section, but keep a list of all pages
  * go over the sections and generate the section index and the section rss feed
  * generate the index page and the main rss feed

I didn't do a real comparison in the browser yet, only looked at `colordiff` output of the
different types of pages, so there might be a few small bugfixes left, but the goal of
replicating all of hugo's features that I actually use is achieved. I don't generate CSS from
SASS but looking at my Makefile it's not even done by hugo now...

I'm not sure if I'll switch to `nextgen` or if I will add the features I need for micropub,
but working with Rust for a few hours made me understand a few things better and I can really
use the training.


[commit1]: https://github.com/winks/nextgen/commit/3c1622f78c6f391af17578e9a12dbc99192f4d61
[commit2]: https://github.com/winks/nextgen/commit/2b4d69cbfa758b4534c645457e7c9bd2c2956b41
[commit3]: https://github.com/winks/nextgen/commit/663adb67f0dc5b46dab915064eed9d455e797cda
[commit4]: https://github.com/winks/nextgen/commit/838588441c00bdb3bdec95e5222edcd2ff5296c7
[commit5]: https://github.com/winks/nextgen/commit/d9dd1a3918d6854c72f02e227b79f0995b5df0b2
[commit6]: https://github.com/winks/nextgen/commit/3b6851a9afa7b4abd47681ba6734bbc36307c950
[commit7]: https://github.com/winks/nextgen/commit/b4d8b4fe16cd4c1c7083d540387359713940c403
[commit8]: https://github.com/winks/nextgen/commit/74e4473f3d3f2f452ccebd156287db579612ad6d
[commit9]: https://github.com/winks/nextgen/commit/dd3e3a7d627ba2ecb97c26df5e71f241daae4a10
[commit10]: https://github.com/winks/nextgen/commit/4f1f020c5a39ef944496b062a7f2d8ed154d3a47
[commit11]: https://github.com/winks/nextgen/commit/e9ea025617d215b079967c194162df1139b3fe31
[commit12]: https://github.com/winks/nextgen/commit/231a879b468060aa8a666a984440f9aa2fe26974
[commit13]: https://github.com/winks/nextgen/commit/a98b2485faf4c79b4bfd28a1514eb5e3efbd514d
[commit14]: https://github.com/winks/nextgen/commit/43c8cdbbb296275d467f3dadb9cd23fe92a28259
[commit15]: https://github.com/winks/nextgen/commit/a5cb0e0436345608922161d2253c9d7f6d0525d1

[cchrono]: https://crates.io/crates/chrono
[cliquid]: https://crates.io/crates/liquid
[cpull]: https://crates.io/crates/pulldown-cmark
[cserde]: https://crates.io/crates/serde
[ctera]: https://crates.io/crates/tera
[ctoml]: https://crates.io/crates/toml
[cwalkdir]: https://crates.io/crates/walkdir
