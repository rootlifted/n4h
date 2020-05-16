---
layout: post
title: "Baby Step 0: Getting your very own padded playpen"
description: "<b>Baby Step 0:</b> Getting your very own padded playpen"
summary: "Setting up a safe environment in which to experiment with no consequence to the student's workstation."
comments: false
tags: [containerisation,docker,setup,virtualisation]
---

Since you are perusing `*nix`4*humans*, it would not wholly unreasonable to assume that you are *not* running `*nix` on your home computer. Which by elimination leaves *Windows* &hellip; or possibly *macOS* (which is *actually* `*nix`), but we don't want you experimenting on your own life raft do we?

These are the constraints for selecting a suitable `*nix` lab:

> **Constraint 1: Safety**<br />
> Keeping your precious computer safely abstracted from your experiments.
> 
> **Constraint 2: Cost**<br />
> It is perhaps not unreasonable to assume that most readers do not have the means/inclination to spend the price of a second computer on this educational endeavour.
> 
> **Constraint 3: Simplicity**<br />
> The reasonable assumption is that the readers of `*nix`4*humans* do not write their own operating systems, so re-sizing disk partitions and dual booting operating systems (although much simpler these days), is perhaps a bridge too far.
> 
> **Constraint 4: OS Version**<br />
> Virtualisation/containerisation software typically requires at least Windows 10 Pro 64-bit (due to [this](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/reference/hyper-v-requirements)).

So the options are:

> **Option A: Single Board Computer** [wiki](https://en.wikipedia.org/wiki/Single-board_computer)<br />
> Offers a relatively cheap (but surprisingly [powerful](https://www.youtube.com/watch?v=v8S_-p-MujI)) piece of [hardware](https://www.amazon.co.uk/dp/B07XH3HWTQ), that keeps all your experiments safely on a credit card-sized computer, thereby mitigating almost all of the above constraints (admittedly at some expense). However, the little beast can be re-purposed for a dozen fun home [projects](https://www.pcworld.com/article/3043022/10-surprisingly-practical-raspberry-pi-projects-anybody-can-do.html) afterward.
> 
> **Option B: Dual-Booting** [wiki](https://en.wikipedia.org/wiki/Multi-booting)<br />
> If your hard disk is not full to the gunnels, this is certainly an option. Watch [this](https://www.youtube.com/watch?v=MSVV_EoApdo) clip to decide if this appeals to you.
> 
> **Option C: Virtualisation** [wiki](https://en.wikipedia.org/wiki/Full_virtualization)<br />
> Which is software that virtualises the entire operating system (and is therefore perhaps a tad heavy for our purposes).<br />
> [VirtualBox](https://www.virtualbox.org) would be a good example of a high quality free virtualisation tool.<br />
> You may also have heard of [Parallels](https://www.parallels.com/uk/) for macOS, or [VMWare](https://www.vmware.com) for Enterprise virtualisation.
>
> **Option D: Containerisation** [wiki](https://en.wikipedia.org/wiki/OS-level_virtualization)<br />
> Which offers a **lightweight** container that is able to run all the applications we need.<br />
> This is the route we will take, using a free, powerful and very popular tool called [Docker](https://www.docker.com/resources/what-container).
> 
> 

So let's compare the options:

<table>
    <thead>
        <tr>
            <td class="FirstColumn">&nbsp;</td>
            <th>Constraint 1:<br>Safety</th>
            <th>Constraint 2:<br>Cost</th>
            <th>Constraint 3:<br>Simplicity</th>
            <th class="LastColumn">Constraint 4:<br>OS Version</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th>Option A: Single Board Computer</th>
            <td>As Houses</td>
            <td class="Shaded">±£100</td>
            <td>Simple</td>
            <td>Nada</td>
        </tr>
        <tr>
            <th>Option B: Dual-Booting</th>
            <td class="Shaded">As Houses*</td>
            <td>Gratis</td>
            <td class="Shaded">Fairly Simple*</td>
            <td>Nada</td>
        </tr>
        <tr>
            <th>Option C: Virtualisation</th>
            <td>As Houses</td>
            <td>Gratis</td>
            <td>Simple</td>
            <td class="ShadedSmall">
                <p>
                    macOS <a href="https://docs.oracle.com/en/virtualization/virtualbox/6.1/user/hostossupport.html">10.13</a> (or higher) <b>OR</b>
                    Windows <a href="https://docs.oracle.com/en/virtualization/virtualbox/6.1/user/hostossupport.html">8.1</a> (or better)
                </p>
                <p>
                    No Hyper-V required.<br />Thus supports more primitive flavours of 64-bit Windows.
                </p>
            </td>
        </tr>
        <tr class="LastRow">
            <th>Option D: Containerisation</th>
            <td>As Houses</td>
            <td>Gratis</td>
            <td>Easy</td>
            <td class="ShadedSmall">
                <p>
                    macOS <a href="https://hub.docker.com/editions/community/docker-ce-desktop-mac">10.13</a> (or higher) <b>OR</b>
                    Windows <a href="https://hub.docker.com/editions/community/docker-ce-desktop-windows">10 Pro 64-bit</a> (or better)
                </p>
                <b>OR</b> <a href="https://docs.docker.com/toolbox/overview/">Docker Toolbox</a>
                <p>
                    (which supports more primitive flavours of 64-bit macOS/Windows)
                </p>
            </td>
        </tr>
    </tbody>
</table>

\* Not the kind of thing you want to talk your nan through over the phone. Getting it wrong can have unpleasant consequences.

Right, enough jibber-jabber, let's get you your very own little patch of `*nix` turf to till.

> <h3>TO DO</h3>
> <hr />
> - [ ] Create a [DockerHub](https://hub.docker.com) account.
> - [ ] Download and install [Docker Desktop](https://www.docker.com/products/docker-desktop) on your machine (or [Docker Toolbox](https://docs.docker.com/toolbox/overview/) on your abacus).
> - [ ] Start *Docker Desktop* with your *DockerHub* credentials.
> - [ ] Open a [CLI](https://en.wikipedia.org/wiki/Command-line_interface) window\*.
> - [ ] Pull down the `rootlifted/n4h` *Docker* image from *DockerHub*.
> - [ ] Created your very first and very own `*nix` container, called `n4h_sandbox`.

\* If you are on *macOS*: press &#x2318;`+Space` and type `Terminal`, OR, if you are on *Windows*: press &#x2756;`+X` and select `Command Prompt` from the menu that pops up.

In your *macOS* `Terminal` enter the following *Docker* commands:

> ***NOTE:***<br />
> `<path_to_shared_folder>` would be an arbitrary existing folder on your machine that you chose/created (e.g. `/Users/user/docker` for *macOS* or `C:\USERS\user\docker` for *Windows*) that you wish to use as shared folder between your machine ("outside") and the container ("inside").

<pre>
user@host ~ % <b>docker login --username <i>&lt;your_dockerhub_username&gt;</i></b>
Password: <b><i>&lt;your_dockerhub_password&gt;</i></b>
Login Succeeded

user@host ~ % <b>docker run -ti --name=n4h_sandbox -v <i>&lt;path_to_shared_folder&gt;</i>:/mnt/shared rootlifted/n4h /bin/bash</b>
Unable to find image 'rootlifted/n4h:latest' locally
latest: Pulling from rootlifted/n4h
23884877105a: Pull complete 
bc38caa0f5b9: Pull complete 
2910811b6c42: Pull complete 
36505266dcc6: Pull complete 
df8b2ddb108f: Pull complete 
aeb553e021e7: Pull complete 
b4a0bf7ba644: Pull complete 
e65df4e5e25c: Pull complete 
Digest: sha256:23ec510985132791a0b4d1f1da81eed35b7deac5075336ec4a47ce5962478251
Status: Downloaded newer image for rootlifted/n4h:latest

<b>root</b>@c80c5927c652:/# <b>&block;</b>
</pre>

The *Docker* commands look exactly the same in *Windows*. Only your prompt will look different:
<pre>
C:\WINDOWS><b>docker login --username <i>&lt;your_dockerhub_username&gt;</i></b>
Password: <b><i>&lt;your_dockerhub_password&gt;</i></b>
Login Succeeded

C:\WINDOWS><b>docker run -ti --name=n4h_sandbox -v <i>&lt;path_to_shared_folder&gt;</i>:/mnt/shared rootlifted/n4h /bin/bash</b>
<b>...</b>
<b>root</b>@72eadae6073d:/# <b>&block;</b>
</pre>

Congratulations ... you have now achieved what you set out to do:
> <h3>TO DO</h3>
> <hr />
> - [X] Created a *DockerHub* user.
> - [X] Downloaded and installed *Docker Desktop*.
> - [X] Started *Docker Desktop* entering your *DockerHub* credentials.
> - [X] Opened a CLI window.
> - [X] Pulled down the `rootlifted/n4h` *Docker* image from *DockerHub*.
> - [X] Created your very first and very own `*nix` container, called `n4h_sandbox`.

To list the `*nix` filesystem (just to kick the proverbial tyres on this container), type the following command:
<pre>
<b>root</b>@72eadae6073d:/# <b>ls -l</b>
total 68
drwxr-xr-x   1 root root 4096 Apr 25 20:46 bin
drwxr-xr-x   2 root root 4096 Apr 24  2018 boot
drwxr-xr-x   5 root root  360 Apr 25 22:53 dev
drwxr-xr-x   1 root root 4096 Apr 25 22:53 etc
drwxr-xr-x   2 root root 4096 Apr 24  2018 home
drwxr-xr-x   1 root root 4096 May 23  2017 lib
drwxr-xr-x   1 root root 4096 Apr 25 20:44 lib64
drwxr-xr-x   2 root root 4096 Apr  3 17:12 media
drwxr-xr-x   2 root root 4096 Apr  3 17:12 mnt
drwxr-xr-x   2 root root 4096 Apr  3 17:12 opt
dr-xr-xr-x 199 root root    0 Apr 25 22:53 proc
drwx------   1 root root 4096 Apr 25 21:06 root
drwxr-xr-x   1 root root 4096 Apr 24 01:07 run
drwxr-xr-x   1 root root 4096 Apr 25 20:44 sbin
drwxr-xr-x   2 root root 4096 Apr  3 17:12 srv
dr-xr-xr-x  13 root root    0 Apr 25 22:53 sys
drwxrwxrwt   1 root root 4096 Apr 25 20:46 tmp
drwxr-xr-x   1 root root 4096 Apr  3 17:12 usr
drwxr-xr-x   1 root root 4096 Apr  3 17:14 var
<b>root</b>@72eadae6073d:/# <b>&block;</b>
</pre>

And to exit the container, simply type `exit`:
<pre>
<b>root</b>@72eadae6073d:/# <b>exit</b>
exit
user@host ~ % <b>&block;</b>
</pre>

Or on *Windows*:
<pre>
<b>root</b>@72eadae6073d:/# <b>exit</b>
exit
C:\WINDOWS><b>&block;</b>
</pre>

Before we go any further, *macOS* folk (and *Windows* folk unfamiliar with CLI):

> ***IMPORTANT!***<br />
> Since *macOS* ***is*** `*nix`, ***pay careful attention to the prompt***, to know whether you are ***inside*** your container ... or ***outside*** it (i.e. on your own machine).

Your *macOS* `Terminal` prompt looks something like this:
<pre>
<i>&lt;your_USER_name&gt;</i>@<i>&lt;your_HOST_name&gt;</i> <i>&lt;current_folder&gt;</i> % <b>&block;</b>
</pre>

And for completeness, the *Windows* `Command Prompt` looks something like this:
<pre>
C:\WINDOWS><b>&block;</b>
</pre>

If/when you are inside your *Docker* container, the prompt will ***always*** start with `root` followed by `@<container_id>` (twelve hexadecimal digits):
<pre>
<b>root</b>@c80c5927c652:/# <b>&block;</b>
</pre>

I think that's enough for one day. You now have your own little `*nix` sandbox in which to safely play to heart's content (and even if you royally mess it up, it is now super easy to create a new one whenever you wish).

Next time we'll cover the few *Docker* commands you will need.