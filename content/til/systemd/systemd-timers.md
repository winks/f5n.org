+++
draft = false
title = "systemd timers"
date = 2026-01-12T23:01:16Z
tags = ["systemd"]
+++

This arch box does not have cron installed so I tried systemd timers for the first time.

First I planned to do a user service, but this seems to
[have problems](https://wiki.archlinux.org/title/Systemd/User#Automatic_start-up_of_systemd_user_instances).

It needs two files, one `.service` and one `.timer`.
```
$ cat /etc/systemd/system/my-service.service

[Unit]
Description=Runs my-service
Wants=my-service.timer

[Service]
Type=oneshot
ExecStart=/bin/uv run --with numpy /usr/local/bin/my-service.py -1

[Install]
WantedBy=multi-user.target
```

```
$ cat /etc/systemd/system/my-service.timer

[Unit]
Description=Runs my-service
Requires=my-service.service

[Timer]
Unit=my-service.service
OnCalendar=*-*-* *:45:00
```

```
# this is enough to make it run on a timer
systemctl start my-service

# enable after boot
systemctl enable my-service

# show installed
systemctl list-timers

# run after changes
systemctl daemon-reload

# show log
journalctl -xe -u my-service
```
