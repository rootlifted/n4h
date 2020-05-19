---
layout: post
title: "Baby Step 5: Get the pipe-wrench"
description: "<b>Baby Step 5:</b> Get the pipe-wrench"
summary: "Unleashing the true power of the *nix CLI."
comments: false
tags: [basicnix,pipe]
---

By now, I fear some impatient folk are sighing loudly and rolling their eyes, muttering: *"[He promised to show us real ultimate power](http://realultimatepower.net)."*

I have, and I will. I promise.

We are currently stumbling slowly through the tedium of learning the alphabet. Writing *effortlessly-wins-armies-of-besotted-lovers-level* prose ... is still some way off in the future. However, I am confident that if you remain diligent, you will not regret your investment. So far we have set you up with a gym in which to hone your skills and some basic tools to empower your learning. From now on the pace will steadily increase, in step with your growing command of your newfound powers.

> <img src="{{site.url}}/{{site.baseurl}}/assets/UnixPhilosophy1978.png" width="400" height="300" />
> 
> <small>— FROM: [The Bell System Technical Journal, Jul-Aug 1978](https://archive.org/details/bstj57-6-1899/page/n3/mode/2up)</small>

**`cat`** concatenates, **`cp`** copies, **`ls`** lists, **`mv`** moves, **`rm`** removes, **`sort`** sorts, **`wc`** counts etc. etc.

So we have a [plethora]({{site.url}}/{{site.baseurl}}/assets/plethora.gif) of small, solid, single-function commands, CHECK!

So how do we level up?

We take the output of one program, and make it the input of another. You will see in time just how powerful this concept is. The magical operator that acts as the plumbing that connects commands, is called a *pipe* and looks like this: `|`. But before I illustrate how this is done, let's first learn the *absolute basics* of arguably the ***most*** important `*nix` command you will ever learn.

**`grep`**
<hr />
**`g`**lobal **`r`**egular **`e`**xpression **`p`**rint is to 'Find', what [Zeus](https://en.wikipedia.org/wiki/Zeus) is to [Perseus](https://en.wikipedia.org/wiki/Perseus). Remember the `/etc/passwd` file?
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

Check this:
<pre>
root@f749d99eff10:/# <b>grep 'var' /etc/passwd</b>
man:x:6:12:man:/<b>var</b>/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/<b>var</b>/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/<b>var</b>/mail:/usr/sbin/nologin
news:x:9:9:news:/<b>var</b>/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/<b>var</b>/spool/uucp:/usr/sbin/nologin
www-data:x:33:33:www-data:/<b>var</b>/www:/usr/sbin/nologin
backup:x:34:34:backup:/<b>var</b>/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/<b>var</b>/list:/usr/sbin/nologin
irc:x:39:39:ircd:/<b>var</b>/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/<b>var</b>/lib/gnats:/usr/sbin/nologin
root@f749d99eff10:/# <b>&block;</b>
</pre>
*"So **`grep`** finds stuff?"*

In ways that you cannot even begin to imagine.

So for our first example of laying some pipe, what if we wanted to count how many lines there are in the `/etc/passwd` file?

*"Easy"* you say, *"like we've totally done this."*
<pre>
root@f749d99eff10:/# <b>wc -l /etc/passwd</b>
<b>19</b> /etc/passwd
root@f749d99eff10:/# <b>&block;</b>
</pre>
Great! Well remembered.

So how would one count *only the lines that contain the text `var`*?

*"Well, maybe you'd pipe the output of **`grep 'var' /etc/passwd`** into **`wc`**?"*

Exactly! It makes so much sense right? Like a conveyor belt.

We have **`grep`** that churns out some lines from a specified file, based a provided argument. Then we simply plug **`grep`**'s output, into something that counts (and we specify exactly how we want it counted, with an argument).

<pre>
root@f749d99eff10:/# <b>grep 'var' /etc/passwd | wc -l</b>
<b>10</b>
root@f749d99eff10:/# <b>&block;</b>
</pre>
Notice how **`wc`** now does not display the `/etc/passwd` filename, why?

**`grep`** got its input from `/etc/passwd`, we then pipe these lines of output (which is a stream called `std_out`) into the `std_in` of **`wc`** whose `std_out` is then displayed on the screen.

So, if I asked you to show me only the lines containing the text `var` ... but sorted. You think you could manage?

*"Sure. Just pipe **`grep`**'s output into **`sort`** instead of **`wc`**"*

<pre>
root@f749d99eff10:/# <b>grep 'var' /etc/passwd | sort</b>
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
root@f749d99eff10:/# <b>&block;</b>
</pre>

EXACTLY! And it is this 'obviousness' of the plumbing paradigm that allows anyone to fairly quickly and easily string together a reasonably complex chain of operations in a predictable (not to mention powerful) way.

Now, I'm going to use two commands you've never seen, and I'd bet you'd be able to deduce the goal of my constructed pipeline:
<pre>
root@f749d99eff10:/# <b>cat /etc/passwd | cut -d ':' -f 7 | sort | uniq -c</b>
      <b>1</b> /bin/bash
      <b>1</b> /bin/sync
     <b>17</b> /usr/sbin/nologin
root@f749d99eff10:/# <b>&block;</b>
</pre>

Notice we've subbed the picky **`grep`** for the spewy **`cat`**. Piped effectively the entire contents of `/etc/passwd` into a new unknown command called **`cut`**. Looking at its output (and I encourage you to build this pipeline on your own *Docker* container) it simply uses colon as a field delimiter and selects only field 7 (the last field).

<pre>
root@f749d99eff10:/# <b>cat /etc/passwd | cut -d ':' -f 7</b>
/bin/bash
/usr/sbin/nologin
/usr/sbin/nologin
/usr/sbin/nologin
/bin/sync
/usr/sbin/nologin
/usr/sbin/nologin
/usr/sbin/nologin
/usr/sbin/nologin
/usr/sbin/nologin
/usr/sbin/nologin
/usr/sbin/nologin
/usr/sbin/nologin
/usr/sbin/nologin
/usr/sbin/nologin
/usr/sbin/nologin
/usr/sbin/nologin
/usr/sbin/nologin
/usr/sbin/nologin
root@f749d99eff10:/# <b>&block;</b>
</pre>

**`sort`** will obviously sort the records. And then the next unknown seems to count the number of occurrences of each unique string ... almost like `SELECT FIELD, COUNT(ID) FROM TABLE GROUP BY FIELD` would have done in SQL.

Spot on. And keep those SQL skills on hand if you have them because there are many more text analogies of SQL queries to come.

Next time I'll be showing the tip of the sort iceberg (to illustrate how deep the rabbit-hole goes on a single command, and there are hundreds of commands). I will also show you the **`wget`** command to pull down some data from the IntarWebz.
