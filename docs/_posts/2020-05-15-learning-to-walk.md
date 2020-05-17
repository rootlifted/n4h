---
layout: post
title: "Baby Step 2: Learning to walk"
description: "<b>Baby Step 2:</b> Learning to walk"
summary: "Learn some basic commands and how they are strung together."
comments: false
tags: [basicnix,cd,clear,ls,path delimiter,pwd]
---

Right. Now that you have downloaded, installed and learnt the rudiments of our chosen containerisation solution, called *Docker*, we are ready to step into the vast ocean of `*nix`.

You may recall that shortly after completing your *Docker* installation, you were instructed to execute a command (**`ls -l`**) to confirm that your new `n4h_sandbox` container was correctly created and working. Let's start the `n4h_sandbox` container, attach to it, and repeat this command:
<pre>
user@host ~ % <b>docker container ls -l</b>
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                   PORTS               NAMES
<b>f749d99eff10        rootlifted/n4h</b>      "/bin/bash"         2 weeks ago         Exited (0) 13 days ago                       <b>n4h_sandbox</b>
user@host ~ % <b>docker container start n4h_sandbox</b>
n4h_sandbox
user@host ~ % <b>docker container attach n4h_sandbox</b>
root@f749d99eff10:/# <b>ls -l</b>
total 72
drwxr-xr-x   1 root root 4096 Apr 25 20:46 bin
drwxr-xr-x   2 root root 4096 Apr 24  2018 boot
drwxr-xr-x   5 root root  360 May 16 12:25 dev
drwxr-xr-x   1 root root 4096 Apr 26 18:01 etc
drwxr-xr-x   2 root root 4096 Apr 24  2018 home
drwxr-xr-x   1 root root 4096 May 23  2017 lib
drwxr-xr-x   1 root root 4096 Apr 25 20:44 lib64
drwxr-xr-x   2 root root 4096 Apr  3 17:12 media
drwxr-xr-x   1 root root 4096 Apr 26 18:01 mnt
drwxr-xr-x   2 root root 4096 Apr  3 17:12 opt
dr-xr-xr-x 189 root root    0 May 16 12:25 proc
drwx------   1 root root 4096 Apr 25 21:06 root
drwxr-xr-x   1 root root 4096 Apr 24 01:07 run
drwxr-xr-x   1 root root 4096 Apr 25 20:44 sbin
drwxr-xr-x   2 root root 4096 Apr  3 17:12 srv
dr-xr-xr-x  12 root root    0 May 16 12:25 sys
drwxrwxrwt   1 root root 4096 May  2 17:27 tmp
drwxr-xr-x   1 root root 4096 Apr  3 17:12 usr
drwxr-xr-x   1 root root 4096 Apr  3 17:14 var
root@f749d99eff10:/# <b>&block;</b>
</pre>

What did this command do?

Well, quite simply, it **`l`**i**`s`**ts the contents of the directory you are currently in (the additional **`-l`** argument causes the command to produce this list in **`l`**ong format i.e. showing detail fields like permissions, user/group ownership, size modification date/time and name).

Omitting the optional argument results in the following very spartan output:
<pre>
root@f749d99eff10:/# <b>ls</b>
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@f749d99eff10:/# <b>&block;</b>
</pre>

There is much more to know about our friend **`ls`** (like the options `1`, `a`, `d`, `F`, `h`, `R`, `r`, `S` and `t`), but perhaps at another time.

Alright ... but how do I know which directory I am *currently* in?

In *this* case you could look at the prompt to see `root@f749d99eff10:/#` and from that deduce that the user `root` is logged into the container `f749d99eff10` and is currently in the directory `/`. And all that would be perfectly correct, *but not necessarily universally true*, since that is dependent on the configuration of the prompt (which may be different on different `*nix` [boxen](http://catb.org/jargon/html/B/boxen.html)).

The command that reliably answers your question is **`p`**resent **`w`**orking **`d`**irectory.
<pre>
root@f749d99eff10:/# <b>pwd</b>
<b>/</b>
root@f749d99eff10:/# <b>&block;</b>
</pre>

Notice, it is not PWD, or PwD or pWd ... but **always** `pwd`.

> ***`*nix` NOTA BENE***<br>
> 
> Etch this in your mind: ***`*nix` is case sensitive.***

Fair enough ... so we can now 'see' into the darkness with `ls` and we have a means to know where we 'are' with `pwd` ... how do we 'move' around (the title said something about learning to walk)?

<pre>
root@f749d99eff10:/# <b>cd /usr/bin/</b>
root@f749d99eff10:/usr/bin# <b>&block;</b>
</pre>

**`c`**hange **`d`**irectory to the rescue. We have now moved from `/` (the ***root*** directory, or the top level in the directory hierarchy), to `/usr/bin`. This could have been achieved in two steps i.e. while in the `/` folder entering `cd usr` (change directory into the 'child' directory called `usr`), followed by `cd bin` (change directory into the 'child' directory called `bin`):
<pre>
root@f749d99eff10:/usr/bin/# <b>cd /</b>
root@f749d99eff10:/# <b>cd usr</b>
root@f749d99eff10:/usr# <b>cd bin</b>
root@f749d99eff10:/usr/bin# <b>&block;</b>
</pre>
... but as you can see **`cd`** is quite clever (and has more up its sleeve).

Now, let's say you were curious to see the files in this `/usr/bin` directory, how would you see all there is to see about its contents? That's right...
<pre>
root@f749d99eff10:/# <b>ls -l</b>
total 20512
-rwxr-xr-x 1 root root     51384 Jan 18  2018 '['
-rwxr-xr-x 1 root root     22608 Mar  5 17:23  addpart
lrwxrwxrwx 1 root root         6 Aug  4  2018  apropos -> whatis
-rwxr-xr-x 1 root root     14424 Sep  3  2019  apt
-rwxr-xr-x 1 root root     80032 Sep  3  2019  apt-cache
<b>...</b>
-rwxr-xr-x 1 root root      5628 Jun 28  2017  xzgrep
-rwxr-xr-x 1 root root      1802 Jun 28  2017  xzless
-rwxr-xr-x 1 root root      2161 Jun 28  2017  xzmore
-rwxr-xr-x 1 root root     30904 Jan 18  2018  yes
-rwxr-xr-x 1 root root     18488 Apr 16  2018  zdump
root@f749d99eff10:/usr/bin# <b>&block;</b>
</pre>
...WHOA over three hundred items filling up the screen (you should be able to scroll back if you are curious, if you cannot ... you may have to configure the number of scroll-back lines in your Terminal/Command Prompt).
In a future session we will take a look at managing a geyser of steaming hot characters with **`more`** or **`less`**. But for now, what if we'd like to **`clear`** the screen a bit?
<pre>
root@f749d99eff10:/usr/bin# <b>clear&block;</b>
</pre>
Back to some **`cd`** cleverness.

There are two ways to navigate to a parent of the current directory. The obvious way (if you were told nothing) would be to simply enter the absolute path of the target that you wish to navigate to i.e. **`cd /usr`**. And that would be perfectly valid (and in some instances the least amount of typing, and therefore the least error-prone, and therefore the most desirable). However if it is an extremely long path say `/abc/def/ghi/jkl/mno/pqr/stu/vwx` and you want to navigate two hops up to `/abc/def/ghi/jkl/mno/pqr`, retyping most of that train of characters is tedious and error prone. So we could rather use the shorthand `..` to mean parent of the current directory.
<pre>
root@f749d99eff10:/usr/bin# <b>cd ../..</b>
root@f749d99eff10:/# <b>&block;</b>
</pre>
So in the example above `../..` obviously means, parent of parent.

> ***`*nix` NOTA BENE***<br>
> 
> Etch this in your mind: ***`*nix` uses forward slashes (`/`) as path delimiters.***<br>
> 
> Windows uses backslashes (`\`) as path delimiters. You will learn later that backslashes have a special function in `*nix`.

Since there is a lot of typing in a CLI (Command Line Interface) `bash` (the command shell that interprets your inputs) offers some assistance to speed things up. *The `tab` key is magic*. Type the first few characters of an unwieldy command or path, press `tab` and `bash` will complete it.
<pre>
root@f749d99eff10:/# ls -l
total 72
drwxr-xr-x   1 root root 4096 Apr 25 20:46 bin
drwxr-xr-x   2 root root 4096 Apr 24  2018 boot
drwxr-xr-x   5 root root  360 May 16 12:25 dev
drwxr-xr-x   1 root root 4096 Apr 26 18:01 etc
drwxr-xr-x   2 root root 4096 Apr 24  2018 home
drwxr-xr-x   1 root root 4096 May 23  2017 <b>lib</b>
drwxr-xr-x   1 root root 4096 Apr 25 20:44 <b>lib64</b>
drwxr-xr-x   2 root root 4096 Apr  3 17:12 media
drwxr-xr-x   1 root root 4096 Apr 26 18:01 mnt
drwxr-xr-x   2 root root 4096 Apr  3 17:12 opt
dr-xr-xr-x 186 root root    0 May 16 12:25 proc
drwx------   1 root root 4096 Apr 25 21:06 root
drwxr-xr-x   1 root root 4096 Apr 24 01:07 run
drwxr-xr-x   1 root root 4096 Apr 25 20:44 sbin
drwxr-xr-x   2 root root 4096 Apr  3 17:12 srv
dr-xr-xr-x  12 root root    0 May 16 12:29 sys
drwxrwxrwt   1 root root 4096 May  2 17:27 tmp
drwxr-xr-x   1 root root 4096 Apr  3 17:12 usr
drwxr-xr-x   1 root root 4096 Apr  3 17:14 var
root@f749d99eff10:/# <b>cd l</b>
# Pressing tab completes this to:
root@f749d99eff10:/# <b>cd lib</b>
# Which is not sufficiently unique to fully autocomplete.
# Double-pressing tab again displays the completion options...
lib/   lib64/
# Then typing 6 (to provide a completion hint) and tab again completes full autocomplete.
root@f749d99eff10:/# <b>cd lib64/</b>
root@f749d99eff10:/lib64# <b>&block;</b>
</pre>

Since we are root (the superuser) in our container, the `/home/<username>` path is of little consequence. But it will be important on any `*nix` boxen where you are a user. It is often desirable to interact with one's own home folder and the shortcut for this (similar to `..`) is `~`.
<pre>
root@f749d99eff10:/usr/bin# <b>cd ~</b>
root@f749d99eff10:~# pwd
/root
root@f749d99eff10:~# <b>&block;</b>
</pre>
`/root` is the 'home' folder for the `root` user.

Another trick up **`cd`**'s sleeve is **`cd -`**, which takes you to the last directory you were in before **`cd`**-ing to the current one.
<pre>
root@f749d99eff10:/usr/bin# <b>cd lib64/</b>
root@f749d99eff10:/lib64# cd -
/usr/bin
root@f749d99eff10:/lib64# <b>&block;</b>
</pre>

And that is all for today, since we know working professionals don't have hours of spare time.

Next time, we'll learn how to help ourselves (even without an Internet link).