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

## Day 1

Easy start, don't remember if I did it in C++ first (probably), but I also did a solution in Crystal (part 1 and 2 in both languages).

## Day 2

Now this was a bit of a surprise, building a virtual machine. Did this in C++ first, later added a TypeScript version on day 12 (part 1 and 2, although I guess solving part 2 via brute force the solution is a loop in shell...)

**intcode part 1**

## Day  3

Only managed to do part 1 on that day (in C++), but I iirc I had coded 1.1, 1.2, 2.1 and 2.2 on the same day.
I rewrote part1 in Nim then on day 5, and also solved part 2 in Nim shortly after midnight.
I would later try to solve this one in pure Bash (on day 15). It was horrible, it's slow, but it was done.

## Day 4

Used Python3 for this one, solved it in reasonable time. Later did a C++ version of part 1, a Tcl version of part 1, and a PHP version of part 2 (on day 7).

## Day 5

Adding instructions to the intcode VM, did part 1 in the morning and part 2 on lunch break. C++, extending day 2.

**intcode part 2**

## Day 6

Used Python again and struggled for quite a bit, as I was traversing the graph in the wrong direction. After some hints to try the other direction, it went kind of quick. Part 2 solved 16 min after part 1, record time.
Also tried to rewrite in Clojure, but as of day 22, still not 100% done with part 1 (it's buggy).

## Day 7

This was a saturday so I solved this at around noon, part 2 only later. C++ again.

**intcode part 3**

## Day 8

Sunday, time to code. Finished part 1 in C++ before lunch, part 2 45min later. Then did a Common Lisp version that surprisingly only took less than 4h (going by commit time now).

## Day 9

OK, no idea why exactly I didn't solve this until the 11th, but I think it was because I was out with friends on day 9 and day 10. C++ again.
I would later rewrite the day 9 version of the intcode VM in Java (for day 21) because I wasn't happy with the software architecture and apparently had some bugs. It took 2h, should've done that earlier, no matter in what language.


**intcode part 4**

## Day 10

Another slow solve, done on day 13 in Python after spending a lot of hours searching for ideas and going in the wrong direction. First time not having fun at all.

## Day 11

Oh yeah, that was a fun day. I had broken my VM and had to use someone else's to write the actual day 11 code. https://github.com/winks/adventofcode/commit/9247215a10239e6cfc6f7d43648ad4b169d737c1
The solution went surprisingly quick. Fixed my VM on day 13.

**intcode part 5**

## Day 12

Was on vacation that day. The solution for part 2 took quite some time, but part 1 was ok I think. Used Lua(JIT) for this, that was fun.

## Day 13

Breakout! That was awesome. C++.

**intcode part 6**

## Day 14

Used Python and again hit some sort of road block until I got a clue, again to start from the other side. My solution was good for part 1, but very, very slow. So again I borrowed someone's part 1 solution in order to be able to do part 2. Half-cheating, maybe.
Rewrote this from scratch in Perl on day 16 and apparently made the same mistake, it's just as slow. Need to revisit.

## Day 15

I totally failed at BFS. I don't like mazes and this was the first time I ever tried to write path-finding code. Not fun, not my thing. Still managed to solve part 1 with luck and then manual counting of steps on the discovered map. Part 2 is unsolved as of day 22.
C++ again.

**intcode part 7**

## Day 16

Used Ruby for this one. Solved part 1, but executing it took roughly 50min on a slow server. I think I actually manage to cycle to work while it ran and then also started it on my laptop, just in case.
Part 2 was a lot harder, spent the whole evening on this but I had a good idea in the end. I did have to look up someone else's solution to fix an off-by-one error. Still counts, I guess.

## Day 17

C++ again for this one. Solved part 1 in record time (for me) 1:32h after in unlocked. I think I got up pretty early, but still only ~1h. But then I totally misunderstood part 2, and struggled for a while until I got a hint how to read the problem description.
In the end I didn't write the compressor (as of day 22) but as my instructions were correct, I manually compressed it in ~5 minutes on a sheet of paper. Good enough for me.

**intcode part 8**

## Day 18

Mazes again :( Tried in Python (my most productive language I guess) but still unsolved as of day 22.

## Day 19

This was a fun one. Started very late in the evening because I was sick that day and had slept ~6h but it didn't take really long for part 1, and then even managed to solve part 2, submitted my result and went straight back to sleep. Would not recommend.

**intcode part 9**

## Day 20

Mazes again :(( But after finding a BFS implementation in Python I actually kinda solved this one pretty quickly. Had the right idea about the portals and that was that. Tried to solve part 2 for quite a bit with no result.

## Day 21

This is where I noticed that my VM is beyond redemption. I was asking people how I should jump over 8 wide holes and the widely accepted answer was that there should only be 1-3 wide holes.
Quickly rewrote the VM, came to the part where you need to do the Boolean math and kinda failed. Could've done without the shortening I guess.. Had to look up the solution.
But at least that gave me enough ideas to solve most of part 2 on my own. So this was done in Java, actually.

**intcode part 9**

## Day 22

Finally felt confident enough to use Rust, and managed to solve part 1 after 2h. Part 2 proved to be trickier, really, really tricky indeed.
It was to be known as the mathiest problem of this year and in the end I gave up and copied a solution. I am 100% sure I would've never discovered this.

## Day 23

Got up at 6, used my shiny new Java VM, made a few stupid mistakes, still managed to get my first place under 1000 after 1h 57min.
And then I totally messed up part2 and only managed to finish it in the evening after rewriting my code completely for 3 times.
It was too easy to be true... Started porting my Day 10 code to Julia and finished part 1.

**intcode part 10**

## Day 24

Oh, Game of Life. Not sure I ever did one before. Part 1 was pretty easy and besides a few stupid mistakes it went smooth.
First submission in under an hour leaderboard time, ~49 minutes after getting up, rank 848. This reminded me of Day 20 and so I had a solution after 2:32h, leading me to rank 670.
Had some time, so did 4.1 in PHP, 4.2 in Tcl and started 22.1 in C. Oh, and 1.1 + 1.2 in PowerShell.


## Day 25

Oh, a text adventure, neat. At first I wanted to do it automatically (not like day 15 where I started with manual input) but when I noticed that the rooms are not evenly spaced.
So I did go the manual route again and drew a map on paper. Then I noticed what I will call my personal bug of the year 2019, including all work stuff.
In this problem you're supposed to walk through some rooms, pick up some good items, avoid some bad items and in the end have the correct items.
So everything seemed to work - I could traverse the rooms in any order, I could get to the last room with the check... but I didn't find a single item to pick up.
After a while of being astonished I asked for someone else's input with an exact location of an item and tried that - same result.
That means I had a bug in my IntCode VM that did not trigger on Day 09, Day 21, or today - with the exceptions of the items.
I was a little frustrated after a while and asked on Reddit, then got back to my C++ IntCode VM and tried that.
Sadly (obviously) it still had the other weird bug, the one that surfaced on Day 21 and which prompted the rewrite, and it kept crashing.
But after a while I fixed those bugs and could finally walk through my rooms, grab the items and then tried the correct solution with pen and paper.
After I found this, the folks on Reddit pointed me to the correct location and after only a few minutes of thinking I could fix it.
And then finally I was a little surprised that the 50th star, for Day 25 Part 2, is only awarded if you have 49 stars, so everything solved.
Apparently that's the case every year...

**intcode part 11**

## Day 26 and beyond

As I'm writing this on the 27th, I've finished a lot of TODOs but still have a few things open.

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

What they all have in common (Exception: Day 06) is that they are maze/path-finding problems. I'm really bad at BFS/DFS, so I need to read up first.

#### Cancelled TODOs

  * Get to 25 languages, 20 is enough

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

  * **Bash**: Not fit for writing proper software. EOD.
  * **C**: Not my cup of tea
  * **C++**: Surprisingly good to use if you're not a total beginner. stdlib is still new to me. Bit unwieldy for quick solutions.
  * **Clojure**: Didn't use it for too long.
  * **Common Lisp**: Surprisingly nice, after an hour of warming up to it
  * **Crystal**: Very much like Ruby, I think. A few odd differences. Don't forget to compile, or it's really slow :P
  * **D**: Overall really nice, but Ranges are weird. Or maybe I hate lazy stuff that's not as transparent as in Clojure
  * **Go**: Still a really good language to quickly solve problems.
  * **Java**: If you don't forget to use `.equals()` instead of `==`... I was surprised how quick it was to write without proper tooling.
  * **Julia**: Probably really good for Data Science, but being 1-indexed and subtly different than Python while looking very alike.. not my thing.
  * **Lua**: Still awesome and fun to use.
  * **Nim**: Surprisingly straightforward to use. A few odd things, but overall really nice.
  * **Perl**: Nope, never liked it and probably won't. Hash references are the worst. So much fiddling.
  * **PHP**: If you don't really use it for a few years, the struggle to remember needle/haystack order is real.
  * **PowerShell**: A lot nicer than bash, but I don't think I want to write real software with this. Kinda ok for scripts.
  * **Python3**: Default language for quick results for me. No surprises, even though I never really used Python**3**.
  * **Ruby**: I don't really know Ruby, but it's easy enough to get results.
  * **Rust**: This went with a lot less pain than I anticipated. The borrow checker liked me this time.
  * **Tcl**: Not my favorite language, but it gets the job done. Easy to pick up, just the syntax is a little odd.
  * **TypeScript**: Only ever wrote a few lines at work, it seems to be pretty usable. Definitely want to use it more.

## The end

Finally I want to say a huge thanks to the #lobsters-advent IRC channel where we talked a lot about Advent of Code and I got massive help in the
form of clues or having some stuff checked when it absolutely didn't make sense. Also it's just more fun if you have people to talk to.
In the end i think I finished 14th on our leaderboard, with 3 people from the channel way ahead of me, but I'm totally happy with my result.

## Some links:

  * [jjuran](https://github.com/jjuran/adventofcode/tree/master/2019) had to fix the language to solve the problems, that's hardcore
  * [tumdum](https://git.sr.ht/~ttt/aoc2019) had some really clean and readable solutions in Rust
  * [gerikson](http://gerikson.com/blog/comp/Advent-of-Code-2019.html) wrote a nice journal about AoC 2019
  * [gthm](https://github.com/gunnihinn/advent-of-code) inspired my rewrite of the intcode VM
  * [AoC subreddit](https://old.reddit.com/r/adventofcode/)

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

