### Functions for SCALARs or strings

    chomp, chop, chr, crypt, fc, hex, index, lc, lcfirst, length, oct, ord, pack, q//, qq//, reverse, rindex, sprintf, substr, tr///, uc, ucfirst, y///

    fc is available only if the "fc" feature is enabled or if it is prefixed with CORE::. The "fc" feature is enabled automatically with a use v5.16 (or higher) declaration in the current scope.

### Regular expressions and pattern matching

    m//, pos, qr//, quotemeta, s///, split, study

### Numeric functions

    abs, atan2, cos, exp, hex, int, log, oct, rand, sin, sqrt, srand

### Functions for real @ARRAYs

    each, keys, pop, push, shift, splice, unshift, values

### Functions for list data

    grep, join, map, qw//, reverse, sort, unpack

### Functions for real %HASHes

    delete, each, exists, keys, values

### Input and output functions

    binmode, close, closedir, dbmclose, dbmopen, die, eof, fileno, flock, format, getc, print, printf, read, readdir, readline, rewinddir, say, seek, seekdir, select, syscall, sysread, sysseek, syswrite, tell, telldir, truncate, warn, write

    say is available only if the "say" feature is enabled or if it is prefixed with CORE::. The "say" feature is enabled automatically with a use v5.10 (or higher) declaration in the current scope.

### Functions for fixed-length data or records

    pack, read, syscall, sysread, sysseek, syswrite, unpack, vec

### Functions for filehandles, files, or directories

    -X, chdir, chmod, chown, chroot, fcntl, glob, ioctl, link, lstat, mkdir, open, opendir, readlink, rename, rmdir, select, stat, symlink, sysopen, umask, unlink, utime

### Keywords related to the control flow of your Perl program

    break, caller, continue, die, do, dump, eval, evalbytes, exit, __FILE__, goto, last, __LINE__, next, __PACKAGE__, redo, return, sub, __SUB__, wantarray

    break is available only if you enable the experimental "switch" feature or use the CORE:: prefix. The "switch" feature also enables the default, given and when statements, which are documented in "Switch Statements" in perlsyn. The "switch" feature is enabled automatically with a use v5.10 (or higher) declaration in the current scope. In Perl v5.14 and earlier, continue required the "switch" feature, like the other keywords.

    evalbytes is only available with the "evalbytes" feature (see feature) or if prefixed with CORE::. __SUB__ is only available with the "current_sub" feature or if prefixed with CORE::. Both the "evalbytes" and "current_sub" features are enabled automatically with a use v5.16 (or higher) declaration in the current scope.

### Keywords related to scoping

    caller, import, local, my, our, package, state, use

    state is available only if the "state" feature is enabled or if it is prefixed with CORE::. The "state" feature is enabled automatically with a use v5.10 (or higher) declaration in the current scope.

### Miscellaneous functions

    defined, formline, lock, prototype, reset, scalar, undef

### Functions for processes and process groups

    alarm, exec, fork, getpgrp, getppid, getpriority, kill, pipe, qx//, readpipe, setpgrp, setpriority, sleep, system, times, wait, waitpid

### Keywords related to Perl modules

    do, import, no, package, require, use

### Keywords related to classes and object-orientation

    bless, dbmclose, dbmopen, package, ref, tie, tied, untie, use

### Low-level socket functions

    accept, bind, connect, getpeername, getsockname, getsockopt, listen, recv, send, setsockopt, shutdown, socket, socketpair

### System V interprocess communication functions

    msgctl, msgget, msgrcv, msgsnd, semctl, semget, semop, shmctl, shmget, shmread, shmwrite

### Fetching user and group info

    endgrent, endhostent, endnetent, endpwent, getgrent, getgrgid, getgrnam, getlogin, getpwent, getpwnam, getpwuid, setgrent, setpwent

### Fetching network info

    endprotoent, endservent, gethostbyaddr, gethostbyname, gethostent, getnetbyaddr, getnetbyname, getnetent, getprotobyname, getprotobynumber, getprotoent, getservbyname, getservbyport, getservent, sethostent, setnetent, setprotoent, setservent

### Time-related functions

    gmtime, localtime, time, times

### Non-function keywords

    and, AUTOLOAD, BEGIN, catch, CHECK, cmp, CORE, __DATA__, default, defer, DESTROY, else, elseif, elsif, END, __END__, eq, finally, for, foreach, ge, given, gt, if, INIT, isa, le, lt, ne, not, or, try, UNITCHECK, unless, until, when, while, x, xor
