module libuv @if(env::POSIX);
import std::net::os;

struct UV_PLATFORM_LOOP_FIELDS_t @if(!$defined(UV_PLATFORM_LOOP_FIELDS_t)) {
    os::Posix_pollfd* poll_fds;
    int128 poll_fds_used; // size_t
    int128 poll_fds_size; // size_t
    CUChar poll_fds_iterating; 
}
