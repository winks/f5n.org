+++
draft = false
title = "Development and Proxies"
date = 2022-01-21T07:30:49Z
+++

I'm in the unfortunate circumstance to be using a mandatory proxy these days
(including SSL) and unlike with browsers where it's kind of fire and forget,
if you're developing software there's a plethora of tools that will or will
not accept the default environment variables, so here's a list of stuff and
how to fix it.

### Linux environment variables

The usual proxy variables:

```
PROXY="http://proxy.local:8080"

export http_proxy="$PROXY"
export HTTP_PROXY="$PROXY"
export https_proxy="$PROXY"
export HTTPS_PROXY="$PROXY"

export no_proxy='localhost,127.0.0.1,*.localstuff.example.org'
export NO_PROXY='localhost,127.0.0.1,*.localstuff.example.org'
```

Interestingly the internet seems to agree or disagree if it's the uppercase
version or the lowercase version. I think there's no harm in setting all of
them and just not thinking about it anymore.

Fortunately this solves the issues for all tools and package managers that
use `curl` under the hood.

I've since configured these additional ones:

### nix-pkgs

```
MY_CA_CERT=/foo/my-cert.crt

export NIX_SSL_CERT_FILE="$MY_CA_CERT"
```

Although on my current machine I actually have it set
to `/etc/ssl/certs/ca-certificates.crt`

### Ubuntu/Debian

As an aside, on Ubuntu you can trust your org's CA cert like this:

```
$ sudo cp MyOrgCA.crt /usr/local/share/ca-certificates/MyOrgCA.crt
$ sudo update-ca-certificates
```

### RedHat/CentOS/AmazonLinux

This should work on all RH flavours:

```
$ sudo cp MyOrgCA.crt /etc/pki/ca-trust/source/anchors/
$ sudo update-ca-trust extract
```

### elixir/mix

So this week I tried to install the [Phoenix][phx] framework and that was a journey.

Apparently [kerl][kerl] and [kiex][kiex] work with curl, so that was no problem.

The fun started with `mix` where I think it's not documented properly, or at
least their docs aren't ranking high enough, so I first arrived at

`export HEX_UNSAFE_HTTPS=1`, which is a **bad idea**, so don't do that.

The actual solution seems to be:

```
export HEX_CACERTS_PATH="$MY_CA_CERT"
```

But then the next riddle came up, `mix phx.server` in Phoenix's hello world
example seemed to be downloading stuff from the npm registry.

I mean, it kinda makes sense to have
some JS dependencies for a web project, but it was still a bit weird.

Asking in `#elixir` on IRC gave me the answer though that this was an `esbuild`
watcher that was being started, probably to minify some assets or whatever.

### nodejs

OK, `esbuild`, that's `nodejs` you might think, there's a variable for that:

```
export NODE_EXTRA_CA_CERTS="$MY_CA_CERT"
```

Just that it didn't help, for whatever reason. I didn't feel like debugging
why it didn't pick up the variable if there was another way.

As I am writing this, there's still an open issue in this esbuild 
module for Phoenix, [#31](https://github.com/phoenixframework/esbuild/issues/31).

I used the workaround described there, installing esbuild by hand and then
doing

```
# I do not like install -g
npm install esbuild 
export MIX_ESBUILD_PATH=$(readlink -f node_modules/.bin/esbuild)
```

but then you need to add this to `config/config.exs`:

```
config :esbuild,
  version: "0.14.0",
  path: System.get_env("MIX_ESBUILD_PATH")
```

But it worked, so it's fine.

### erlang/rebar3

Update: Two weeks later I ran into the same problem with erlang's package
manager `rebar3`, but from 3.17 on you can put this:

```
{ssl_cacerts_path, ["/opt/foo.crt"]}.
```

into your `~/.config/rebar3/rebar.config` and it works.

### Docker

Oh, and of course Docker also doesn't work properly behind such a proxy,
so I did this, although there should be other solutions:

```
$ cat /etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=http://proxy.local:8080"
Environment="HTTPS_PROXY=http://proxy.local:8080"
Environment="NO_PROXY=localhost,127.0.0.1,*.localstuff.example.org"
```

but I've not run into problems without the last line yet, as I don't use
a local registry.

You also might need to tweak DNS for Docker:

```
$ cat /etc/docker/daemon.json
{"dns":["10.0.0.10","9.9.9.9"]}
```

A quick way to test is running:

```
$ docker run busybox nslookup example.org
```


### git

And finally there's git, put this into `~/.gitconfig`:

```
[http]
        proxy = http://proxy.local:8080

[https]
        proxy = http://proxy.local:8080
```

### Python/Pip

```
pip install --cert=/foo/my-cert.crt PACKAGE
```


### Rust/cargo

I've also had problem with Rust's `cargo`, where solution is supposed to be

```
[http]
proxy = "proxy.local:8080"
debug = true
cainfo = "/foo/my-cert.crt"
```

in e.g. `~/.config/cargo.toml` ([docs][rustdocs]) but I didn't get this
to work, but it is supposed to fall back to one of these:

```
CARGO_HTTP_PROXY
HTTPS_PROXY
https_proxy
http_proxy
```

and that worked, although cargo is unusually slow.

### Gradle

For gradle, you need to put these lines into `~/.gradle/gradle.properties`:

```
systemProp.http.proxyHost=proxy.local
systemProp.http.proxyPort=8080
systemProp.https.proxyHost=proxy.local
systemProp.https.proxyPort=8080
```

### Maven

Maven needs this in `~/.m2/settings.xml`:

```
<settings>
  <proxies>
   <proxy>
      <id>http-proxy</id>
      <active>true</active>
      <protocol>http</protocol>
      <host>proxy.local</host>
      <port>8080</port>
      <nonProxyHosts>*.localstuff.example.org|localhost|127.0.0.1</nonProxyHosts>
    </proxy>
   <proxy>
      <id>https-proxy</id>
      <active>true</active>
      <protocol>https</protocol>
      <host>proxy.local</host>
      <port>8080</port>
      <nonProxyHosts>*.localstuff.example.org|localhost|127.0.0.1</nonProxyHosts>
    </proxy>
  </proxies>
</settings>
```

### Java

Finally, for every JVM you use you need to add the cert to the key store, if that's applicable:

For a .crt this is usually done via:

```
keytool -importcert -alias asdf -keystore $JAVA_HOME/jre/lib/security/cacerts -storepass changeit -file cert.crt -noprompt
```

For GraalVM the path is slightly different:

```
keytool -importcert -alias asdf -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit -file cert.crt -noprompt
```


And yes, none of this is breaking news, but before I have to put everything
together again the next time I'd rather have a consolidated page.

Maybe I'll run into more and make this continually updated, as I had to with
the [default browser post](https://f5n.org/blog/2013/default-browser-linux/).

[phx]: https://www.phoenixframework.org/
[kerl]: https://github.com/kerl/kerl
[kiex]: https://github.com/taylor/kiex
[rustdocs]: https://doc.rust-lang.org/cargo/reference/config.html
