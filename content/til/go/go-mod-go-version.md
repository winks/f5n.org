+++
draft = false
title = "go.mod - go version"
date = 2025-10-19T21:44:23Z
tags = ["go"]
+++

The `go` version in `go.mod`, i.e. `go 1.17` does NOT work like in Rust or
Java - it's not "using the installed compiler to produce something somehow
backwards compatible".

I found this out by seemingly rebuilding an old project with an old directive
with a new installed `go` binary.

Turns out it will apparently download that old compiler and compile it like
it is written there - including all old security vulnerabilities.

So I guess updating that `go 1.x` line from time to time makes a lot of sense.
