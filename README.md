=CHROOTX=
Small toolbox to create, delete, start and stop chrooted environments.

License: GPLv3

Platforms: Linux (Ubuntu 14.04 or later)

==Installation==

<pre>
% git clone http://github.com/Spiritdude/ChrootX
% cd ChrootX
% sudo make requirements install
</pre>

==Usage==
<pre>
% sudo chrootx create ch01
% sudo chrootx create ch02 bash

% sudo chrootx start ch01

% sudo chrootx 
   ch01 (minimal): running
      ch02 (bash): stopped

% sudo chroot -l
   ch01:
        status: running
        type: minimal
        ctime: 2014/11/30 18:23:51.000 (1day 21hrs 34mins 47secs ago)
        size: 3,973,120
        
   ch02:
        status: stopped
        type: bash
        ctime: 2014/11/30 18:24:58.000 (1day 21hrs 35mins 48secs ago)
        size: 3,969,024

% sudo chroot stop ch01

% sudo chroot help
chrootx 0.0.1 usage: [<options>] <command> [<arguments>]
   options:
      -verbose or -v or -vv   increase verbosity
      -conf <file>            consider configuration file
      -l                      long output
      
   commands:
      create <id> [<type>]    type: 'bash', 'busybox', 'debian', 'minimal', 'nano', 'ubuntu'
      delete <id>
      start <id>
      stop <id>
      info <id>
      list
        
</pre>

-- End of README.md --
