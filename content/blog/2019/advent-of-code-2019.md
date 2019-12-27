+++
draft = false
title = "Advent of Code 2019"
date = 2019-12-27T21:45:00Z
+++


This is my first time taking part in the [advent of code](https://adventofcode.com), although I had heard about it earlier.

At first i thought I didn't have time, so I didn't start on day 1.
Apparently I first committed something on day 3, and my solutions for day 1 and 2 show > 24h for solving.

My goal was to use C++ with the stdlib because all I ever do at work is Qt and so I'm not really good with standard C++.
But I also thought it could be neat to try a few languages.

## Day 1 - The Tyranny of the Rocket Equation

Easy start, don't remember if I did it in C++ first (probably), but I also did a solution in Crystal (part 1 and 2 in both languages).

## Day 2 - 1202 Program Alarm

Now this was a bit of a surprise, building a virtual machine. Did this in C++ first, later added a TypeScript version for part 1 and 2, although I guess solving part 2 via brute force in a shell also works.

**intcode part 1**

## Day 3 - 1202 Program Alarm

Only managed to do part 1 on that day (in C++), but I iirc I had coded 1.1, 1.2, 2.1 and 2.2 on the same day.
I redid part 1 in Nim on day 5, and also solved part 2 in Nim shortly after midnight.
I would later try to solve this one in pure Bash (on day 15). It was horrible - it's slow and hard to grasp,
but I did it (after many hours of learning just how inflexible arrays in bash are).

## Day 4 - Secure Container

Used Python3 for this one, solved it in reasonable time.
Later did a Tcl version of part 1 and a PHP version of part 2 (on day 7).
Much later added part 2 in Tcl and part 1 in PHP (day 24)

## Day 5 - Sunny with a Chance of Asteroids

Adding instructions to the intcode VM, did part 1 in the morning and part 2 on lunch break. C++, extending the day 2 solution.

**intcode part 2**

## Day 6 - Universal Orbit Map

Used Python again and struggled for quite a bit, as I was traversing the graph in the wrong direction.
After some hints to try the other direction it went kind of quick. Part 2 solved 16 min after part 1, record time.
Also tried to rewrite in Clojure, but as of day 27, still not 100% done with part 1 (it's buggy).

## Day 7 - Amplification Circuit

This was a saturday so I solved this at around noon, part 2 only later. C++ again.
Here a little annoying trend surfaced for the first time.
Sometimes you'd need to reset the VM between runs and sometimes keep state.
Not really hard to do, but easy to mess up if you're extending your code and evolving it based on previous assumptions.

**intcode part 3**

## Day 8 - Space Image Format

Sunday, time to code. Finished part 1 in C++ before lunch, part 2 45min later.
Then did a Common Lisp version that surprisingly only took less than 4h (going by commit time now).
Looking back this was one of my favourite problems. Not too hard, not too fiddly.
But also not a real walk in the park. Also much more to what I am used to code,
compared of some of the other days that were *really* abstract for me.

## Day 9 - Sensor Boost

OK, no idea why exactly I didn't solve this until the 11th, but I think it was
because I was out with friends on day 9 and day 10. C++ again.
I would later rewrite the day 9 version of the intcode VM in Java (for day 21)
because I wasn't happy with the software architecture and apparently had some bugs.
It took 2h, should've done that earlier, no matter in what language.


**intcode part 4**

## Day 10 - Monitoring Station

Another slow solve, done on day 13 in Python after spending a lot of hours
searching for ideas and going in the wrong direction.
First time not having fun at all.

## Day 11 - Space Police

Oh yeah, that was a fun day.
I had broken my VM and had to use someone else's to write the actual day 11 code.
https://github.com/winks/adventofcode/commit/9247215a10239e6cfc6f7d43648ad4b169d737c1
The solution went surprisingly quick. Fixed my VM on day 13.
Also pretty close in spirit to day 08, imho.

**intcode part 5**

## Day 12 - The N-Body Problem

Was on vacation that day, so had some spare time.
The solution for part 2 took quite some time, but part 1 was ok I think.
Used Lua(JIT) for this, that was fun.

## Day 13 - Care Package

Breakout! That was awesome. C++.

**intcode part 6**

## Day 14 - Space Stoichiometry

Used Python and again hit some sort of road block until I got a clue,
again the solution was to start from the other side.
My solution was good for part 1, but very, very slow.
So again I borrowed someone's part 1 solution in order to be able to do part 2.
Half-cheating, maybe.
Rewrote this from scratch in Perl on day 16 and apparently made the same mistake, it's just as slow.
Finally solved (in Perl) on day 26 after consulting some other solutions and
doing a detailed analysis why mine was so slow.

## Day 15 - Oxygen System

I totally failed at BFS.
I don't like mazes and this was the first time I ever tried to write path-finding code.
Not fun, not my thing.
Still managed to solve part 1 with luck and then manual counting of steps on the discovered map.
Part 2 is unsolved as of day 27.
C++ again.

**intcode part 7**

## Day 16 - Flawed Frequency Transmission

Used Ruby for this one. Solved part 1, but executing it took roughly 50min on a slow server.
I think I actually managed to cycle to work while it ran and then also started it on my laptop, just in case.
Part 2 was a lot harder, spent the whole evening on this but I had a good idea in the end.
I did have to look up someone else's solution to fix an off-by-one error.
Still counts as solving it on my own, I guess, I didn't change anything meaningful in my code.

## Day 17 - Set and Forget

C++ again for this one.
Solved part 1 in record time (for me) 1:32h after in unlocked.
I think I got up pretty early, but still only ~1h.
But then I totally misunderstood part 2, and struggled for a while until
I got a hint how to read the problem description.
In the end I didn't write the compressor (as of day 22) but as my
instructions were correct, I manually compressed it in ~5 minutes
on a sheet of paper. Good enough for me.

**intcode part 8**

## Day 18 - Many-Worlds Interpretation

Mazes again :( Tried in Python (my most productive language I guess) but still unsolved as of day 27.

## Day 19 - Tractor Beam

This was a fun one.
Started very late in the evening because I was sick that day and had slept for
~16h but it didn't take really long to solve part 1, and then I even managed
to solve part 2, submitted my result and went straight back to sleep. Would not recommend.

**intcode part 9**

## Day 20 - Donut Maze

Mazes again :(( But after finding a BFS implementation in Python I actually
kinda solved this one pretty quickly.
Had the right idea about the portals and that was that.
Tried to solve part 2 for quite a bit with no result. Didn't revisit yet.

## Day 21 - Springdroid Adventure

This is where I noticed that my VM is beyond redemption.
I was asking people how I should jump over 8 wide holes and the widely
accepted answer was that there should only be 1-3 wide holes.
Quickly rewrote the VM, came to the part where you need to do the Boolean
math and kinda failed.
Could've done without the shortening I guess... Had to look up the solution.
But at least that gave me enough ideas to solve most of part 2 on my own.
So this was done in Java, actually.

**intcode part 9**

## Day 22 - Slam Shuffle

Finally felt confident enough to use Rust, and managed to solve part 1 after 2h.
Part 2 proved to be trickier, really, really tricky indeed.
It was to be known as the mathiest problem of this year and in the end I gave
up and copied a solution. I am 100% sure I would've never discovered this.

## Day 23 - Category Six

Got up at 6, used my shiny new Java VM, made a few stupid mistakes, still managed to get my first place under 1000 after 1h 57min.
And then I totally messed up part2 and only managed to finish it in the evening after rewriting my code completely for 3 times.
It was too easy to be true... Started porting my Day 10 code to Julia and finished part 1.

**intcode part 10**

## Day 24 - Planet of Discord

Oh, Game of Life. Not sure I ever did one before. Part 1 was pretty easy and besides a few stupid mistakes it went smooth.
First submission in under an hour leaderboard time, ~49 minutes after getting up, rank 848.
This reminded me of Day 20 and so I had a solution after 2:32h, leading me to rank 670.
Had some time, so did 4.1 in PHP, 4.2 in Tcl and started 22.1 in C. Oh, and 1.1 + 1.2 in PowerShell.


## Day 25 - Cryostasis

Oh, a text adventure, neat. At first I wanted to solve it automatically
(not like day 15 where I started with manual input) but then I noticed that the rooms are not evenly spaced.
So I did go the manual route again and drew a map on paper.
Then I noticed what I will call my personal bug of the year 2019, including all work stuff.

In this problem you're supposed to walk through some rooms, pick up some good
items, avoid some bad items and in the end have the correct items.
So everything seemed to work - I could traverse the rooms in any order, I
could get to the last room with the check... but I didn't find a single item to pick up.
After a while of being astonished I asked for someone else's input with an
exact location of an item and tried that - same result.
That means I had a bug in my IntCode VM that did not trigger on Day 09,
Day 21, or today - with the exceptions of the items.
I was a little frustrated after a while and asked on Reddit, then got back to
my C++ IntCode VM and tried that.
Sadly (obviously) it still had the other weird bug, the one that surfaced on
Day 21 and which prompted the rewrite, and it kept crashing.
But after a while I fixed those bugs and could finally walk through my rooms,
grab the items and then tried the correct solution with pen and paper.
After I found this, the folks on Reddit pointed me to the correct bug location
and after only a few minutes of thinking I could fix it.
And then finally I was a little surprised that the 50th star,
for Day 25 Part 2, is only awarded if you have 49 stars, so everything solved.
Apparently that's the case every year...

**intcode part 11**

## Day 26 and beyond

As I'm writing this on the 27th, I've finished a lot of TODOs but still have a
few things that I want to finish up before I end this chapter.

#### DONE after the event

  * Grabbed a 22.2 implementation, I have zero interest to solve this on my own
  * Rewrote 22.1 + 22.2 in C
  * Rewrote 16.1 + 16.2 in D
  * Finally fixed 10.2 in Julia. What a nasty bug to find. "negative value mod positive" in Julia returns a negative value, python makes it positive
  * Fixed my 14.1 in Perl to be fast enough for 14.2
  * Added a Makefile to most directories, mostly to document how to build/run those 20 languages
  * Rewrote 12.1 + 12.2 in Go
  * Added 2.2 in TypeScript
  * Tweaked my early C++ solutions (and some others) to consistently take the input file as the first CLI arg, not via stdin
  * Wrote down some basic benchmark numbers [for most solutions](https://github.com/winks/adventofcode/blob/master/2019/runtimes.md)

#### Open TODOs

  * Solve 15.1 properly in Java
  * Solve 15.2
  * Solve 20.2 (aka fix my WIP code and see if it works)
  * Solve 18.1 + 18.2
  * Fix 6.1 in Clojure, then do 6.2
  * Get that damn 50th star :)

What they all have in common (Exception: Day 06) is that they are
maze/path-finding problems. I'm really bad at BFS/DFS, so I need to read up first.

### Ideas, more than TODOs

I'm a little unhappy that I broke my self-imposed rules by copying someone
else's code for some days instead of writing my own, so there are some
languages where I might redo another day in that language, with my own code.
Not trying to reinvent everything, but at least only porting my own code.

  * Perl and Day 14, but it's not fun to use :P
  * D and Day 16. Might pick an easier day, but D is really ok.
  * Rust and Day 22. I think I aced part 1, but not part 2.
  * C and Day 22. Again Part 2 is not my code, so I want to do another day in C.
  * Have a go (no pun intended) at the Day 09 Intcode VM in a few more languages and setups.

#### Cancelled TODOs

  * [Get to 25 languages](https://github.com/winks/adventofcode/issues/1), 20 is enough
  * My Day 16 Part 1 is really horrible and slow, and I won't try to properly solve it
  * Day 21 Part 1 - My *code* is correct, but I cheated with the puzzle.

## Languages used:

  * Bash: day03
  * C: day22
  * C++: 1,2,3,5,7,8,9,11,13,15,17,19,25
  * Clojure: day06
  * Common Lisp: day08
  * Crystal: day01
  * D: day16
  * Go: day12
  * Java: 9, (15), 21, 25
  * Julia: day10
  * Lua: day12
  * Nim: day03
  * Perl: day14
  * PHP: day04
  * PowerShell: day01
  * Python3: 4, 6, 10, 14, (18), 0, 4
  * Ruby: day16
  * Rust: day22
  * Tcl: day04
  * TypeScript: day02

**Total: 20 languages**

## Learnings about the languages

  * **Bash**
    * Not fit for writing proper software. EOD.
    * I use Bash often, but usually not because I love it.
  * **C**
    * Not my cup of tea, and I don't really know it.
  * **C++**
    * Surprisingly good to use if you're not a total beginner. Bit unwieldy for quick solutions.
    * stdlib is still new to me.
  * **Clojure**
    * Didn't use it for too long. Would love to use it more.
  * **Common Lisp**
    * Surprisingly nice, after an hour of warming up to it.
    * Think I'd tried it once in the past.
  * **Crystal**
    * Very much like Ruby, I guess?. A few odd differences. Don't forget to compile, or it's really slow :P
  * **D**
    * Overall really nice, but Ranges are weird. Or maybe I hate lazy stuff that's not as transparent as in Clojure.
    * First time.
  * **Go**
    * Still a really good language to quickly solve problems.
    * Hadn't used it for ~2 years.
  * **Java**
    * If you don't forget to use `.equals()` instead of `==`...
    * I was surprised how quick it was to write without proper tooling, just VIM and tmux.
    * Not used for ~2.5 years.
  * **Julia**
    * Probably really good for Data Science, but being 1-indexed and subtly different than Python while looking very alike.. not my thing.
    * First time.
  * **Lua**
    * Still awesome and fun to use.
    * Not really used in a while.
  * **Nim**
    * Surprisingly straightforward to use. A few odd things, but overall really nice.
    * First time.
  * **Perl**
    * Nope, never liked it and probably won't. Hash references are the worst. So much fiddling.
    * Not used for non-one-liners in... forever.
  * **PHP**
    * If you don't really use it for a few years, the struggle to remember needle/haystack order is real.
  * **PowerShell**
    * A lot nicer than bash, but I don't think I want to write real software with this. Kinda ok for scripts.
    * First time not just changing a line.
  * **Python**
    * Default language for quick results for me. No surprises, even though I never really used Python**3** extensively yet.
  * **Ruby**
    * I don't really know Ruby, but it's easy enough to get results.
    * Also not used for years.
  * **Rust**
    * This went with a lot less pain than I anticipated. The borrow checker liked me this time.
    * Not used in a few months, still pretty much a beginner.
  * **Tcl**
    * Not my favorite language, but it gets the job done. Easy to pick up, just the syntax is a little odd.
    * First time.
  * **TypeScript**
    * Only ever wrote a few lines at work, it seems to be pretty usable. Definitely want to use it more.

## The end

Ok, so this is how I spent most of my spare time in December 2019.
I guess by using just one or two languages I could've saved massive amounts of time.
But where's the fun in that?

There are really a few lessons I took away

  * Read instructions carefully
  * Write 5 lines of a test harness code to quickly run your test inputs
  * Worse is better. Don't even try to structure at first, just solve it
  * Don't even try to compete with the fast people
  * I'm really not quick to code up solutions
  * I don't think I'm a really good coder, this is not what I do at work
  * This doesn't have much to do with software engineering, sans a few caveats when extending
  * Maybe I should really focus more on a few tools

Will I participate again next year? Maybe.

Finally I want to say a huge thanks to the #lobsters-advent IRC channel where we talked a lot about Advent of Code and I got massive help in the
form of clues or having some stuff checked when it absolutely didn't make sense. Also it's just more fun if you have people to talk to.
In the end i think I finished 14th on our leaderboard, with 3 people from the channel way ahead of me, but I'm totally happy with my result.

## Some links:

  * [jjuran](https://github.com/jjuran/adventofcode/tree/master/2019) had to fix the language to solve the problems, that's hardcore
  * [tumdum](https://git.sr.ht/~ttt/aoc2019) had some really clean and readable solutions in Rust
  * [gerikson](http://gerikson.com/blog/comp/Advent-of-Code-2019.html) wrote a nice journal about AoC 2019
  * [gthm](https://github.com/gunnihinn/advent-of-code) inspired my rewrite of the intcode VM
  * [AoC subreddit](https://old.reddit.com/r/adventofcode/)
  * [nitnelave/advent_of_code_2019](https://github.com/nitnelave/advent_of_code_2019) - 14 days, 14 languages
  * [kdheepak/awesome-advent-of-code](https://github.com/kdheepak/awesome-advent-of-code) - many repos, all the the languages
  * [bogdanp/awesome-advent-of-code](https://github.com/Bogdanp/awesome-advent-of-code/) - another list
  * [really expansive post about aoc and about solving all problems in Go](https://dhconnelly.com/advent-of-code-2019-retrospective.html)

## Appendix 1 - My scores

<pre>
      --------Part 1--------   --------Part 2--------
Day       Time   Rank  Score       Time   Rank  Score
 25   07:17:37   1411      0          -      -      -
 24   00:57:35    848      0   02:32:54    670      0
 23   01:57:11    919      0   14:21:51   2287      0
 22   03:03:04   1270      0       >24h   2222      0
 21   17:23:49   2652      0   18:09:25   2351      0
 20   07:38:16   1722      0          -      -      -
 19   14:40:16   3867      0   18:44:10   3363      0
 18          -      -      0          -      -      0
 17   01:32:37   1771      0   15:56:28   3125      0
 16   03:46:54   2808      0   18:03:19   3388      0
 15   09:21:04   2806      0          -      -      -
 14   17:49:46   4837      0   19:51:49   4466      0
 13   05:18:30   4900      0   09:59:36   4323      0
 12   06:39:46   5491      0   12:05:28   4383      0
 11   03:13:20   3110      0   03:20:20   2877      0
 10       >24h  13355      0       >24h  10938      0
  9       >24h  13094      0       >24h  13060      0
  8   04:13:22   5674      0   05:04:49   5703      0
  7   06:43:14   6574      0   09:23:38   4617      0
  6   11:27:08  11745      0   11:43:15  10447      0
  5   03:06:15   4384      0   08:00:35   6755      0
  4   16:07:14  22517      0   17:21:01  21033      0
  3   16:08:54  18054      0       >24h  26882      0
  2       >24h  37905      0       >24h  41205      0
  1       >24h  56901      0       >24h  51381      0
</pre>

That's 45 of 49 stars, of which I got 44 including the submission of
25.1 - the official last puzzle. One day is missing completely, and two days
are missing part 2. And I finished only 22.2 after the 25th.

