Installation
------------

    $ sudo apt-get install aptitude apt-file
    $ echo "source atsign.sh" >> ~/.bashrc
    $ source atsign.sh
    $ @ -u

Usage
-----

Missing program:

    $ errno ENOMEM
    bash: errno: command not found
    $ @
    moreutils:  errno
    The following NEW packages will be installed:
      moreutils 
    0 packages upgraded, 1 newly installed, 0 to remove and 108 not upgraded.
    Need to get 0 B/62.9 kB of archives. After unpacking 163 kB will be used.
    Do you want to continue? [Y/n/?] y
    Selecting previously unselected package moreutils.
    (Reading database ... 174781 files and directories currently installed.)
    Unpacking moreutils (from .../moreutils_0.49_amd64.deb) ...
    Processing triggers for man-db ...
    Setting up moreutils (0.49) ...
                                             
    $ errno ENOMEM
    ENOMEM 12 Cannot allocate memory
    $

Missing library:

    $ gcc -lreadline main.c
    /usr/bin/ld: cannot find -lreadline
    collect2: error: ld returned 1 exit status
    $ @ -lreadline
         1  lib32readline-gplv2-dev:  libreadline.a  libreadline.so
         2  lib32readline6-dev:       libreadline.a  libreadline.so
         3  libreadline-gplv2-dev:    libreadline.a  libreadline.so
         4  libreadline6-dev:         libreadline.a  libreadline.so
    > 4
    The following NEW packages will be installed:
      libreadline6-dev 
    0 packages upgraded, 1 newly installed, 0 to remove and 108 not upgraded.
    Need to get 193 kB of archives. After unpacking 726 kB will be used.
    Do you want to continue? [Y/n/?] y
    Get: 1 http://ftp.no.debian.org/debian/ unstable/main libreadline6-dev amd64 6.2+dfsg-0.1 [193 kB]
    Fetched 193 kB in 0s (1,116 kB/s)        
    Selecting previously unselected package libreadline6-dev:amd64.
    (Reading database ... 174815 files and directories currently installed.)
    Unpacking libreadline6-dev:amd64 (from .../libreadline6-dev_6.2+dfsg-0.1_amd64.deb) ...
    Setting up libreadline6-dev:amd64 (6.2+dfsg-0.1) ...
                                             
    $ gcc -lreadline main.c
    $ ./a.out 
    Woo hoo!
    $

Missing manual entry:

    $ man erl_connect
    No manual entry for erl_connect
    $ @ erl_connect
         1  erlang-doc:       erl_connect.html
         2  erlang-manpages:  erl_connect.3erl.gz
         3  erlang-src:       erl_connect.c        erl_connect.h
    > 2
    The following NEW packages will be installed:
      erlang-manpages 
    0 packages upgraded, 1 newly installed, 0 to remove and 108 not upgraded.
    Need to get 1,625 kB of archives. After unpacking 1,616 kB will be used.
    Do you want to continue? [Y/n/?] y
    Get: 1 http://ftp.no.debian.org/debian/ unstable/main erlang-manpages all 1:16.b.1-dfsg-4 [1,625 kB]
    Fetched 1,625 kB in 1s (1,231 kB/s)          
    Selecting previously unselected package erlang-manpages.
    (Reading database ... 174841 files and directories currently installed.)
    Unpacking erlang-manpages (from .../erlang-manpages_1%3a16.b.1-dfsg-4_all.deb) ...
    Processing triggers for man-db ...
    Setting up erlang-manpages (1:16.b.1-dfsg-4) ...
                                             
    $ man erl_connect
    rl_connect(3erl)             C Library Functions            erl_connect(3erl)

    NAME
           erl_connect - Communicate with Distributed Erlang
    .
    .
    .
