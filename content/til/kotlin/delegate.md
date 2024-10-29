+++
draft = false
title = "Delegates and observable properties"
date = 2024-10-24T23:23:23Z
+++


```kotlin
// User.kt
import kotlin.properties.Delegates

class User {
    var name: String by Delegates.observable("<no name>") {
        prop, old, new ->
        println("$old -> $new")
    }
}

fun main() {
    val user = User()
    user.name = "first"
    user.name = "second"
}

// # output:
// <no name> -> first
// first -> second
```

Docs: [Observable properties](https://kotlinlang.org/docs/delegated-properties.html#observable-properties)

Source: [7 Features in Kotlin's Standard Library that You Might Have Overlooked](https://www.youtube.com/watch?v=OFWMtmqocV8)