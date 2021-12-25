+++
draft = false
title = "Advent of Code 2021"
date = 2021-12-25T15:31:50Z
+++

This is my third time taking part in the [Advent of Code](https://adventofcode.com),
I wrote about it before:

[2019](/blog/2019/advent-of-code-2019/)/[2020](/blog/2020/advent-of-code-2020/)

This year I wanted to not just do Python again but also not invest so much time
into doing Erlang or Clojure, but practice Go a bit. 
I will come to part later of how that turned out.

Again there will be no problem description or complete spoilers, and the code
is [on github](https://github.com/winks/adventofcode/tree/master/2021).

My plan was to get up early and finish the two parts before work.

## Day 1 - Sonar Sweep

Easy start, 13 + 8 minutes. Getting used to Go and doing some mistyping

## Day 2 - Dive!

Parse input, calculate. 6 + 4 minutes.

## Day 3 - Binary Diagnostic

The first day that took a bit longer, 37 + 15 minutes. I'm still making silly
mistakes and fighting some parts of Go, but the VS Code integration is pretty
nice, especially auto-gofmt on save.

## Day 4 - Giant Squid

21 + 30 minutes, not sure why. It wasn't hard, just a little tedious.

## Day 5 - Hydrothermal Venture

Intersecting and overlapping vectors on a grid. 25 + 15 minutes.

## Day 6 - Lanternfish

This was supposed to be solved with a good trick, but I used a bad trick.
Instead of decoupling the identity of the fish and just track their value,
I implemented run-length encoding and if there were 11 new, I appended some
`[11, 8]` instead of 11 times an `[1,8]` - it worked well enough to combat
the exponential growth despite not being optimal. 11 + 18 minutes.

## Day 7 - The Treachery of Whales

Some math, uneventful. 13 minutes + 3 minutes.

## Day 8 - Seven Segment Search

While part 1 was still easy (15 minutes), this part 2 was the first tough one
for me (2h 15 minutes). I think this is the first one where in Python I would
have just used a `set()` and not lose my train of thought, whereas in Go I had
to implement it manually with a map and a for-loop...

Rewrote in Python (65 lines) because I couldn't believe how bad the Go version
looked (385 lines).

## Day 9 - Smoke Basin

Ah, the first day where you need to draw a map, get the neighbors, and then in
part 2 use that certain algorithm.

17 minutes + 1h 31 minutes for me, the idea was there very quickly but I think
I fell into some traps when doing part 2. This should've been faster.

This was the only day where I used Python and not Go, rewrote in Go later.

## Day 10 - Syntax Scoring

This is a proper parser and while it looked straightforward, I needed some
time. 1h + 13 minutes, so part 1 had already solved most of part 2.

## Day 11 - Dumbo Octopus

I think this is the day where I curse every language where I can't just extend
an array into the negative and so this was riddled by off by one errors and
some other things. 2.5h + 7 minutes.

## Day 12 - Passage Pathing

Ah, well-known algorithm solution number 2. I had learned my lessons in one of
the preceding years and thus it took 70 + 60 minutes and not ages.

## Day 13 - Transparent Origami

This was a fun one, you can either bruteforce it or apply some math. I
originally did the dumb version, which took 62 + 34 minutes. When I rewrote it
in Clojure, I used the math version but this only worked for p2 until I fixed
it to be a general solution that would also solve p1.

Here's a [nice blog post](https://sgt.hootr.club/molten-matter/aoc2021-day13-linear-equation/)
(not mine of course) that's kinda related to the solution I took, but not 100%.

## Day 14 - Extended Polymerization

Flashbacks to the 2019 or 2020 version of this, which I absolutely hated. This
time it went better, with 30 minutes + 2h.

## Day 15 - Chiton

Ah, the first pathfinding puzzle of the year. Another one where I learned my
lesson in the past and just had to remember, adapt, and not make errors.
2h 49 minutes + 30 minutes say that I didn't really do a good job though.

## Day 16 - Packet Decoder

Another parser, which I totally messed up at first. This was a day where Go
really got in my way, but I can't blame the language here, but my lack of
familiarity. (On other days I totally blame the language where I made some
stupid error when writing 5-10 lines of code which would've been a standard
library use and thus error free in another language). 3h 30 + 15 minutes,
because my elaborate part 1 was really easy to extend for part 2.

## Day 17 - Trick Shot

Reminds me of one puzzle in 2019 that was very similar. The basic calculation
of the trajectory was quite easy, also hitting the target. The real problem
was brute-forcing the correct answer for p1. p2 was then again was putting
another loop around it looking for the hits. 2h 49 min + 30 minutes.

Again I could not believe how long my Go code was (243 lines), so I tried to
shorten it (95 lines) and then I had some time left in the evening and went
for a little code golf in Python and managed to get it down to just 32 lines.

[Repo](https://github.com/winks/adventofcode/tree/master/2021/day17)

## Day 18 - Snailfish

This was a weekend puzzle where I had the correct idea and also a good first
throw at an implementation, but here an error, there an error, and in the end
I spent the whole day working on part 1. Part 2 then was a quick 15 minutes.
It was still quite fun, but this should've been a 2-3h solution and not me
messing up the details.

## Day 19 - Beacon Scanner

Another weekend puzzle where I thought I was progressing ok and then at some
point felt close enough to the solution but still not having it that I looked
at someone else's example code and got my solution working. 12h + 7 minutes.

## Day 20 - Trench Map

Again a map and neighbors, but this time with a twist. This felt really easy,
46 minutes + 32 minutes.

## Day 21 - Dirac Dice

This is one where I misunderstood a part of the problem, as I thought it will
end "as soon as someone wins a game, [in one of the realities]" versus the
actual "in all realities". One native speaker did an "oh, yes" when I said
that so either it was not 100% clearly written or it is the lack of English
on my part. Anyway, 78 minutes for part1 and no idea about part2, also this
is one where I cheated.

## Day 22 - Reactor Reboot

Part 1 was easy, 66 minutes and then... I looked at part 2 and it looked
tedious enough that I simply didn't feel like solving it. I guess this is
where I finally noticed (and accepted) how much time I had sunk in and now
the fun was gone. Did not complete part2, although I looked at it for a bit
again in the evening, then said screw it.

## Day 23 - Amphipod

Oh yeah, a towers of Hanoi path-finding again. I looked at it for a bit in the
morning but as the day before, felt zero drive to implement it. Nope.

## Day 24 - Arithmetic Logic Unit

I coded up the ALU (this was quick and fun), then I noticed that I'd probably
read the input by hand and deduce some sort of solution. Also I went out and
away from the computer for most of the day, so I never continued working on it.

## Day 25 - Sea Cucumber

Map and neighbors again, I had the example working pretty quickly but again Go
got in my way and my solution had just a little error, but I ran out of time,
went to have lunch and in the end I think it took 2h, of which I could've saved
about one by just being able to copy a 2-dimensional array without problems.

# Completion

  * total stars: 44 / 49
  * two stars: Days 1-21
  * one star: Days 22, 25
  * zero stars: Days 23, 24

## Languages

  * Go: Days 1-22, 25
  * Clojure: Days 1-3, 6, 7, 13, 20 = 7 days
  * Python: Days 8, 9, 17

## Open TODOs

  * rewrite some more solutions in Clojure
  * maybe do some Erlang again, or finish 2020 which I started doing in Erlang

## Non-TODOs

  * not sure if I will do Day 22.2, 23, and 24

## The end

So, this year was a bit different. I didn't try anything fancy like in 2019,
but I also didn't take the real easy way of just using a language I can work
with really well, but used a language I have used in the past and wanted to
brush up again. What I learned from this is that I do not like Go at all and
nothing has convinced me that this will change. I didn't like it back when I
used it for work and I don't like using it now, but I accept that it is really
good for some things. Currently I don't need these things, so that was it.

I had A LOT of fun for the first 17 days and even when spending basically my
whole weekend on Day 18 + 19 I was still in high spirits, but on Day 22 it
was simply enough for me for this year. Maybe it would've been better if I had
switched to a different language on the weekend, probably not.

I am still very happy I participated again and as usual a huge shoutout to
`#lobsters-advent` (on Libera.chat now) for discussions, providing moral
support, and enjoying Advent of Code together again.

Thanks to Eric (and the team) for giving us this plethora of puzzles every
year. I think the difficulty level is fine overall, but as I imagine it is a
hard choice to make as there are so many different people wanting to
participate. So I guess I can only sum up my thoughts as someone who has
reached 44-45 stars three years in a row now with the times provided...

Getting it completed without actual cheating is really hard. Just trying on
your own and maybe asking people for clarification or some intermediate output
is sometimes helpful, but I would prefer it to be solvable in 1-2h every day.
I know there are speedcoders who do it in 5 minutes, and there are others who
might also do it in a new language in 10 - but I am not that. I am also not
immensely letdown for not finishing, but it sucks a bit that there are always
a few days where you either don't have that hour or it is simply so hard that
you would have needed a lot longer. Or maybe my goal of "complete it before
24h are up" and not catch up later is a bad idea anyway, for my skill level.

## Appendix 1: Personal stats

<pre>
      --------Part 1--------   --------Part 2--------
Day       Time   Rank  Score       Time   Rank  Score
 25   07:30:50   6689      0          -      -      -
 22   03:30:56   6778      0          -      -      -
 21   03:58:23   9197      0   12:29:13   9647      0
 20   03:30:19   5301      0   04:02:53   5513      0
 19   17:43:12   7249      0   17:54:06   6997      0
 18   18:44:24  11948      0   18:59:16  11788      0
 17   02:02:34   6181      0   02:09:43   5380      0
 16   05:00:15   7884      0   06:23:10   7862      0
 15   02:49:25   7915      0   03:53:28   6774      0
 14   02:42:59  13283      0   08:55:03  17095      0
 13   01:14:31   7329      0   01:48:31   7901      0
 12   09:03:28  20148      0   10:03:05  18989      0
 11   06:07:33  17138      0   06:14:46  16908      0
 10   01:15:29  10092      0   01:28:13   9243      0
  9   00:17:30   4028      0   01:48:26   7940      0
  8   00:14:15   3679      0   05:58:48  15476      0
  7   02:08:01  17771      0   02:10:55  16212      0
  6   02:33:39  17741      0   02:51:49  13792      0
  5   03:05:07  13360      0   03:20:49  11974      0
  4   04:38:56  16930      0   04:53:50  15440      0
  3   02:52:48  26054      0   04:27:29  21760      0
  2   01:29:10  18211      0   01:32:56  17156      0
  1   01:38:46  12994      0   01:46:56  11727      0
</pre>

Again I will repeat that I'd love to have a personal board with times between
"accessing the puzzle/input page for the first time" and submission. This will
not catch cheaters who have two accounts or look at the puzzle with someone
else, but for most of us it would alleviate having to track our completion
times manually every single day, and I think this is the majority, who won't
get up at 6 am (for Central Europe) or whatever. If you look at my stats, I
actually did get up at 6 or 7 a few times because I wanted to be done before
work.
