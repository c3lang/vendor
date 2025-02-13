module libuv @if(!env::WIN32);
import std::os::posix;

def Async_unused = fn void();
import std::thread::os;

def Platform_sockaddr_in6 = void*; // todo implement ipv6

struct UVBuf {
  CChar* base;
  CLongLong len;
}

// struct UV_LOOP_PRIVATE_FIELDS_t {
//     inline UV_PLATFORM_LOOP_FIELDS_t uv_platform_loop_fields;
//     CULong flags;
//     CInt backend_fd;
//     UV__Queue pending_queue;
//     UV__Queue watcher_queue;
//     UV__Io** watchers;
//     CUInt nwatchers;
//     CUInt nfds;  
//     UV__Queue wq;
//     UVMutex wq_mutex;
//     UVAsync wq_async;
//     UVRwlue prepare_handles;
//     UV__Queue check_handles; 
//     UV__Queue idle_handles; 
//     UV__Queue async_handles; 
//     Async_unused async_unused;  /* TODO(bnoordhuis) Remove in libuv v2. */ 
//     UV__Io async_io_watcher;
//     CInt async_wfd;
//     struct timer_heap {
//         void* min; 
//         CUInt nelts; 
//     }
//     CULongLong timer_counter;
//     CULongLong time;
//     CInt[2]* signal_pipefd;
//     UV__Io signal_io_watcher;  
//     UVSignal child_watcher;
//     CInt emfile_fd;
// }

// struct UV_PLATFORM_LOOP_FIELDS_t @if(!$defined(UV_PLATFORM_LOOP_FIELDS_t)) {
//     void* empty;
// }

struct UV_HANDLE_PRIVATE_FIELDS_t {
    CUInt flags;
}

def Unix_sa_family = CUChar;
def UV__IoCb = fn void(UVLoop* loop, UV__Io* w, CUInt events);

struct UV__Io {
  UV__IoCb cb;
  UV__Queue pending_queue;
  UV__Queue watcher_queue;
  CUInt pevents; /* Pending event mask i.e. mask at next tick. */
  CUInt events;  /* Current event mask. */
  CInt fd;
  CInt rcount @if(env::BSD_FAMILY || env::DARWIN);
  CInt wcount @if(env::BSD_FAMILY || env::DARWIN);
}

def Platform_sockaddr = Unix_sockaddr;
def Platform_sockaddr_in = Unix_sockaddr_in;

def Unix_in_addr_t = uint;
def Unix_in_port_t = ushort;

struct Unix_in_addr {
           Unix_in_addr_t s_addr;
       }

struct Unix_sockaddr_in {
           Unix_sa_family     sin_family;     /* AF_INET */
           Unix_in_port_t       sin_port;       /* Port number */
           Unix_in_addr  sin_addr;       /* IPv4 address */
       }

struct Unix_sockaddr {
	CUChar sa_len;
	Unix_sa_family sa_family;
	CChar[14]* sa_data;
}

struct Unix_sockaddr_storage {
	CUChar ss_len;
	Unix_sa_family ss_family;
	CChar[(CLong.sizeof - CUChar.sizeof - Unix_sa_family.sizeof)]* __ss_pad1;
	CLongLong __ss_align;
	CChar[(128 - CUChar.sizeof - Unix_sa_family.sizeof - ((CLong.sizeof) - CUChar.sizeof - Unix_sa_family.sizeof) - (CLong.sizeof))]* __ss_pad2;
}

def Platform_addrinfo = Unix_addrinfo;

// https://www.man7.org/linux/man-pages/man3/getaddrinfo.3.html
struct Unix_addrinfo {
   CInt             ai_flags;
   CInt             ai_family;
   CInt             ai_socktype;
   CInt             ai_protocol;
   CInt             ai_addrlen; // socklen_t ?
   Unix_sockaddr    *ai_addr;
   char             *ai_canonname;
   Unix_addrinfo    *ai_next;
}

// https://stackoverflow.com/questions/9602685/why-does-mode-t-use-4-byte
// todo: needs to be 32 bits. please make check 
def Unix_mode_t = CULong @if(!$defined(Unix_mode_t));
// https://stackoverflow.com/a/23924078
// there mode_t uses unsigned int. please check
def Unix_dev_t = CULong;
def Unix_uid_t = CUInt;
def Unix_gid_t = CUInt;
def Unix_ino_t = CULong;
def Unix_ino64_t = CULong;
def Unix_nlink_t = CULong;
def Unix_off_t = CLong;
def Unix_off64_t = CLong;

def UVFile = CInt;
def UVOsSock = CInt;
def UVOsFd = CInt;
def UVPid = CInt;
def UVUid = Unix_uid_t;
def UVGid = Unix_gid_t;

def UVOnce = Pthread_once_t;
def UVThread = Pthread_t;
def UVMutex = Pthread_mutex_t;
def UVRWLock = Pthread_rwlock_t;
def UV_PLATFORM_SEM_t = CLong @if(!$defined(UV_PLATFORM_SEM_t));
def UVSem = UV_PLATFORM_SEM_t; // todo: implement all unix os
def UVCond = Pthread_cond_t;
def UVKey = Pthread_key_t;