---
layout: post
title: "Baby Step 4: Let's manipulate the file-system"
description: "<b>Baby Step 4:</b> Let's manipulate the file-system"
summary: "How to look at file contents, and manipulate folders."
comments: false
tags: [basic nix,built-ins,cat,cp,head,mv,rm,sort,tail,wc]
---

So far, we've been walking around the `*nix` filesystem, browsing. Probably like some teenager who accidentally stumbles into a poorly guarded military warehouse. Having not the faintest clue what the contents are and what they are used for.

**`cat`**<br />
This command (short for con**`cat`**enate) is generally/primarily used to vomit the contents of a file onto the screen (or another command). The verb was used advisedly, since it is a no-holds-barred fire-hydrant torrent of data sprayed at your screen with little control.
<pre>
root@f749d99eff10:/# <b>cat /etc/passwd</b>
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
_apt:x:100:65534::/nonexistent:/usr/sbin/nologin
root@f749d99eff10:/# <b>&block;</b>
</pre>
So **`cat`** spewed ALL the contents of a file named `passwd` (in the directory `/etc`) onto the screen. We could also have done **`cd /etc`** followed by **`cat passwd`**, which would have achieved exactly the same. So long as the first argument is a valid file, and the second is a valid directory there are any number of valid ways to achieve the same result.

**`head`**<br />
What if that file had say two million rows? A typical console window is 80x25 characters by default (160x50 if you've configured it like a hacker). Two million divide by fifty lines is forty thousand screens of guff. Not good. So how do we manage the data deluge?
<pre>
root@f749d99eff10:/# <b>head -5 /etc/passwd</b>
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
root@f749d99eff10:/# <b>&block;</b>
</pre>
Much better.

**`tail`**<br />
Typically though, in the case of massive logs, one is more interested in the last (most recently) added lines, and would possibly like to keep following any updates as they are appended to the log file, like so...
<pre>
root@f749d99eff10:/# <b>tail -f /var/log/dpkg.log</b>
2020-05-16 21:47:11 configure less:amd64 487-0.1 &lt;none&gt;
2020-05-16 21:47:11 status unpacked less:amd64 487-0.1
2020-05-16 21:47:11 status half-configured less:amd64 487-0.1
2020-05-16 21:47:11 status installed less:amd64 487-0.1
2020-05-16 21:47:11 trigproc man-db:amd64 2.8.3-2ubuntu0.1 &lt;none&gt;
2020-05-16 21:47:11 status half-configured man-db:amd64 2.8.3-2ubuntu0.1
2020-05-16 21:47:11 status installed man-db:amd64 2.8.3-2ubuntu0.1
2020-05-16 21:47:11 trigproc mime-support:all 3.60ubuntu1 &lt;none&gt;
2020-05-16 21:47:11 status half-configured mime-support:all 3.60ubuntu1
2020-05-16 21:47:11 status installed mime-support:all 3.60ubuntu1
<b>^C</b>
root@f749d99eff10:/# <b>&block;</b>
</pre>
So, that displayed the last few lines of the log file `/var/log/dpkg.log` and would keep adding any updates until interrupted (by pressing &lt;Ctrl&gt;-C). If you are following along, that file is only updated if new packages are installed (so not really frequently enough to merit the `-f` argument).

**`cp`**<br />
Let's say we wish to make a copy of the earlier important system file `/etc/passwd` (which should ***really*** not be corrupted, since it contains the list of all users on the system, their UserIDs, GroupIDs, home folders and startup shells) to our home folder. How would we go about that?
<pre>
root@f749d99eff10:/# <b>cp /e</b>                     # Press &lt;tab&gt; to complete to...
root@f749d99eff10:/# <b>cp /etc/</b>                  # Type 'pas' and press &lt;tab&gt; to complete to...
root@f749d99eff10:/# <b>cp /etc/passwd</b>            # End by adding &lt;space&gt;~
root@f749d99eff10:/# <b>cp /etc/passwd ~</b>
root@f749d99eff10:/# <b>cd ~</b>
root@f749d99eff10:~# <b>pwd</b>
/root
root@f749d99eff10:~# <b>ls -l</b>
total 4
-rw-r--r-- 1 root root 926 May 17 16:34 passwd
root@f749d99eff10:/root# <b>&block;</b>
</pre>
Tab completion will become a way of life, and you'll get annoyed with software that does not support something so nice (that has been around for over a quarter of a century).
Since we're traipsing about as titans, `~` ends up being `/root` (for other regular users it would typically be `/home/<username>`). So we have now made a copy of the file `/etc/passwd` into the folder `/root`. Where we can safely mess around with it.

**`mv`**<br />
Suppose we wish to rename the file to add a prefix or suffix to the file name?
<pre>
root@f749d99eff10:/root# <b>mv p</b>                  # Press &lt;tab&gt; to complete to...
root@f749d99eff10:/root# <b>mv passwd</b>             # Add a 'p' followed &lt;tab&gt; to complete to...
root@f749d99eff10:/root# <b>mv passwd passwd</b>      # And add '_test' to the end, like so...
root@f749d99eff10:/root# <b>mv passwd passwd_test</b>
root@f749d99eff10:~# <b>ls -l</b>
total 4
-rw-r--r-- 1 root root 926 May 17 16:36 passwd_test
root@f749d99eff10:/root# <b>&block;</b>
</pre>
Or perhaps you wish to move this file to another directory altogether?
<pre>
root@f749d99eff10:/root# <b>mv p</b>                  # Press &lt;tab&gt; to complete to...
root@f749d99eff10:/root# <b>mv passwd_test</b>        # Add a '/t' followed &lt;tab&gt; to complete to...
root@f749d99eff10:/root# <b>mv passwd_test /tmp</b>
root@f749d99eff10:/root# <b>cd /t</b>                 # Press &lt;tab&gt; to complete to...
root@f749d99eff10:/root# <b>cd /tmp</b>
root@f749d99eff10:/tmp# <b>ls -l</b>
total 4
-rw-r--r-- 1 root root 926 May 17 16:36 passwd_test
root@f749d99eff10:/tmp# <b>&block;</b>
</pre>
Quite straightforward really.

**`sort`**<br />
Perhaps you need the contents of the file sorted?
<pre>
root@f749d99eff10:/tmp# <b>sort passwd_test</b>
_apt:x:100:65534::/nonexistent:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
games:x:5:60:games:/usr/games:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
root:x:0:0:root:/root:/bin/bash
sync:x:4:65534:sync:/bin:/bin/sync
sys:x:3:3:sys:/dev:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
root@f749d99eff10:/tmp# <b>&block;</b>
</pre>
We will return to the *mighty* **`sort`** in future, it has *much* more to offer.

**`wc`**<br />
Another extremely frequently used command, is one **`w`**ord **`c`**ount...
<pre>
root@f749d99eff10:/tmp# <b>wc -l passwd_test</b>
19 passwd_test
root@f749d99eff10:/tmp# <b>wc -m passwd_test</b>
926 passwd_test
root@f749d99eff10:/tmp# <b>&block;</b>
</pre>
So, 19 lines and 926 characters in `passwd_test` file.

**`rm`**<br />
Right ... had enough fun? Let's remove the evidence. ;)
<pre>
root@f749d99eff10:/# <b>rm p</b>
# Press &lt;tab&gt; to complete to...
root@f749d99eff10:/# <b>rm passwd_test</b>
root@f749d99eff10:~# <b>ls -l</b>
total 0
root@f749d99eff10:/root# <b>&block;</b>
</pre>

All of these commands have ***much*** more to offer, this is just to get you off the mark in terms of actually being able to copy, inspect, sort, move, rename and delete data for future experiments. If you're burning with curiosity, how about trying out the tricks in the previous article to learn more about these commands.

Next time we will learn about `*nix`'s biggest gift to the world: pipes.