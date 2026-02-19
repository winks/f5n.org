+++
draft = false
title = "Junctions on NTFS"
date = 2026-02-07T23:45:43Z
tags = ["windows"]
+++

In older Windows versions you had to download Sysinternals' `junction.exe` in
order to create symlinks/hardlinks.

Apparently the first positive thing about Windows 11 is that this is now
included, but of course in the worst possible syntax.

```
New-Item -Type Junction -Value C:\target -Path .\new-name
```

To look at them:

```
Get-ChildItem -Attributes ReparsePoint
```

Remove with `Remove-Item`.
