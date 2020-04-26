---
layout: post
title: "<b>Baby Step 1:</b> Learning to crawl"
description: "Learn some basic housekeeping commands."
summary: "Learn some basic commands and how they are strung together."
comments: false
tags: [commands,docker,housekeeping]
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

If you're inside your *Docker* container, the prompt will ***always*** start with `root` followed by `@<container_id>` (twelve hexadecimal digits):
```
root@c80c5927c652:/#
```

With that out of the way, let us cover a few Docker housekeeping essentials. On the CLI (`Terminal` in *macOS* and `Command Prompt` in *Windows*) i.e. ***outside*** your container, this is how you list *Docker* containers:
```
C:\WINDOWS>docker container ls -a 
CONTAINER ID   IMAGE            COMMAND       CREATED        STATUS                      PORTS   NAMES
db2bbf2f9467   rootlifted/n4h   "/bin/bash"   20 hours ago   Exited (0) 57 seconds ago           n4h_sandbox
```
Some fields of interest:
* `CONTAINER ID` is the hexadecimal unique identifier *Docker* uses internally to identify your container. However you can use either that, or...
* `NAMES` field (which some may find more user friendly/memorable) when giving *Docker* instructions regarding your container.
* `IMAGE` the image used to create this container (if it is not present locally, it will be pulled from *DockerHub* repository).

If you are interested, you can see the details for the images downloaded onto your machine by entering the following command:
```
C:WINDOWS>docker images   
REPOSITORY       TAG      IMAGE ID       CREATED        SIZE
rootlifted/n4h   latest   3eba5a753352   20 hours ago   295MB
C:\WINDOWS>
```
Some fields of interest:
* `IMAGE ID` is the hexadecimal unique identifier which *Docker* obviously references when creating your container.
* `REPOSITORY` is the *DockerHub* repository you pulled the image from, there are obviously ***many*** other official vendor repositories e.g. [ubuntu](https://hub.docker.com/_/ubuntu), [postgres](https://hub.docker.com/_/postgres), [node](https://hub.docker.com/_/node), [maven](https://hub.docker.com/_/maven), [mongo](https://hub.docker.com/_/mongo), [nginx](https://hub.docker.com/_/nginx), [java](https://hub.docker.com/_/openjdk), [python](https://hub.docker.com/_/python), [windows](https://hub.docker.com/_/microsoft-windows-base-os-images), [iis](https://hub.docker.com/_/microsoft-windows-servercore-iis), [oracle](https://hub.docker.com/_/oracle-database-enterprise-edition) etc.
* `SIZE` might be interesting if you consider that typical operating system installations these days take up gigabytes, and virtual machine images therefore take up at least 8GB, but typically at least double that.

However for the scope of our endeavour which is to learn `*nix` (not become *Docker* gods), you will need to know:

How to create a container from a specified repository image (which we have done in the previous step, so no need to do again right now):
```
user@host ~ % docker run -ti --name=n4h_sandbox ubuntu /bin/bash
docker: Error response from daemon: Conflict. The container name "/n4h_sandbox" is already in use by container
"f749d99eff10e1d1a8ce743e69ab62db47d569493941543e83f3233c8266b40a".
You have to remove (or rename) that container to be able to reuse that name.
See 'docker run --help'.
user@host ~ % docker run -ti ubuntu /bin/bash
root@e26bc87dfc29:/# exit
exit
user@host ~ % n4h % docker container ls -a    
CONTAINER ID   IMAGE            COMMAND       CREATED          STATUS                     PORTS   NAMES
f749d99eff10   rootlifted/n4h   "/bin/bash"   20 hours ago     Exited (0) 8 minutes ago           n4h_sandbox
e26bc87dfc29   ubuntu           "/bin/bash"   2 seconds ago    Exited (0) 1 second ago            angry_thompson
user@host ~ % 
```

How to get into it (to the more technically savvy, you cannot `ssh` into this container, since it is not running `sshd` ... also notice how I snuck in the `start` command in there)
```
user@host ~ % docker container attach angry_thompson                                                         
You cannot attach to a stopped container, start it first
user@host ~ % docker container start angry_thompson
angry_thompson
user@host ~ % docker container attach angry_thompson
root@e26bc87dfc29:/# exit
exit
user@host ~ %
```

How to delete a container (in case you have royally mucked it up):
```
user@host ~ % n4h % docker container ls -a    
CONTAINER ID   IMAGE            COMMAND       CREATED          STATUS                     PORTS   NAMES
f749d99eff10   rootlifted/n4h   "/bin/bash"   20 hours ago     Exited (0) 8 minutes ago           n4h_sandbox
e26bc87dfc29   ubuntu           "/bin/bash"   30 seconds ago   Up 9 seconds                       angry_thompson
user@host ~ % docker container rm angry_thompson
Error response from daemon: You cannot remove a running container db2bbf2f946795e65b4a1a3600b929a866212cb35884baa14cdcb15cc41c6dd4.
Stop the container before attempting removal or force remove
user@host ~ % docker container stop angry_thompson
angry_thompson
user@host ~ % docker container rm angry_thompson   
angry_thompson
user@host ~ % n4h % docker container ls -a    
CONTAINER ID   IMAGE            COMMAND       CREATED          STATUS                     PORTS   NAMES
f749d99eff10   rootlifted/n4h   "/bin/bash"   20 hours ago     Exited (0) 8 minutes ago           n4h_sandbox
user@host ~ % 
```

As you can see I have made some premeditated educational errors. First, to illustrate that you cannot create two containers with the same name. If you do not specify a name (i.e. omit the `--name=...` part), *Docker* generates fun ones for you. And second, to slip in an additional command (`stop`), which realistically you will rarely need due to the way we use containers interactively, i.e. not running them as a web-server or database say.

Thus concludeth the *Docker* sermon. Next time ... we dive headlong into `*nix`!