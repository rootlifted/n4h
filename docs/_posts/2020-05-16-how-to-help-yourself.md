---
layout: post
title: "Baby Step 3: How to help yourself"
description: "<b>Baby Step 3:</b> How to help yourself"
summary: "How to to find help on commands and their usage."
comments: false
tags: [basicnix,bash builtins,help,man]
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

> `<digression>`
> 
> Just to be clear, this entire `*nix`4*humans* effort assumes reasonably up-to-date versions of GNU binaries, which you *absolutely* have in your `n4h` container, and is almost certainly present on most modern corporate Linux servers (like [RedHat Enterprise Linux](https://en.wikipedia.org/wiki/Red_Hat_Enterprise_Linux) or [Ubuntu](https://en.wikipedia.org/wiki/Ubuntu)) in your employer's data-centre.
> 
> However I ***know*** (from personal experience) that there are some dark, *unspeakably* filthy corners in companies that I have worked for, that probably right now still have dust-caked [Solaris](https://en.wikipedia.org/wiki/Solaris_(operating_system)) 9, [HP-UX](https://en.wikipedia.org/wiki/HP-UX) 10, [AIX](https://en.wikipedia.org/wiki/IBM_AIX) 6 or [FreeBSD](https://en.wikipedia.org/wiki/FreeBSD) 9 servers in racks ... that they don't even know exist.
> 
> Also there are some exotic special flavours of `*nix` like:
> * [macOS](https://en.wikipedia.org/wiki/MacOS) (Apple took BSD and *obviously* diverged on their own weird tangent for decades)
> * [OpenBSD](https://en.wikipedia.org/wiki/OpenBSD) (BSD that has been heavily security audited and nearly rebuilt)
> * [Android](https://en.wikipedia.org/wiki/Android_(operating_system)) (Google uses [ToyBox](https://en.wikipedia.org/wiki/Toybox) as a pared down substitute of coreutils),
> * [JunOS](https://en.wikipedia.org/wiki/Junos_OS) and Cisco [IOS](https://en.wikipedia.org/wiki/Cisco_IOS) (Enterprise/Telco Switchgear)
> 
> So considering the bewildering evolutionary proliferation of `*nix` species in the wild, as is clearly illustrated by these two family trees:
> * [`*nix`](https://en.wikipedia.org/wiki/Unix-like#/media/File:Unix_history-simple.svg),
> * [Linux](https://en.wikipedia.org/wiki/File:Linux_Distribution_Timeline.svg)
> 
> ...trying to achieve a single-anatomy-course-fits-all is simply impossible despite the valiant efforts of:
> * POSIX ([Portable Operating System Interface](https://en.wikipedia.org/wiki/POSIX))
> * SUS ([Single UNIX Standard](https://en.wikipedia.org/wiki/Single_UNIX_Specification))
> * LSB ([Linux Standard Base](https://en.wikipedia.org/wiki/Linux_Standard_Base))
> 
> `</digression>`

Sorry, I digress. There are arcane volumes you can reach for when you need to reference minor specifics of a `*nix` incantation.

> DIY Incantation Assistance:
> 
> * **`help`** : If you need to look up shell 'built-ins' like `cd` or `pwd` or `kill`.\*
> * **`<command> --help`** : If you quickly want to verify a command line option/switch/argument.\*\*
> * **`man <command>`** : Very thorough searchable [manual](http://linuxcommand.org/lc3_man_pages/ls1.html) entries on the specified `*nix` command (like the JDK [docs](https://docs.oracle.com/en/java/javase/14/docs/api/java.base/java/lang/StringBuilder.html) or .NET [docs](https://docs.microsoft.com/en-us/dotnet/api/system.text.stringbuilder) page if you're a developer).\*\*\*
> * **`www`** : And finally, ask the Internet [obviously](https://lmgtfy.com/?q=gnu+ls+documentation&s=d).
> 
> <small>\* This command will work ***only*** on GNU `bash` which is fairly ubiquitous in the wild, and is obviously the shell used in `ubuntu` (and thus `n4h`) *Docker* images, and therefore your container.</small><br />
> <small>\*\* Almost all GNU commands support `--version` and `--help`, some BSD commands may have this.</small><br />
> <small>\*\*\* In minimalist server installations (and in *Docker* images) the manual pages are typically not installed to save space.</small>

As you can see below, **`help`** (not unlike **`docker help`**) shows all the `bash` built-ins for which help is available:
<pre>
root@f749d99eff10:/usr/bin# <b>help</b>
<b>GNU bash</b>, version 4.4.20(1)-release (x86_64-pc-linux-gnu)
These shell commands are defined internally.  Type `help' to see this list.
Type `help name' to find out more about the function `name'.
Use `info bash' to find out more about the shell in general.
Use `man -k' or `info' to find out more about commands not in this list.

A star (*) next to a name means that the command is disabled.

 job_spec [&]                                                                    history [-c] [-d offset] [n] or history -anrw [filename] or history -ps arg >
 (( expression ))                                                                if COMMANDS; then COMMANDS; [ elif COMMANDS; then COMMANDS; ]... [ else COMM>
 . filename [arguments]                                                          jobs [-lnprs] [jobspec ...] or jobs -x command [args]
 :                                                                               kill [-s sigspec | -n signum | -sigspec] pid | jobspec ... or kill -l [sigsp>
 [ arg... ]                                                                      let arg [arg ...]
 [[ expression ]]                                                                local [option] name[=value] ...
 alias [-p] [name[=value] ... ]                                                  logout [n]
 bg [job_spec ...]                                                               mapfile [-d delim] [-n count] [-O origin] [-s count] [-t] [-u fd] [-C callba>
 bind [-lpsvPSVX] [-m keymap] [-f filename] [-q name] [-u name] [-r keyseq] [->  popd [-n] [+N | -N]
 break [n]                                                                       printf [-v var] format [arguments]
 builtin [shell-builtin [arg ...]]                                               pushd [-n] [+N | -N | dir]
 caller [expr]                                                                   pwd [-LP]
 case WORD in [PATTERN [| PATTERN]...) COMMANDS ;;]... esac                      read [-ers] [-a array] [-d delim] [-i text] [-n nchars] [-N nchars] [-p prom>
 cd [-L|[-P [-e]] [-@]] [dir]                                                    readarray [-n count] [-O origin] [-s count] [-t] [-u fd] [-C callback] [-c q>
 command [-pVv] command [arg ...]                                                readonly [-aAf] [name[=value] ...] or readonly -p
 compgen [-abcdefgjksuv] [-o option] [-A action] [-G globpat] [-W wordlist]  [>  return [n]
 complete [-abcdefgjksuv] [-pr] [-DE] [-o option] [-A action] [-G globpat] [-W>  select NAME [in WORDS ... ;] do COMMANDS; done
 compopt [-o|+o option] [-DE] [name ...]                                         set [-abefhkmnptuvxBCHP] [-o option-name] [--] [arg ...]
 continue [n]                                                                    shift [n]
 coproc [NAME] command [redirections]                                            shopt [-pqsu] [-o] [optname ...]
 declare [-aAfFgilnrtux] [-p] [name[=value] ...]                                 source filename [arguments]
 dirs [-clpv] [+N] [-N]                                                          suspend [-f]
 disown [-h] [-ar] [jobspec ... | pid ...]                                       test [expr]
 echo [-neE] [arg ...]                                                           time [-p] pipeline
 enable [-a] [-dnps] [-f filename] [name ...]                                    times
 eval [arg ...]                                                                  trap [-lp] [[arg] signal_spec ...]
 exec [-cl] [-a name] [command [arguments ...]] [redirection ...]                true
 exit [n]                                                                        type [-afptP] name [name ...]
 export [-fn] [name[=value] ...] or export -p                                    typeset [-aAfFgilnrtux] [-p] name[=value] ...
 false                                                                           ulimit [-SHabcdefiklmnpqrstuvxPT] [limit]
 fc [-e ename] [-lnr] [first] [last] or fc -s [pat=rep] [command]                umask [-p] [-S] [mode]
 fg [job_spec]                                                                   unalias [-a] name [name ...]
 for NAME [in WORDS ... ] ; do COMMANDS; done                                    unset [-f] [-v] [-n] [name ...]
 for (( exp1; exp2; exp3 )); do COMMANDS; done                                   until COMMANDS; do COMMANDS; done
 function name { COMMANDS ; } or name () { COMMANDS ; }                          variables - Names and meanings of some shell variables
 getopts optstring name [arg]                                                    wait [-n] [id ...]
 hash [-lr] [-p pathname] [-dt] [name ...]                                       while COMMANDS; do COMMANDS; done
 help [-dms] [pattern ...]                                                       { COMMANDS ; }
root@f749d99eff10:/# <b>&block;</b>
</pre>

**`help`** for a specific `bash` built-in command (in this case **`cd`**):
<pre>
root@f749d99eff10:~# <b>help cd</b>
cd: cd [-L|[-P [-e]] [-@]] [dir]
    Change the shell working directory.
    
    Change the current directory to DIR.  The default DIR is the value of the
    HOME shell variable.
    
    The variable CDPATH defines the search path for the directory containing
    DIR.  Alternative directory names in CDPATH are separated by a colon (:).
    A null directory name is the same as the current directory.  If DIR begins
    with a slash (/), then CDPATH is not used.
    
    If the directory is not found, and the shell option `cdable_vars' is set,
    the word is assumed to be  a variable name.  If that variable has a value,
    its value is used for DIR.
    
    Options:
      -L	force symbolic links to be followed: resolve symbolic
    		links in DIR after processing instances of `..'
      -P	use the physical directory structure without following
    		symbolic links: resolve symbolic links in DIR before
    		processing instances of `..'
      -e	if the -P option is supplied, and the current working
    		directory cannot be determined successfully, exit with
    		a non-zero status
      -@	on systems that support it, present a file with extended
    		attributes as a directory containing the file attributes
    
    The default is to follow symbolic links, as if `-L' were specified.
    `..' is processed by removing the immediately previous pathname component
    back to a slash or the beginning of DIR.
    
    Exit Status:
    Returns 0 if the directory is changed, and if $PWD is set successfully when
    -P is used; non-zero otherwise.
root@f749d99eff10:~# <b>&block;</b>
</pre>

What happens when you run the **`help`** command on macOS ... which is not Linux, but a BSD derivant, that recently (with the release of Catalina aka 10.15) moved from `bash` to `zsh`:
<pre>
user@host % <b>help</b>
<b>zsh</b>: command not found: help
user@host % <b>&block;</b>
</pre>

So let's try the **`<command> --help`** trick inside our `n4h` *Docker* image:
<pre>
root@f749d99eff10:~# <b>tee --help</b>
Usage: tee [OPTION]... [FILE]...
Copy standard input to each FILE, and also to standard output.

  -a, --append              append to the given FILEs, do not overwrite
  -i, --ignore-interrupts   ignore interrupt signals
  -p                        diagnose errors writing to non pipes
      --output-error[=MODE]   set behavior on write error.  See MODE below
      --help     display this help and exit
      --version  output version information and exit

MODE determines behavior with write errors on the outputs:
  'warn'         diagnose errors writing to any output
  'warn-nopipe'  diagnose errors writing to any output not a pipe
  'exit'         exit on error writing to any output
  'exit-nopipe'  exit on error writing to any output not a pipe
The default MODE for the -p option is 'warn-nopipe'.
The default operation when --output-error is not specified, is to
exit immediately on error writing to a pipe, and diagnose errors
writing to non pipe outputs.

GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
Report tee translation bugs to <http://translationproject.org/team/>
Full documentation at: <http://www.gnu.org/software/coreutils/tee>
or available locally via: info '(coreutils) tee invocation'
root@f749d99eff10:~# <b>tee --version</b>
<b>tee (GNU coreutils) 8.28</b>
Copyright (C) 2017 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Mike Parker, Richard M. Stallman, and David MacKenzie.
root@f749d99eff10:~# <b>&block;</b>
</pre>

Let us compare that with macOS again:
<pre>
user@host % <b>tee --help</b>
tee: illegal option -- -
usage: tee [-ai] [file ...]
user@host % <b>tee --version</b>
tee: illegal option -- -
usage: tee [-ai] [file ...]
user@host %  <b>&block;</b>
</pre>

And now we finally get to the `*nix` online reference **`man`**ual. Let us first see what it looks like when it is not present. Worst case:
<pre>
noddy@server:~# <b>man</b>
bash: man: command not found
noddy@server:~# <b>&block;</b>
</pre>
Or in the case of the *Docker* `ubuntu` image:
<pre>
root@ubuntu_container:/# <b>man</b>
This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, including manpages, you can run the 'unminimize'
command. You will still need to ensure the 'man-db' package is installed.
root@ubuntu_container:/# <b>&block;</b>
</pre>

And now ... *finally* ... in your `n4h` container:
<pre>
root@f749d99eff10:/usr/bin# <b>man</b>
What manual page do you want?
root@f749d99eff10:/# <b>&block;</b>
</pre>

Oooh. Let's use the **`tee`** command. I know we've not discussed it, but it is super simple and therefore short, and perhaps it illustrates the benefit of a manual page. ;)
<pre>
TEE(1)                                                                  User Commands                                                                 TEE(1)

NAME
       tee - read from standard input and write to standard output and files

SYNOPSIS
       tee [OPTION]... [FILE]...

DESCRIPTION
       Copy standard input to each FILE, and also to standard output.

       -a, --append
              append to the given FILEs, do not overwrite

       -i, --ignore-interrupts
              ignore interrupt signals

       -p     diagnose errors writing to non pipes

       --output-error[=MODE]
              set behavior on write error.  See MODE below

       --help display this help and exit

       --version
              output version information and exit

   MODE determines behavior with write errors on the outputs:
       'warn' diagnose errors writing to any output

       'warn-nopipe'
              diagnose errors writing to any output not a pipe

       'exit' exit on error writing to any output

       'exit-nopipe'
              exit on error writing to any output not a pipe

       The  default  MODE  for  the -p option is 'warn-nopipe'.  The default operation when --output-error is not specified, is to exit immediately on error
       writing to a pipe, and diagnose errors writing to non pipe outputs.

AUTHOR
       Written by Mike Parker, Richard M. Stallman, and David MacKenzie.

REPORTING BUGS
       GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
       Report tee translation bugs to <http://translationproject.org/team/>

COPYRIGHT
       Copyright (C) 2017 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       Full documentation at: <http://www.gnu.org/software/coreutils/tee>
       or available locally via: info '(coreutils) tee invocation'

<b>GNU coreutils 8.28</b>                                                      January 2018                                                                  TEE(1)
 Manual page tee(1) line 9/57 (END) (press h for help or q to quit)
</pre> 

Now remember how macOS stubbornly refused to play ball with **`tee --version`** and **`tee --help`**? Let's try **`man tee`** on macOS:
<pre>
TEE(1)                    <b>BSD</b> General Commands Manual                   TEE(1)

NAME
     tee -- pipe fitting

SYNOPSIS
     tee [-ai] [file ...]

DESCRIPTION
     The tee utility copies standard input to standard output, making a copy in zero or more files.  The output is unbuffered.

     The following options are available:

     -a      Append the output to the files rather than overwriting them.

     -i      Ignore the SIGINT signal.

     The following operands are available:

     file  A pathname of an output file.

     The tee utility takes the default action for all signals, except in the event of the -i option.

     The tee utility exits 0 on success, and >0 if an error occurs.

STANDARDS
     The tee function is expected to be POSIX IEEE Std 1003.2 (``POSIX.2'') compatible.

<b>BSD</b>                              June 6, 1993                              <b>BSD</b>
</pre>

There you have a classic example of how Ubuntu and macOS are both "`*nix`". ;)

You should now be able to find clues to your `*nix` questions, even without an Internet link.

<small>However, I will concede it is sometimes easier to search a very specific problem online.</small>

Next time we'll start doing things to/with files/folders.