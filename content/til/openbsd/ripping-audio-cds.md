+++
draft = false
title = "Ripping Audio CDs"
date = 2026-02-18T11:31:09Z
tags = ["openbsd"]
+++

For some reason or other I currently don't have a tower PC with a CD-ROM drive
connected, or even an available slot.

But I have this 2004 nx7010 laptop which has a hopefully functional CD Writer.

```
# dmesg | grep ^cd
```

Yep, it shows up. For some reason I have not yet found out you need to use
`cd0c` though and not `cd0`.

This just works, as `cdio` is preinstalled:

```
# sudo cdio -f cd0c cdrip
```

And then you have a couple of `track0x.wav`.

Unfortunately the `cddbinfo` instead of `cdrip` does not work anymore. Shame.

And while I have not tested it, writing them should work like this:

```
cdio -f cd0c tao -a -s auto *.wav
```

Bonus:

```
cdio -vv info
```

Source: https://daemonforums.org/showthread.php?t=6560

Addendum: Because that machine is slow I did the actual conversion on Linux:

```
for i in $(ls /data/mp3/wav/ALBUM/*wav); do
  echo $i;
  o=$(basename $i | sed 's,wav,flac,');
  ffmpeg -i $i $o;
 done

parallel -j 4 ffmpeg -i {} -qscale:a 0 {.}.mp3 ::: ./*.flac
```
Could've parallelized the first one if they were in the same dir, whatever.

According to [this page](https://trac.ffmpeg.org/wiki/Encode/MP3), the
`-qscale:a 0` is the `-V 0` arg to `lame`, aka: `VBR 220-260`, the best
that is not a fixed 320kbit/s bitrate.

`easytag` + gnudb works for tagging the FLACs, and they get copied to the MP3s.

Reference: [cdio man page](https://man.openbsd.org/OpenBSD-7.8/cdio)
