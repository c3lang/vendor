module libuv @if(env::OS_TYPE == OsType.LINUX);

struct UV_PLATFORM_LOOP_FIELDS_t {
    UV__Io inotify_read_watcher;
    void* inotify_watchers;
    CInt inotify_fd;
}

const MAXHOSTNAMELEN = 1024;