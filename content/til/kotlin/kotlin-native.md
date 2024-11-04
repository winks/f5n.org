+++
draft = false
title = "KotlinNative"
date = 2024-11-04T23:14:48Z
tags = ["kotlin"]
+++


While learning Kotlin I had brief look at KotlinNative.

The main downsides I see (currently) are:

  * no access to the Java ecosystem of libraries, not even basic ones like `java.util.File`
  * no static binaries

For even the most basic file access it seems you need a library like Square's okio.

```
implementation("com.squareup.okio:okio:3.9.1")
``

I tried to build a minimally viable `cat` binary and it looks like this:

```kotlin

import okio.*
import okio.Path.Companion.toPath

fun readLines(path: Path, numberAllOpt: Boolean, numberNonBlankOpt: Boolean) {
    var i = 1
    FileSystem.SYSTEM.source(path).use { fileSource ->
        fileSource.buffer().use { bufferedFileSource ->
            while (true) {
                val line = bufferedFileSource.readUtf8Line() ?: break
                when (line.trim()) {
                    "" -> {
                        if (numberAllOpt) {
                            val ii = i.toString().padStart(6, ' ')
                            println("$ii  $line")
                            ++i
                        } else {
                            println(line)
                        }
                    }
                    else -> {
                        if (numberAllOpt || numberNonBlankOpt) {
                            val ii = i.toString().padStart(6, ' ')
                            println("$ii  $line")
                        } else {
                            println(line)
                        }
                        ++i
                    }
                }
            }
        }
    }
}

fun main(args: Array<String>) {
    if (args.isEmpty()) {
        return
    }
    val numberAllOpt = args[0] == "-n"
    val numberNonBlankOpt = args[0] == "-b"
    val file = if (numberAllOpt || numberNonBlankOpt) args[1] else args[0]
    val abs = ".".toPath().resolve(file)
    readLines(abs, numberAllOpt = numberAllOpt, numberNonBlankOpt = numberNonBlankOpt)

```

So basic Kotlin, but all the heavy lifting done by okio.

Links: [Okio](https://square.github.io/okio/) - [Kotlin Multiplatform](https://kotlinlang.org/docs/multiplatform-intro.html)

