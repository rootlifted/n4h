---
layout: post
title: "Baby Step 6: Sort yourself out"
description: "<b>Baby Step 6:</b> Sort yourself out"
summary: "Showing the flexibility of the sort command."
comments: false
tags: [basicnix,curl,sort,wget]
---

We've already covered the trivial example of **`sort`**, i.e. without arguments (which basically sorts lines lexically, comparing left-most characters first, smallest to largest ASCII values). As you have seen already, that is a very useful tool.

Now. Suppose you were given the following request:
1. Display only the `user name`, `user id`, `user home`, `user shell` fields of the `/etc/passwd` file.
2. Sort on the `user id` field *exclusively*.
3. ...and more specifically in reverse *numerical* order.

Here is the solution:

<pre>
root@f749d99eff10:/sbin# <b>cut /etc/passwd -d ':' -f 1,3,6,7 | sort -t ':' -k2nr,2</b>
nobody:<b>65534</b>:/nonexistent:/usr/sbin/nologin
_apt:<b>100</b>:/nonexistent:/usr/sbin/nologin
gnats:<b>41</b>:/var/lib/gnats:/usr/sbin/nologin
irc:<b>39</b>:/var/run/ircd:/usr/sbin/nologin
list:<b>38</b>:/var/list:/usr/sbin/nologin
backup:<b>34</b>:/var/backups:/usr/sbin/nologin
www-data:<b>33</b>:/var/www:/usr/sbin/nologin
proxy:<b>13</b>:/bin:/usr/sbin/nologin
uucp:<b>10</b>:/var/spool/uucp:/usr/sbin/nologin
news:<b>9</b>:/var/spool/news:/usr/sbin/nologin
mail:<b>8</b>:/var/mail:/usr/sbin/nologin
lp:<b>7</b>:/var/spool/lpd:/usr/sbin/nologin
man:<b>6</b>:/var/cache/man:/usr/sbin/nologin
games:<b>5</b>:/usr/games:/usr/sbin/nologin
sync:<b>4</b>:/bin:/bin/sync
sys:<b>3</b>:/dev:/usr/sbin/nologin
bin:<b>2</b>:/bin:/usr/sbin/nologin
daemon:<b>1</b>:/usr/sbin:/usr/sbin/nologin
root:<b>0</b>:/root:/bin/bash
root@f749d99eff10:/# <b>&block;</b>
</pre>

...and the explanation:
1. `user name`, `user id`, `user home`, `user shell` are fields **`-f 1,3,6,7`**, obviously colon delimited **`-d ':'`**
2. Sort on the `user id` *exclusively*, **`k2,2`** (remember, this is the second field in the piped input, also note the delimiter is specified slightly differently, due to the fact that for **`sort`**, **`-d`** means **`d`**ictionary, so we use **`-t ':'`**)
3. in *reverse* (**`r`**), *numerical* (**`n`**) order

Now, let's complicate the ordering requirement even more: let's say that we want the `user home` field ordered in dictionary order, however values for this field are non-distinct, so to resolve the cases where a few records have the same value for this field, a secondary sort occurs on `user id` as an ascending *numeric* field.

<pre>
root@f749d99eff10:/sbin# <b>cut /etc/passwd -d ':' -f 1,3,6,7 | sort -t ':' -k3d,3 -k2n,2</b>
bin:<b>2</b>:<b>/bin</b>:/usr/sbin/nologin
sync:<b>4</b>:<b>/bin</b>:/bin/sync
proxy:<b>13</b>:<b>/bin</b>:/usr/sbin/nologin
sys:<b>3</b>:<b>/dev</b>:/usr/sbin/nologin
_apt:<b>100</b>:<b>/nonexistent</b>:/usr/sbin/nologin
nobody:<b>65534</b>:<b>/nonexistent</b>:/usr/sbin/nologin
root:<b>0</b>:<b>/root</b>:/bin/bash
games:<b>5</b>:<b>/usr/games</b>:/usr/sbin/nologin
daemon:<b>1</b>:<b>/usr/sbin</b>:/usr/sbin/nologin
backup:<b>34</b>:<b>/var/backups</b>:/usr/sbin/nologin
man:<b>6</b>:<b>/var/cache/man</b>:/usr/sbin/nologin
gnats:<b>41</b>:<b>/var/lib/gnats</b>:/usr/sbin/nologin
list:<b>38</b>:<b>/var/list</b>:/usr/sbin/nologin
mail:<b>8</b>:<b>/var/mail</b>:/usr/sbin/nologin
irc:<b>39</b>:<b>/var/run/ircd</b>:/usr/sbin/nologin
lp:<b>7</b>:<b>/var/spool/lpd</b>:/usr/sbin/nologin
news:<b>9</b>:<b>/var/spool/news</b>:/usr/sbin/nologin
uucp:<b>10</b>:<b>/var/spool/uucp</b>:/usr/sbin/nologin
www-data:<b>33</b>:<b>/var/www</b>:/usr/sbin/nologin
root@f749d99eff10:/# <b>&block;</b>
</pre>

Let me perhaps demonstrate one more interesting option.

**`ls -lh`** displays file sizes with [SI prefix](https://en.wikipedia.org/wiki/Metric_prefix) (`K`, `M`, `G`, `T` etc) instead of bytes (bytes become a bit messy for quick/accurate human parsing beyond megabytes).

<pre>
root@f749d99eff10:/sbin# <b>ls -lh /sbin | sort -k5h,5</b>
total 3.8M
lrwxrwxrwx 1 root root       <b>6</b> Jan 22 14:40 fsck.ext2 -> e2fsck
lrwxrwxrwx 1 root root       <b>6</b> Jan 22 14:40 fsck.ext3 -> e2fsck
lrwxrwxrwx 1 root root       <b>6</b> Jan 22 14:40 fsck.ext4 -> e2fsck
lrwxrwxrwx 1 root root       <b>6</b> Jan 22 14:40 mkfs.ext2 -> mke2fs
lrwxrwxrwx 1 root root       <b>6</b> Jan 22 14:40 mkfs.ext3 -> mke2fs
lrwxrwxrwx 1 root root       <b>6</b> Jan 22 14:40 mkfs.ext4 -> mke2fs
lrwxrwxrwx 1 root root       <b>6</b> Mar  5 17:23 getty -> agetty
lrwxrwxrwx 1 root root       <b>7</b> Jan 22 14:40 e2label -> tune2fs
-rwxr-xr-x 1 root root      <b>17</b> Apr 24 01:07 initctl
-rwxr-xr-x 1 root root     <b>387</b> Apr 16  2018 ldconfig
-rwxr-xr-x 1 root root     <b>885</b> Mar 22  2019 shadowconfig
-rwxr-xr-x 1 root root    <b>2.6K</b> Dec 30  2017 installkernel
-rwxr-xr-x 1 root root    <b>6.0K</b> Nov  1  2017 fstab-decode
-rwxr-xr-x 1 root root     <b>10K</b> Jan 22 14:40 logsave
-rwxr-xr-x 1 root root     <b>11K</b> Feb 27  2019 pam_tally
-rwxr-xr-x 1 root root     <b>11K</b> Mar  5 17:23 findfs
-rwxr-xr-x 1 root root     <b>11K</b> Mar  5 17:23 fsfreeze
-rwxr-xr-x 1 root root     <b>11K</b> Mar  5 17:23 mkfs
-rwxr-xr-x 1 root root     <b>11K</b> Mar  5 17:23 pivot_root
-rwxr-xr-x 1 root root     <b>15K</b> Feb 27  2019 pam_tally2
-rwxr-xr-x 1 root root     <b>15K</b> Mar  5 17:23 raw
-rwxr-xr-x 1 root root     <b>15K</b> Mar  5 17:23 swaplabel
-rwxr-xr-x 1 root root     <b>15K</b> Mar  5 17:23 switch_root
-rwxr-xr-x 1 root root     <b>19K</b> Feb 27  2019 mkhomedir_helper
-rwxr-xr-x 1 root root     <b>19K</b> Jan 22 14:40 e2undo
-rwxr-xr-x 1 root root     <b>19K</b> Mar  5 17:23 ctrlaltdel
-rwxr-xr-x 1 root root     <b>19K</b> Mar  5 17:23 swapoff
-rwxr-xr-x 1 root root     <b>23K</b> Aug  9  2019 sysctl
-rwxr-xr-x 1 root root     <b>23K</b> Mar  5 17:23 chcpu
-rwxr-xr-x 1 root root     <b>23K</b> Mar  5 17:23 isosize
-rwxr-xr-x 1 root root     <b>23K</b> Nov  1  2017 killall5
-rwxr-xr-x 1 root root     <b>27K</b> Jan 22 14:40 badblocks
-rwxr-xr-x 1 root root     <b>27K</b> Jan 22 14:40 dumpe2fs
-rwxr-xr-x 1 root root     <b>27K</b> Mar  5 17:23 blkdiscard
-rwxr-xr-x 1 root root     <b>31K</b> Mar  5 17:23 mkfs.bfs
-rwxr-sr-x 1 root shadow   <b>34K</b> Feb 27  2019 pam_extrausers_chkpwd
-rwxr-sr-x 1 root shadow   <b>34K</b> Feb 27  2019 unix_chkpwd
-rwxr-xr-x 1 root root     <b>34K</b> Feb 27  2019 pam_extrausers_update
-rwxr-xr-x 1 root root     <b>34K</b> Feb 27  2019 unix_update
-rwxr-xr-x 1 root root     <b>35K</b> Jan 22 14:40 e2image
-rwxr-xr-x 1 root root     <b>35K</b> Mar  5 17:23 fsck.cramfs
-rwxr-xr-x 1 root root     <b>35K</b> Mar  5 17:23 mkfs.cramfs
-rwxr-xr-x 1 root root     <b>36K</b> Sep  5  2019 start-stop-daemon
-rwxr-xr-x 1 root root     <b>39K</b> Mar  5 17:23 blockdev
-rwxr-xr-x 1 root root     <b>39K</b> Mar  5 17:23 wipefs
-rwxr-xr-x 1 root root     <b>43K</b> Mar  5 17:23 fstrim
-rwxr-xr-x 1 root root     <b>43K</b> Mar  5 17:23 runuser
-rwxr-xr-x 1 root root     <b>47K</b> Mar  5 17:23 fsck
-rwxr-xr-x 1 root root     <b>47K</b> Mar  5 17:23 sulogin
-rwxr-xr-x 1 root root     <b>47K</b> Mar  5 17:23 swapon
-rwxr-xr-x 1 root root     <b>56K</b> Mar  5 17:23 agetty
-rwxr-xr-x 1 root root     <b>59K</b> Jan 22 14:40 resize2fs
-rwxr-xr-x 1 root root     <b>59K</b> Mar  5 17:23 hwclock
-rwxr-xr-x 1 root root     <b>79K</b> Mar  5 17:23 mkfs.minix
-rwxr-xr-x 1 root root     <b>79K</b> Mar  5 17:23 mkswap
-rwxr-xr-x 1 root root     <b>83K</b> Mar  5 17:23 losetup
-rwxr-xr-x 1 root root     <b>87K</b> Mar  5 17:23 blkid
-rwxr-xr-x 1 root root     <b>91K</b> Mar  5 17:23 fsck.minix
-rwxr-xr-x 1 root root     <b>91K</b> Mar  5 17:23 zramctl
-rwxr-xr-x 1 root root     <b>95K</b> Mar  5 17:23 cfdisk
-rwxr-xr-x 1 root root    <b>103K</b> Jan 22 14:40 tune2fs
-rwxr-xr-x 1 root root    <b>107K</b> Mar  5 17:23 sfdisk
-rwxr-xr-x 1 root root    <b>123K</b> Mar  5 17:23 fdisk
-rwxr-xr-x 1 root root    <b>127K</b> Jan 22 14:40 mke2fs
-rwxr-xr-x 1 root root    <b>218K</b> Jan 22 14:40 debugfs
-rwxr-xr-x 1 root root    <b>307K</b> Jan 22 14:40 e2fsck
-rwxr-xr-x 1 root root   <b>1002K</b> Apr 16  2018 ldconfig.real
root@f749d99eff10:/# <b>&block;</b>
</pre>

So **`sort`** is able to understand SI prefixes.

Just as an aside, if you studied **`man ls`** properly, you would have encountered the following pearl:

<pre>
...
  <b>-S</b>     sort by file size, largest first
...
  <b>-r</b>, --reverse
         reverse order while sorting
...
</pre>

So **`ls -lhSr`** does exactly the same thing as **`ls -lh /sbin | sort -k5h,5`**. ;)

This illustrates something that you will encounter countless times in `*nix`, namely that there are multiple ways to skin the proverbial cat\*. There is however usually one solution that is shorter, simpler and/or more elegant.

\* Well, not *nix **`cat`**, since it appears not to have any skin.

<pre>
root@nix:~/coreutils-8.32/src# <b>wc -l cat.c</b>
     767 cat.c
root@nix:~/coreutils-8.32/src# <b>fgrep -ci skin cat.c</b>
0
# I'm sorry ... I know ... it's a terrible nerd joke.
root@f749d99eff10:/# <b>&block;</b>
</pre>

Some other useful toys that **`man sort`** will tell you about:
<pre>
...
  <b>-f</b>, --ignore-case
         fold lower case to upper case characters
...
  <b>-c</b>, --check, --check=diagnose-first
         check for sorted input; do not sort
  
  <b>-C</b>, --check=quiet, --check=silent
         like -c, but do not report first bad line
...
  <b>--parallel=N</b>
         change the number of sorts run concurrently to N
  
  <b>-u</b>, --unique
         with -c, check for strict ordering; without -c, output only the first of an equal run
...
</pre>

So as you can see, you can achieve all the complex sort orderings you would in Excel, only ... on a file with fifty million rows and/or thirty thousand columns.

I promised that I would show you how to pull down files from the web to test your new skills on.

Let's pull some Oxford University [COVID-19](https://www.bsg.ox.ac.uk/research/research-projects/coronavirus-government-response-tracker) data. There are generally two options, some installations have **`wget`**...

<pre>
root@f749d99eff10:~# <b>wget https://raw.githubusercontent.com/OxCGRT/covid-policy-tracker/master/data/OxCGRT_latest.csv</b>
root@f749d99eff10:/# <b>&block;</b>
</pre>

...and some have **`curl`**...
<pre>
root@f749d99eff10:~# <b>curl -o OxCGRT_latest.csv https://raw.githubusercontent.com/OxCGRT/covid-policy-tracker/master/data/OxCGRT_latest.csv</b>
# OR
root@f749d99eff10:~# <b>curl https://raw.githubusercontent.com/OxCGRT/covid-policy-tracker/master/data/OxCGRT_latest.csv > OxCGRT_latest.csv</b>
root@f749d99eff10:/# <b>&block;</b>
</pre>

...some have both (like your container) and some have *neither* (like public-facing production servers). ;)

Right.

We can continue pootling about in the safe shallows of `bash` built-ins and GNU [`coreutils`](https://www.gnu.org/software/coreutils/manual/html_node/index.html), there certainly is enough to keep us busy:

<pre>
# Remove the '| wc -l' to see the complete list of 61 bash built-ins (of which we've covered under 10%.)
root@f749d99eff10:~# enable -a | wc -l
<b>61</b>
# Remove the '| wc -l' to see the complete list of 103 coreutils commands (of which we've covered under 10%)
root@f749d99eff10:~# dpkg-query -L coreutils | sort | fgrep 'bin/' | egrep '/[a-z0-9]+$' | wc -l
<b>103</b>
root@f749d99eff10:/# <b>&block;</b>
</pre>

...but the fact is, I can feel your impatience to reach the summit of Data Wrangling. So since roughly 10-20% of builtins/coreutils commands constitute 80-90% of commands used on a daily basis, we may return at a later time to add some more tools to the belt.

I think the time has come to address the elephant in the room. Regular Expressions. `*nix` is *nothing* without them, and frankly, so are you.

There are currently three painfully obvious gaps in your Data Wrangling trophy cabinet: **`egrep`**, **`sed`** and **`awk`**.

And the only weapon that will mount those trophies: Regular Expressions.

So the *'Baby Steps'* ends today. Next time (and quite a few after that), we'll start going to the regex range to train like grownups. 