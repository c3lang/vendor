module libuv @if(env::OS_TYPE == OsType.SOLARIS);

import std::net::os;

/* For the sake of convenience and reduced #ifdef-ery in src/unix/sunos.c,
* add the fs_event fields even when this version of SunOS doesn't support
* file watching.
*/