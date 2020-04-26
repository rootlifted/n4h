---
layout: post
title: "<b>Baby Step 0</b>: Getting your very own padded playpen"
description: "Setting up a safe environment in which to experiment with no consequence to the student's workstation."
summary: "Setting up a safe environment in which to experiment with no consequence to the student's workstation."
comments: false
tags: [containerisation,docker,setup,virtualisation]
---

It is safe to assume that you are ***not*** running `*nix` on your home machine. Which reasonably leaves *Windows*, or *macOS* (which ***is*** `*nix`, but we don't want you experimenting on your own lifesupport do we?)

The "prime directive" before we start:<br />
> ***ZERO*** *impact/risk to your existing operating system and apps*.

This leaves two avenues open to us:

> **[Virtualisation](https://en.wikipedia.org/wiki/Virtualization)**<br />
> Which is software that virtualises the entire operating system (and is therefore a tad **heavy** for our purposes). [VirtualBox](https://www.virtualbox.org) would be a good example of a high quality free virtualisation tool.
>
> **[Containerisation](https://www.docker.com/resources/what-container)**<br />
> Which offers a **lightweight** container that is able to run all the applications we need. This is the route we will take, using a free, powerful and very popular tool called ***Docker***.
>
> <small>\* You will need *macOS* [10.13 or higher](https://hub.docker.com/editions/community/docker-ce-desktop-mac) or Microsoft *Windows* [10 Pro](https://hub.docker.com/editions/community/docker-ce-desktop-windows). Sorry `¯\_(ツ)_/¯` if you have coal-fired computing, get with the times man.</small>

Right.

Let's get you your very own little patch of `*nix` turf to till.

1. SET UP: a [DockerHub](https://hub.docker.com) account. This will allow you to pull down the [`rootlifted/n4h`](https://hub.docker.com/r/rootlifted/n4h) *Docker* image from the public repository.

2. DOWNLOAD & INSTALL: [Docker Desktop](https://www.docker.com/products/docker-desktop) on your machine.

3. RUN: freshly installed *Docker* application (which should prompt you to enter your freshly minted *DockerHub* user credentials).

4. OPEN CLI: If you are on *macOS*: press `⌘+Space` and type `Terminal`, OR, if you are on *Windows*: press `⊞+X` and select `Command Prompt` from the menu that pops up on the bottom left of the screen.

In your *macOS* `Terminal` enter the following *Docker* commands:
```
user@host ~ % docker login --username <enter_your_dockerhub_username_here>
Password: <enter_your_dockerhub_password_here>
Login Succeeded

user@host ~ % docker run -ti --name=n4h_sandbox -v <path_to_shared_folder>:/mnt/shared rootlifted/n4h /bin/bash
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

root@c80c5927c652:/#
```

The *Docker* commands in *Windows*  look exactly the same, only your prompt will look different:
```
C:\WINDOWS>docker login --username <enter_your_dockerhub_username_here>
Password: <enter_your_dockerhub_password_here>
Login Succeeded

C:\WINDOWS>docker run -ti --name=n4h_sandbox -v <path_to_shared_folder>:/mnt/shared rootlifted/n4h /bin/bash
...
root@72eadae6073d:/# 
```
***NOTE:*** Where `<path_to_shared_folder>` would be an arbitrary folder (e.g. `/Users/user/docker` for *macOS* or `C:\USERS\user\docker` for *Windows*) that you wish to use as shared folder into/out of the container.

So ... you have now:
- [X] Created a *DockerHub* user.
- [X] Downloaded and installed *Docker Desktop*.
- [X] Opened a command-line window.
- [X] Pulled down the `rootlifted/n4h` *Docker* image from *DockerHub*.
- [X] Created your very first and very own `*nix` container.

To list the `*nix` filesystem, type the following command:
```
root@72eadae6073d:/# ls -l
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
root@72eadae6073d:/# 
```
And to exit the container, simply type `exit`:
```
root@72eadae6073d:/# exit
exit
user@host ~ % 
```

Or on *Windows*:
```
root@72eadae6073d:/# exit
exit
C:\WINDOWS>
```

I think that's enough for one day. You now have your own little `*nix` sandbox in which to safely play to heart's content (and even if you royally mess it up, it is now super easy to create a new one whenever you wish).

Next time we'll cover the few *Docker* commands you will need. And once that has been adequately covered, the following session will cover some basic `*nix` commands.