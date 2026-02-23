+++
draft = false
title = "CD-DB"
date = 2026-02-17T22:13:09Z
+++

I've bought, collected, and ripped my own CDs for a very long time.

Some of those old rips were done in a terrible quality and need to be
redone, and I might as well rip them to FLAC for archival purposes.

So I wanted a list of CDs I own, at least the important ones that I have
on my shelves, from my favourite bands.

Now I know there must be a ton of systems that have all the fancy features,
but I didn't know their names and after a brief web search I could not find
anything that matched my needs, or they didn't advertise those:

  * scan barcode with mobile phone
  * look up and fetch the metadata
  * export all the data
  * have a non-shitty phone app without ALL permissions

So in the end I built something for myself.

I found [barcode-scanner](https://github.com/georapbox/barcode-scanner) which
is web-based, can be self-hosted and mostly did what I wanted.


{{ macros::figure(src="/media/blog/2026/scanner.png", title="screenshot of the barcode-scanner web app", w="682", h="594") }}

I made an ugly 7 line patch that added a simple link that opens in a new tab
with the scanned barcode as a GET parameter.

Then I wrote a small PHP script that

  * takes a `?barcode=` parameter
  * checks the MusicBrainz API for that barcode
  * writes the result (parsed and raw JSON) to an SQLite db
  * shows an error if nothing is found
  * alternatively also takes an `?id=` parameter (we'll come to that)

So this is how it works:

  * take a CD from a stack facing back side up
  * scan a barcode
  * tap on the last link shown
  * check the new tab for errors
  * close the tab
  * go back to the barcode-scanner tab
  * keep the CD out of the stack on error

For the ones with errors I search the title of the album on MusicBrainz, then
find a somewhat matching release and copy their MBID and manually call my
script with it. Really important is just the track list here.

I didn't exactly pay attention but I think I did not have to manually look
up more than 10%, maybe 5%. I scanned 160 album cases as the first batch
and I think I had to look up like 10-12.

Finally I wrote a small table view with filtering on that same SQLite DB, and
I already had the filtering JS in a different project.

{{ macros::figure(src="/media/blog/2026/cdlist.png", title="screenshot of a web page with a list of
music albums, all by the band In Flames", w="738", h="471") }}

Time investment: maybe 2h and < 300 lines of code

I guess just typing the 160 album names with artist and title would have
taken longer, and I wouldn't have all the metadata.

Now I guess I just need to find more CDs and then compare to my mp3 folder
and get to ripping stuff.
