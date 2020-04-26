---
layout: post
title: "<b>Baby Step 1:</b> Learning to crawl"
description: "Learn some basic housekeeping commands."
summary: "Learn some basic commands and how they are strung together."
comments: false
tags: [commands,docker,housekeeping,navigation]
---

Let's first cover the *Docker* basics you may need to support your out-of-control `*nix` habit. Firstly, *macOS* folks (and *Windows* folk unfamiliar with CLI):

> ***NOTA BENE!***<br />
> Since *macOS* ***is*** `*nix`, ***pay careful attention to the prompt***, to know whether you are ***inside*** your container ... or ***outside*** it (i.e. on your own machine).

Your *macOS* terminal prompt looks something like this:
```
<your_user_name>@<your_hostname> <current_folder> %
```

(And for completeness, the *Windows* command prompt looks something like this:)
```
C:\WINDOWS>
```

If you're inside your `rootlifted/n4h` *Docker* container, the prompt will ***always*** start with `root` followed by `@<contained_id>` (twelve hexadecimal digits):
```
root@c80c5927c652:/#
```

With that out of the way let us cover a few Docker housekeeping essentials, on the CLI (`Terminal` in *macOS* and `Command Prompt` in *Windows*) ***outside*** your container, this is how you list docker containers:
```
C:\WINDOWS>docker container ls -a 
CONTAINER ID   IMAGE            COMMAND       CREATED        STATUS                      PORTS   NAMES
db2bbf2f9467   rootlifted/n4h   "/bin/bash"   12 hours ago   Exited (0) 57 seconds ago           n4h_sandbox
```
`CONTAINER ID` is (as previously discussed) the twelve hex digit unique identifier *Docker* uses internally to identify your container. However you can use either that, or the more user friendly `NAMES` field when talking to *Docker* about your container.

\[Continue Writing Here\]