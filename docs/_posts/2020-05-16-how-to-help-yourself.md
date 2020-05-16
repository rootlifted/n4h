---
layout: post
title: "Baby Step 3: How to help yourself"
description: "<b>Baby Step 3:</b> How to help yourself"
summary: "How to to find help on commands and their usage."
comments: false
tags: [basic nix,built-ins,commands,enable,help,man]
---

So now that we can:
* Clear the screen
* Display the present working directory
* List the contents of said directory
* Change to other directories

And before we continue to learn how to:
* Display/Sort/Summarise files
* Create/Copy/Move/Delete files/folders
* Filter/Transform file contents

It may be prudent to empower you to find the information you're looking for, faster than opening a browser and typing a query into a search engine.

`<digression>`

Just to be clear, this entire effort *assumes* reasonably up-to-date versions of GNU [coreutils](https://en.wikipedia.org/wiki/GNU_Core_Utilities), which you *absolutely* have in your `n4h` container, and is almost certainly present on most modern corporate Linux servers (like [RedHat Enterprise Linux](https://en.wikipedia.org/wiki/Red_Hat_Enterprise_Linux) or [Ubuntu](https://en.wikipedia.org/wiki/Ubuntu)) in your employer's data-centre.

However I *know* from personal experience, that there are some dark, *unspeakably* filthy corners in companies that I have worked for, that probably right now still have dust-caked [Solaris](https://en.wikipedia.org/wiki/Solaris_(operating_system)) 9, [HP-UX](https://en.wikipedia.org/wiki/HP-UX) 10, [AIX](https://en.wikipedia.org/wiki/IBM_AIX) 6 or [FreeBSD](https://en.wikipedia.org/wiki/FreeBSD) 9 servers in racks that they don't even know they own.

Also there are are some exotic special flavours of `*nix` like:
* [macOS](https://en.wikipedia.org/wiki/MacOS) (Apple took BSD and *obviously* diverged on their own weird tangent for two decades now)
* [OpenBSD](https://en.wikipedia.org/wiki/OpenBSD) (BSD that has been heavily security audited and nearly rebuilt)
* [Android](https://en.wikipedia.org/wiki/Android_(operating_system)) (Google uses [ToyBox](https://en.wikipedia.org/wiki/Toybox) as a pared down substitute of coreutils),
* [JunOS](https://en.wikipedia.org/wiki/Junos_OS) and Cisco [IOS](https://en.wikipedia.org/wiki/Cisco_IOS) (Enterprise/Telco Switchgear)

So considering the proliferation of `*nix`, as is clearly illustrated by these two family trees:
* [`*nix`](https://en.wikipedia.org/wiki/Unix-like#/media/File:Unix_history-simple.svg),
* [Linux](https://en.wikipedia.org/wiki/File:Linux_Distribution_Timeline.svg)

...trying to achieve a one-size-fits-all is simply impossible.

`</digression>`

Sorry, I digress.

The command below is the `*nix` online reference **`man`**ual:
<pre>
root@f749d99eff10:/usr/bin# <b>man</b>
What manual page do you want?
root@f749d99eff10:/# <b>&block;</b>
</pre>
The default *Docker* ubuntu image does not include it, to save space (since containers are not generally used to teach `*nix`) :P
So, if you are toying around on a *Docker* image that isn't an `n4h` image, you'll typically see this:
<pre>
root@280ba15a0522:/# <b>man</b>
This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, including manpages, you can run the 'unminimize'
command. You will still need to ensure the 'man-db' package is installed.
root@280ba15a0522:/#<b>&block;</b>
</pre>

But on most interactive (i.e. non-containerised) installations man pages are installed. So if you enter **`man ls`**, you will see this:
<pre>
LS(1)                                                                   User Commands                                                                  LS(1)

NAME
       ls - list directory contents

SYNOPSIS
       ls [OPTION]... [FILE]...

DESCRIPTION
       List information about the FILEs (the current directory by default).  Sort entries alphabetically if none of -cftuvSUX nor --sort is specified.

       Mandatory arguments to long options are mandatory for short options too.

       -a, --all
              do not ignore entries starting with .

       -A, --almost-all
              do not list implied . and ..

       --author
              with -l, print the author of each file

       -b, --escape
              print C-style escapes for nongraphic characters

       --block-size=SIZE
              scale sizes by SIZE before printing them; e.g., '--block-size=M' prints sizes in units of 1,048,576 bytes; see SIZE format below

       -B, --ignore-backups
              do not list implied entries ending with ~

       -c     with  -lt:  sort  by, and show, ctime (time of last modification of file status information); with -l: show ctime and sort by name; otherwise:
              sort by ctime, newest first

       -C     list entries by columns

       --color[=WHEN]
              colorize the output; WHEN can be 'always' (default if omitted), 'auto', or 'never'; more info below

       -d, --directory
              list directories themselves, not their contents

       -D, --dired
              generate output designed for Emacs' dired mode

       -f     do not sort, enable -aU, disable -ls --color

       -F, --classify
              append indicator (one of */=>@|) to entries
--More--
</pre> 

...continue writing here...