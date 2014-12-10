#ChrootX

Small toolbox to create, clone, delete, start and stop chrooted environments, allowing lightweight virtualization within virtual servers again, where LXC or Qemu/KVM might fail to run.

Version: <b>0.0.7</b>

License: <b>GPLv3</b>

Platforms: <b>Linux</b> (Debian / Ubuntu 14.04 or later)

Chrooted Distributions: <b>Debian, Ubuntu, Fedora, RedHat, CentOS, OpenSUSE, Busybox, Bash</b> (default)

##Installation

```
% git clone http://github.com/Spiritdude/ChrootX

% cd ChrootX

% sudo make requirements install
```

##Usage
All chroot environments are identified with an id:
```
% sudo chrootx create ch01

% sudo chrootx create ch02 bash

% sudo chrootx start ch01

% sudo chrootx 
   ch01 (minimal): running: 1 process
      ch02 (bash): stopped

% sudo chrootx -l
   ch01:
        status: running
     processes: 2
          type: minimal
         ctime: 2014/11/30 18:23:51.000 (1day 21hrs 34mins 47secs ago)
          size: 3,973,120 bytes
        
   ch02:
        status: stopped
          type: bash
         ctime: 2014/11/30 18:24:58.000 (1day 21hrs 35mins 48secs ago)
          size: 3,969,024 bytes

% sudo chrootx stop ch01

% sudo chrootx new ch03 ubuntu

% sudo chrootx start ch03 /bin/bash
(configure system, and install apache2)

% sudo chrootx start ch03 /etc/init.d/apache2 start

% sudo chrootx help
chrootx 0.0.6 usage: [<options>] <command> [<arguments>]
   options:
      -verbose or -v or -vv   increase verbosity
      -conf <file>            consider configuration file
      -version or --version   display version
      -l                      long output
      -i                      image-based root 
      --format=<type>         image format (default: qcow2)
                                 type: 'cloop', 'cow', 'qcow', 'qcow2', 'raw', 'vdi', 'vmdk'
      --size=<size>           size of image (default: 4G)
                                 e.g. '200M', '2G' etc
      --fs=<type>             fs-type in the image (default: ext4)
      
   commands:
      create <id> [<type>]    aka 'new', 'install', (default type: 'minimal')
                                 type: 'bash', 'busybox', 'centos', 'debian', 'fedora', 
                                       'minimal', 'nano', 'opensuse', 'redhat', 'ubuntu'
      clone <src> <dst>       clone existing chroot, same as 'new <src> clone:<dst>'
      delete <id>             aka 'deinstall', 'remove', 'destroy'
      start <id> [<cmds>] ..  aka 'run'
      stop <id>               aka 'halt', 'kill', 'abort'
      info <id>               aka 'status'
      list                    default action, use -l to list details

   examples:
      sudo chrootx new sys01 
      sudo chrootx new sys02 ubuntu
      sudo chrootx -i new sys03 clone:sys02
      sudo chrootx -i --size=60G new sys04 clone:sys02
      sudo chrootx clone sys03 sys05
```

##Limitations
*no process isolation, root in chrooted enviroment affects host environment, chrooted sshd thinks it's running already etc.
*don't run /sbin/init, as it won't able to distinct of chrooted system and host
*hostname can't be set within the chrooted environment, it will change hostname of host 

##JChroot

ChrootX supports [jchroot](https://github.com/vincentbernat/jchroot), which isolates the processes further, and allows to set hostname with the chroot - check if your vserver permits to run it:
```
% cd ChrootX
% sudo make jchroot
```
which compiles and installs `jchroot` to /usr/sbin/
```
% sudo chrootx -j start sys01
```
and see if it works. The `-j` switch enables `jchroot` if it exists.

<b>Note:</b> all started chrooted environments must be stopped again before you can restart with `-j` switch.


<br><br><br>
--- End of README.md ---
