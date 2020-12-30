+++
draft = false
title = "Advent of Code 2020"
date = 2020-12-29T18:00:00Z
+++


This is my second time taking part in the [Advent of Code](https://adventofcode.com), I also wrote about it [last year](/blog/2019/advent-of-code-2019/).

Using 20 languages was fun, but I didn't want to spend all my spare time on AoC again so I settled on one language, Python.

Again there will be no problem description or complete spoilers, and the code is [on github](https://github.com/winks/adventofcode/tree/master/2020).


## Day 1 - Report Repair

This shouldn't be too hard but I added a tiny bug which I couldn't for the life of me find, so I hacked up a bash one liner to solve it.
Part 2 takes 516ms to run, so maybe I should add some memoization.

## Day 2 - Password Philosophy

I accidentally solved part 2 first by not reading the instructions properly, so part 1 took a little longer and part 2 was done very quick.

## Day 3 - Toboggan Trajectory

Don't think I can say much, but it's the first one this year that uses a "map" with coordinates. Parsing to an y/x-array doesn't twist my mind,
so I usually go the easy route here.

## Day 4 - Passport Processing

This one was unnecessarily tedious. A lot of fields to validate and no real meat to the problem, half of the fields would've been fine.
Someone had solved it correctly and hadn't noticed a typo which made it fail. My superpower of instantly seeing this at a glance proved useful again.
I still would prefer to write bug-free code over typo-free code that easily...

## Day 5 - Binary Boarding

This was fun and I didn't "get" the easy solution, but my brutish attempt yielded the correct solution anyway.

## Day 6 - Custom Customs

For some reason I found this part 2 a little tricky. (10 + 50 mins)

## Day 7 - Handy Haversacks

Flashbacks to last year's day 14 but it was either easier or I simply didn't make the same mistakes. (35 + 55 mins)

## Day 8 - Handheld Halting

People on Reddit were assuming (or fearing) this would be intcode all over again but it was quick and easy and a single occurrence. (22 + 50 mins)

## Day 9 - Encoding Error

I don't remember much, but it was quick. (7 + 10 mins)

## Day 10 - Adapter Array

Didn't particularly like this one, and I was pretty sure my part 2 was mostly correct, but I asked someone for help and my solution was indeed 90% correct. (18 + 45 mins)

## Day 11 - Seating System

Not sure what I messed up, but I did mess up something, so this took a while. My part 2 solution runs for 4 minutes, so needs some optimization.  (54 + ~120 mins)

## Day 12 - Rain Risk

Playing around with coordinates, this was fun. I was slower than I had hoped though. (25 + 34 mins)

## Day 13 - Shuttle Search

Part 1 was really quick, but I spent ages on part 2. When I was relatively confident that my solution was correct but unbearably slow,
someone on #lobsters-advent offered help and calculated my input to give me a rough estimate where to start my search, and then it "only"
ran for 16s instead of probably 16h. Needs some work. (11 mins + 6h)

## Day 14 - Docking Data

This is the first day I did not complete, part 1 took like 39 minutes but I didn't have time that evening and couldn't extend my lunchbreak either, so I never tried part 2.

## Day 15 - Rambunctious Recitation

The description text on this one confused me multiple times, it wasn't the problem so much that was hard, but extracting the specs was. 
Completion time seems to be 95 minutes and 16 minutes. Maybe there is a trick to part 2, because mine takes 60s to run.

## Day 16 - Ticket Translation

Part 1 seemed relatively easy again (33 minutes) but I think part 2 took a little longer, unfortunately I didn't take the time on that one.

## Day 17 - Conway Cubes

Oh, Game of Life again. Reading my IRC backlog, I was not happy or impressed and decided to only do this after work, not in the morning.
I didn't take note how long part 1 took, but part 2 took  about 55 minutes, so I guess part 1 also took between 30 and 60 minutes.
Execution times for these are slow (2s and 96s), so I want to revisit this with one optimization I have in mind.

## Day 18 - Operation Order

I think the correct solution would be to build a proper parser but I wasn't in the mood for fiddling around with that so I solved it with regex.
Still took a while because I made a few silly mistakes. Part 2 took one hour.

## Day 19 - Monster Messages

Part 1 was fun, I wrote a regex compiler. Didn't attempt part 2 due to time constraints again.
Unfortunately my solution is a bit slow (50ms incl. python startup) whereas most other days only take 25-35ms.

## Day 20 - Jurassic Jigsaw

This was a lot more annoying and tedious than I had thought at first. Took me quite a while to solve. My ideas for part 1 weren't completely off,
but I guess I was inspired a little by skimming the IRC backlog. I'd still say I solved it on my own for the most part. Then I spent quite a while
trying part 2 but my head wasn't agreeing on thinking that day, so I didn't finish it.

## Day 21 - Allergen Assessment

This took a while because I wasn't using sets. But part 2 only took 7 minutes then because I started to clean up what I had instead of reading part 2.
Should've been less than 3 I guess...

## Day 22 - Crab Combat

Part 1 was really easy, 8 minutes. But then I looked at part 2 and decided to not waste time on this.

## Day 23 - Crab Cups

I took a few detours but finished part 1 in 72 minutes. Then in the evening I had an idea for part 2 but wasted hours failing to implement it.
I still think my idea is mostly correct, but I need to revisit this.

## Day 24 - Lobby Layout

Because of a stupid parsing bug that I discovered too late part 1 took 66 minutes, and because of some bad experience with dicts in python I went the
very slow but safe route and thus my part 2 takes 15 seconds to finish. Need to revisit this and try one optimization trick.
Or maybe: remove my pessimization "trick". Solving part 2 took 52 minutes.

## Day 25 - Combo Breaker

Oh boy, that day was the first time in 50 days I was actively mad at the puzzle author. Apparently there were two things that came together:
I didn't read (or understand) the puzzle correctly and so I thought I needed to find the subject number and the given was just an example.

That wouldn't have been so bad because my solution accounted for that (just a loop around everything, slow but correct) - but the second thing
was that this puzzle was probably supposed to be "bruteforced" to a certain degree, and so I simply stopped my running generic solution
several times because it took too long to run.

Once I had glanced at a solution because I was annoyed enough I saw that mine was actually correct, so I plugged in the known subject number and
let it run for 15 seconds and had my correct result.

So yes, of course it's my own fault, but my algorithm was correct in the first place and I wasted a lot of time, only because I didn't want to look at others' solution.
Can't measure time, but had I read it correctly, definitely below 1 hour. Also from what I read I was far from the only problem misunderstanding
the given number as an example and bruteforcing this one as well, as it's really doable on moderately fast hardware.


## Open TODOs

  * Try to get the missing stars
  * I really want to speed up a few of my solutions
  * I might try redoing all of them in a second language


## The end

Another year wrapped up, I had a lot of fun again. It was easier than last year,
but I am super happy I didn't have to spend so much time on getting to roughly the
same result, i.e. 90% completion.

Again, many thanks to the people in #lobsters-advent on Freenode, we had interesting
discussions, helped some, got help by some and overall had a pretty fun time there, I think.

A few things I noticed, in no particular order:

  * This was easier than last year, but not completely easy
  * I still make a lot of stupid mistakes
  * The examples are tremendously helpful
  * I don't think I'll ever be a really fast competitive coder
  * Some problems were SO MUCH easier because I did last year's puzzles
  * Python is kinda good for this

## Appendix 1 - My scores

<pre>
      --------Part 1--------   --------Part 2--------
Day       Time   Rank  Score       Time   Rank  Score
 25   16:38:16  10815      0          -      -      -
 24   04:49:01   6304      0   05:43:24   5673      0
 23   04:32:43   5932      0          -      -      -
 22   04:41:07   8298      0          -      -      -
 21   10:21:08   8603      0   10:28:39   8306      0
 20   12:58:27   9174      0          -      -      -
 19   07:07:14   7068      0          -      -      -
 18   06:02:02   9832      0   07:07:41   8782      0
 17   10:11:06  12078      0   11:05:30  11791      0
 16   03:42:55  10456      0   09:33:01  11968      0
 15   04:45:21  13157      0   05:01:59  11581      0
 14   05:23:19  13112      0          -      -      -
 13   05:33:38  16323      0   18:58:52  20144      0
 12   03:24:47  10414      0   03:57:55   9099      0
 11   03:21:04  11101      0   04:56:02  10654      0
 10   03:20:46  17279      0   11:55:31  20904      0
  9   03:45:50  18538      0   03:55:53  16723      0
  8   01:52:35  12259      0   02:42:13  11727      0
  7   02:13:51   9452      0   03:08:32   9004      0
  6   04:26:47  20665      0   05:18:12  21331      0
  5   04:40:12  18957      0   04:46:23  17794      0
  4   13:31:12  48151      0   14:12:31  39562      0
  3   02:31:56  15312      0   02:36:33  13956      0
  2   02:28:28  13739      0   02:34:01  12841      0
  1   02:20:34   9723      0   02:41:57   9822      0
</pre>

<p>&nbsp;</p>

That's 44 of 49 stars. No part 1 missing, but 5x part 2.
Two of those I never tried, and for three I gave up after trying.
No completions > 24h later this year (as of writing this post).
Interestingly the exact same number as last year, if I don't count
submissions past Dec 25th.

I really don't like that the personal leaderboard only has the global
timestamp, that's why tried to write down my personal completion times,
as I didn't get up at 6 am a single time for this this year. I did get up
an hour earlier to have an hour before work on a few days, that's all the
submissions in the 1-4 hour brackets.

