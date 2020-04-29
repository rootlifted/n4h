---
layout: post
title: "Baby Step 1: Learning to crawl"
description: "<b>Baby Step 1:</b> Learning to crawl"
summary: "Learn some basic commands and how they are strung together."
comments: false
tags: [commands,docker,housekeeping]
---

Let's first cover the *Docker* basics you may need to support your out-of-control `*nix` habit. On the CLI (`Terminal` in *macOS* and `Command Prompt` in *Windows*) i.e. ***outside*** your container, this is how you list *Docker* containers:
<pre>
C:\WINDOWS><b>docker container ls -a</b>
CONTAINER ID   IMAGE            COMMAND       CREATED        STATUS                      PORTS   NAMES
db2bbf2f9467   rootlifted/n4h   "/bin/bash"   20 hours ago   Exited (0) 57 seconds ago           n4h_sandbox
C:\WINDOWS><b>&block;</b>
</pre>

Some fields of interest:
* `CONTAINER ID` is the hexadecimal unique identifier *Docker* uses internally to identify your container. However you can use either that, or...
* `NAMES` field (which some may find more user friendly/memorable) when giving *Docker* instructions regarding your container.
* `IMAGE` the image used to create this container (if it is not present locally, it will be pulled from *DockerHub* repository).

If you are interested, you can see the details for the images downloaded onto your machine by entering the following command:
<pre>
C:WINDOWS><b>docker images</b>
REPOSITORY       TAG      IMAGE ID       CREATED        SIZE
rootlifted/n4h   latest   3eba5a753352   20 hours ago   295MB
C:\WINDOWS><b>&block;</b>
</pre>

Some fields of interest:
* `IMAGE ID` is the hexadecimal unique identifier which *Docker* obviously references when creating your container.
* `REPOSITORY` is the *DockerHub* repository you pulled the image from, there are obviously ***many*** other official vendor repositories e.g. [ubuntu](https://hub.docker.com/_/ubuntu), [postgres](https://hub.docker.com/_/postgres), [node](https://hub.docker.com/_/node), [maven](https://hub.docker.com/_/maven), [mongo](https://hub.docker.com/_/mongo), [nginx](https://hub.docker.com/_/nginx), [java](https://hub.docker.com/_/openjdk), [python](https://hub.docker.com/_/python), [windows](https://hub.docker.com/_/microsoft-windows-base-os-images), [iis](https://hub.docker.com/_/microsoft-windows-servercore-iis), [oracle](https://hub.docker.com/_/oracle-database-enterprise-edition) etc.
* `SIZE` might be interesting if you consider that typical operating system installations these days take up gigabytes, and virtual machine images therefore take up at least 8GB, but typically at least double that.

However for the scope of our endeavour which is to learn `*nix` (not become *Docker* gods), you will need to know:

* How to create a container.
* How to get into a container, or to use proper Docker terminology: "How to attach to it".
* How to delete a container.

**Create a Container**<br />
(We have done in the previous session, so no need to do again right now):
<pre>
user@host ~ % <b>docker run -ti --name=n4h_sandbox ubuntu /bin/bash</b>
docker: Error response from daemon: Conflict. The container name "/n4h_sandbox" is already in use by container
"f749d99eff10e1d1a8ce743e69ab62db47d569493941543e83f3233c8266b40a".
You have to remove (or rename) that container to be able to reuse that name.
See 'docker run --help'.
user@host ~ % <b>docker run -ti ubuntu /bin/bash</b>
<b>root</b>@e26bc87dfc29:/# <b>exit</b>
exit
user@host ~ % <b>n4h % docker container ls -a</b>
CONTAINER ID   IMAGE            COMMAND       CREATED          STATUS                     PORTS   NAMES
f749d99eff10   rootlifted/n4h   "/bin/bash"   20 hours ago     Exited (0) 8 minutes ago           n4h_sandbox
e26bc87dfc29   ubuntu           "/bin/bash"   2 seconds ago    Exited (0) 1 second ago            angry_thompson
user@host ~ % <b>&block;</b>
</pre>

**Attach to a Container**<br />
(to the more technically savvy, you cannot `ssh` into this container, since it is not running `sshd` ... also notice how I snuck in the `start` command in there)
<pre>
user@host ~ % <b>docker container attach angry_thompson</b>
You cannot attach to a stopped container, start it first
user@host ~ % <b>docker container start angry_thompson</b>
angry_thompson
user@host ~ % <b>docker container attach angry_thompson</b>
<b>root</b>@e26bc87dfc29:/# <b>exit</b>
exit
user@host ~ % <b>&block;</b>
</pre>

**Delete a container**<br />
(In case you have royally mucked it up):
<pre>
user@host ~ % n4h % <b>docker container ls -a</b>
CONTAINER ID   IMAGE            COMMAND       CREATED          STATUS                     PORTS   NAMES
f749d99eff10   rootlifted/n4h   "/bin/bash"   20 hours ago     Exited (0) 8 minutes ago           n4h_sandbox
e26bc87dfc29   ubuntu           "/bin/bash"   30 seconds ago   Up 9 seconds                       angry_thompson
user@host ~ % <b>docker container rm angry_thompson</b>
Error response from daemon: You cannot remove a running container db2bbf2f946795e65b4a1a3600b929a866212cb35884baa14cdcb15cc41c6dd4.
Stop the container before attempting removal or force remove
user@host ~ % <b>docker container stop angry_thompson</b>
angry_thompson
user@host ~ % <b>docker container rm angry_thompson</b>
angry_thompson
user@host ~ % <b>docker container ls -a</b>
CONTAINER ID   IMAGE            COMMAND       CREATED          STATUS                     PORTS   NAMES
f749d99eff10   rootlifted/n4h   "/bin/bash"   20 hours ago     Exited (0) 8 minutes ago           n4h_sandbox
user@host ~ % <b>&block;</b>
</pre>

As you can see I have made some premeditated educational errors. First, to illustrate that you cannot create two containers with the same name. If you do not specify a name (i.e. omit the `--name=...` part), *Docker* generates fun ones for you. And second, to slip in an additional command (`stop`), which realistically you will rarely need due to the way we use containers interactively, i.e. not running them as a web-server or database say.

**Docker Help**<br />
Just a quick look at the extensive documentation built into the *Docker* CLI.

General *Docker* `help` command (listing ALL the commands):
<pre>
user@host ~ % n4h % <b>docker help</b>

Usage:	docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default "/Users/rootlifted/.docker")
  -c, --context string     Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with "docker
                           context use")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket(s) to connect to
  -l, --log-level string   Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default "/Users/rootlifted/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/Users/rootlifted/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/Users/rootlifted/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Management Commands:
  builder     Manage builds
  config      Manage Docker configs
  container   Manage containers
  context     Manage contexts
  image       Manage images
  network     Manage networks
  node        Manage Swarm nodes
  plugin      Manage plugins
  secret      Manage Docker secrets
  service     Manage services
  stack       Manage Docker stacks
  swarm       Manage Swarm
  system      Manage Docker
  trust       Manage trust on Docker images
  volume      Manage volumes

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  build       Build an image from a Dockerfile
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  images      List images
  import      Import the contents from a tarball to create a filesystem image
  info        Display system-wide information
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  login       Log in to a Docker registry
  logout      Log out from a Docker registry
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  ps          List containers
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  run         Run a command in a new container
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  search      Search the Docker Hub for images
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  version     Show the Docker version information
  wait        Block until one or more containers stop, then print their exit codes

Run 'docker COMMAND --help' for more information on a command.
user@host ~ % n4h % <b>&block;</b>
</pre>

Specific *Docker* command help (in this case, listing all the commands pertaining to `container`):
<pre>
user@host ~ % n4h % <b>docker container help</b>

Usage:	docker container COMMAND

Manage containers

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  inspect     Display detailed information on one or more containers
  kill        Kill one or more running containers
  logs        Fetch the logs of a container
  ls          List containers
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  prune       Remove all stopped containers
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  run         Run a command in a new container
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  wait        Block until one or more containers stop, then print their exit codes

Run 'docker container COMMAND --help' for more information on a command.
user@host ~ % n4h % <b>&block;</b>
</pre>

Specific *Docker* argument help (in this case, listing all possible arguments for `container ls`):
<pre>
user@host ~ % n4h % <b>docker container ls --help</b>

Usage:	docker container ls [OPTIONS]

List containers

Aliases:
  ls, ps, list

Options:
  -a, --all             Show all containers (default shows just running)
  -f, --filter filter   Filter output based on conditions provided
      --format string   Pretty-print containers using a Go template
  -n, --last int        Show n last created containers (includes all states) (default -1)
  -l, --latest          Show the latest created container (includes all states)
      --no-trunc        Don't truncate output
  -q, --quiet           Only display numeric IDs
  -s, --size            Display total file sizes
user@host ~ % n4h % <b>&block;</b>
</pre>

Thus concludeth the *Docker* sermon. Next time ... we dive headlong into `*nix`!