#ChrootX

Small toolbox to create, clone, delete, start and stop chrooted environments, allowing lightweight virtualization within virtual servers again, where LXC or Qemu might fail to run.

Version: <b>0.0.7</b>

License: <b>GPLv3</b>

Platforms: <b>Linux</b> (Debian / Ubuntu 14.04 or later)

##Installation

```
% git clone http://github.com/Spiritdude/ChrootX

% cd ChrootX

% sudo make requirements install
```

##Usage
```
% sudo chrootx create ch01

% sudo chrootx create ch02 bash

% sudo chrootx start ch01

% sudo chrootx 
   ch01 (minimal): running
      ch02 (bash): stopped

% sudo chrootx -l
   ch01:
        status: running
     processes: 2
          type: minimal
         ctime: 2014/11/30 18:23:51.000 (1day 21hrs 34mins 47secs ago)
          size: 3,973,120
        
   ch02:
        status: stopped
          type: bash
         ctime: 2014/11/30 18:24:58.000 (1day 21hrs 35mins 48secs ago)
          size: 3,969,024

% sudo chrootx stop ch01

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
      --fs=<type>             filesystem in the image (default: ext4)
      
   commands:
      create <id> [<type>]    aka 'new', 'install', (default type: 'minimal')
                                 type: 'bash', 'busybox', 'centos', 'debian', 'fedora', 
                                       'minimal', 'nano', 'opensuse', 'redhat', 'ubuntu'
      clone <src> <dst>       clone existing chroot, same as 'new <src> clone:<dst>'
      delete <id>             aka 'deinstall', 'remove', 'destroy'
      start <id>              aka 'run'
      stop <id>               aka 'halt', 'kill', 'abort'
      info <id>
      list                    default action, use -l to list details

   examples:
      sudo chrootx new sys01 
      sudo chrootx new sys02 ubuntu
      sudo chrootx -i new sys03 clone:sys02
      sudo chrootx -i --size=60G new sys04 clone:sys02
      sudo chrootx clone sys03 sys05
```

##JChroot

ChrootX supports [jchroot](https://github.com/vincentbernat/jchroot), which isolates the processes further, and allows to set hostname with the chroot. 

Check if your vserver permits to run it:
```
% cd ChrootX
% make jchroot
```
create a chroot environment:
```
% sudo chrootx new sys01
% sudo chrootx start sys01
```
and see if it works, in case it fails, remove `jchroot` again:
```
% sudo rm -f /usr/sbin/jchroot
```
and keep using `chrootx` bare.

-- End of README.md --
