+++
draft = false
title = "Small everyday hacks"
date = 2021-10-20T06:00:00Z
+++

Last night a friend asked for help. Due to Covid their sports club added some
weird registration feature to their website, apparently reusing the event
workflow of their CMS. The idea is ok, but the implementation is lacking.

If they go to train three times a week, they have to fill out the same form
with ~13 fields in the same way, three times per week. So I was asked if
that couldn't be automated. Filling out the form, that is, not navigating
to the correct page, which only takes a few clicks and the URL changes all
the time, anyway.

I've not done proper frontend stuff in a while, so I guess there's some
replacement for it, but my first idea was Selenium. A bit overblown, but
it should solve the problem. But how would it run, on a Windows PC?
Too complicated, but shouldn't a bookmarklet also work?

This is what I came up with in 10 minutes:

<pre>
javascript:{
document.querySelectorAll("[name=salutation]")[0].value="Mr";
document.querySelectorAll("[name=firstname]")[0].value="Firstname";
document.querySelectorAll("[name=lastname]")[0].value="Lastname";
document.querySelectorAll("[name=street]")[0].value="Street 23";
// ...
void(0)}
</pre>

"Take this, fill out your details, strip the linebreaks, create any new
bookmark, edit the bookmark, and replace the URL with this monstrosity."

It seems to work and while I'm not sure it will save a lot of time (unless
autocomplete didn't work on the page, the customer is happy and I'm glad
I could help.

This is one of these rare? "everyone should be able to code a little bit"
occasions, I guess. But searching for the right words and function call in
JS took longer than firing up a dev console and analyzing the form. So maybe
the knowledge of what's possible is indeed more valuable than remembering
syntax of a language you hardly use. Also not sure how often people use
bookmarklets.

I guess the semantically correct version would've been

<pre>
document.querySelector('input[name=firstname]').value
</pre>

(which also saves 3 characters per line), but it was late and I settled for
the first working solution.

This also works for the example page at hand:

<pre>
document.querySelector('[name=firstname]').value
</pre>

But if we're going to code golf anyway:

<pre>
javascript:{
var d=document;
var q=querySelector;
var n='[name=';
d[q](n+"salutation]").value="Mr";
d[q](n+"firstname]").value="Firstname";
d[q](n+"lastname]").value="Lastname";
d[q](n+"street]").value="Street 23";
// ...
void(0)}
</pre>

With the stripped example lines readded, that would be 546 vs 870 characters.

If it wasn't JS, I might actually feel bad about that version, but I can just
call it minified now.
