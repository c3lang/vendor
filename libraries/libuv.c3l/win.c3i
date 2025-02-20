module libuv @if(env::WIN32);
import std::os::win32;

struct UVBuf {
  Win32_ULONG len;
  CChar* base;
}

const UV_MSAFD_PROVIDER_COUNT = 4;

// struct UV_LOOP_PRIVATE_FIELDS_t {
//     Win32_HANDLE iocp;
//     /* The current time according to the event loop. in msecs. */ 
//     CULongLong time;
//     /* Tail of a single-linked circular queue of pending reqs. If the queue */
//     /* is empty, tail_ is NULL. If there is only one item, */ 
//     /* tail_->next_req == tail_ */
//     UVReq* pending_reqs_tail;
//     /* Head of a single-linked list of closed handles */
//     UVHandle* endgame_handles;
//     /* TODO(bnoordhuis) Stop heap-allocating |timer_heap| in libuv v2.x. */
//     void* timer_heap;
//     /* Lists of active loop (prepare / check / idle) watchers */
//     UVPrepare* prepare_handles;
//     UVCheck* check_handles;
//     UVIdle* idle_handles;
//     /* This pointer will refer to the prepare/check/idle handle whose */
//     /* callback is scheduled to be called next. This is needed to allow */ 
//     /* safe removal from one of the lists above while that list being */
//     /* iterated over. */
//     UVPrepare* next_prepare_handle;
//     UVCheck* next_check_handle;
//     UVIdle* next_idle_handle;
//     /* This handle holds the peer sockets for the fast variant of uv_poll_t */
//     Win32_SOCKET[UV_MSAFD_PROVIDER_COUNT] poll_peer_sockets;
//     /* No longer used. */ 
//     CUInt active_tcp_streams;
//     /* No longer used. */ 
//     CUInt active_udp_streams;
//     /* Counter to started timer */
//     CULongLong timer_counter; 
//     /* Threadpool */
//     UV__Queue wq;
//     UVMutex wq_mutex;
//     UVAsync wq_async;
// }

def Win32_LPFn_CONNECTEX = fn bool
                          (Win32_SOCKET,
                           Win32_Sockaddr*,
                           CInt,
                           Win32_PVOID,
                           Win32_DWORD,
                           Win32_LPDWORD,
                           void*);

def Win32_LPFn_ACCEPTEX = fn bool
                          (Win32_SOCKET,
                           Win32_SOCKET,
                           Win32_PVOID,
                           Win32_DWORD,
                           Win32_DWORD,
                           Win32_DWORD,
                           Win32_LPDWORD,
                           void*);

struct Win32_WSABUF {
    CULong len;
    CChar* buf;
}

def Win32_LPWSABUF = Win32_WSABUF*;

def Win32_WSAEVENT = Win32_HANDLE;

// struct Win32_WSAOVERLAPPED {
// 	Win32_DWORD internal ;
// 	Win32_DWORD internalHigh ;
// 	Win32_DWORD offset ;
// 	Win32_DWORD offsetHigh ;
// 	Win32_WSAEVENT hEvent;
// }

def Win32_WSAOVERLAPPED = Win32_OVERLAPPED;
def Win32_LPWSAOVERLAPPED = Win32_WSAOVERLAPPED*;

def Win32_LPWSAOVERLAPPED_COMPLETION_ROUTINE = fn void (Win32_DWORD dwError, Win32_DWORD cbTransferred, Win32_LPWSAOVERLAPPED lpOverlapped, Win32_DWORD dwFlags);

def Win32_LPFN_WSARECV = fn CInt
            (Win32_SOCKET socket,
             Win32_LPWSABUF buffers,
             Win32_DWORD buffer_count,
             Win32_LPDWORD bytes,
             Win32_LPDWORD flags,
             Win32_LPWSAOVERLAPPED overlapped,
             Win32_LPWSAOVERLAPPED_COMPLETION_ROUTINE completion_routine);

def Win32_LPFN_WSARECVFROM = fn CInt
            (Win32_SOCKET socket,
             Win32_LPWSABUF buffers,
             Win32_DWORD buffer_count,
             Win32_LPDWORD bytes,
             Win32_LPDWORD flags,
             Win32_Sockaddr* addr,
             Win32_LPINT addr_len,
             Win32_LPWSAOVERLAPPED overlapped,
             Win32_LPWSAOVERLAPPED_COMPLETION_ROUTINE completion_routine);

def Platform_sockaddr = Win32_Sockaddr;

struct Win32_Sockaddr {
   CUShort sa_family;
   CChar[14] sa_data;
}

struct Win32_InAddr { // todo C types
  union {
    bitstruct s_un_b : char[16] @bigendian {
      char s_b1 : 0 .. 7;
      char s_b2 : 8 .. 15;
      char s_b3 : 16 .. 23;
      char s_b4 : 24 .. 31;
    }
    bitstruct s_un_w : char[16] @bigendian {
      ushort s_w1 : 32 .. 47;
      ushort s_w2 : 48 .. 63;
    }
    ulong s_addr;
  }
}

def Platform_sockaddr_in = Win32_Sockaddr_in;
def Platform_sockaddr_in6 = void*; // todo implement ipv6

struct Win32_Sockaddr_in {
    CShort sin_family;
    CUShort sin_port;
    Win32_InAddr sin_addr;
    CChar[8]* sin_zero;
}

const usz _SS_PAD1SIZE = 6;
const usz _SS_PAD2SIZE = 112;

struct Win32_Sockaddr_storage {
    CUShort  ss_family;
    CChar[_SS_PAD1SIZE]*      __ss_pad1;
    CLongLong __ss_align;
    CChar[_SS_PAD2SIZE]*      __ss_pad2;
}

struct Win32_KEY_EVENT_RECORD {
  Win32_BOOL  bKeyDown;
  Win32_WORD  wRepeatCount;
  Win32_WORD  wVirtualKeyCode;
  Win32_WORD  wVirtualScanCode;
  union uChar {
    Win32_WCHAR unicodeChar ;
    Win32_CHAR  asciiChar ;
  }
  Win32_DWORD dwControlKeyState;
}

struct Win32_COORD {
  Win32_SHORT x ;
  Win32_SHORT y ;
}

struct Win32_MOUSE_EVENT_RECORD {
  Win32_COORD dwMousePosition;
  Win32_DWORD dwButtonState;
  Win32_DWORD dwControlKeyState;
  Win32_DWORD dwEventFlags;
}

struct Win32_WINDOW_BUFFER_SIZE_RECORD {
  Win32_COORD dwSize;
}

struct Win32_MENU_EVENT_RECORD {
  Win32_UINT dwCommandId;
}

struct Win32_FOCUS_EVENT_RECORD {
  Win32_BOOL bSetFocus;
}

struct Win32_INPUT_RECORD {
  Win32_WORD eventType ;
  union event  {
    Win32_KEY_EVENT_RECORD    keyEvent ;
    Win32_MOUSE_EVENT_RECORD  mouseEvent ;
    Win32_WINDOW_BUFFER_SIZE_RECORD windowBufferSizeEvent ;
    Win32_MENU_EVENT_RECORD   menuEvent ;
    Win32_FOCUS_EVENT_RECORD  focusEvent ;
  }
}

def Win32_NTSTATUS = Win32_LONG;

struct Win32_AFD_POLL_HANDLE_INFO {
    Win32_HANDLE handle;
    Win32_ULONG events;
    Win32_NTSTATUS status;
}

struct Win32_AFD_POLL_INFO {
    Win32_LARGE_INTEGER timeout;
    Win32_ULONG numberOfHandles;
    Win32_ULONG exclusive;
    Win32_AFD_POLL_HANDLE_INFO* handles;
}

def Platform_addrinfo = Win32_addrinfo;

struct Win32_addrinfo {
   CInt             ai_flags;
   CInt             ai_family;
   CInt             ai_socktype;
   CInt             ai_protocol;
   CLongLong        ai_addrlen; // size_t ?
   CChar            *ai_canonname;
   Win32_Sockaddr   *ai_addr;
   Win32_addrinfo   *ai_next;
}

struct Win32_addrinfoW {
  CInt             ai_flags;
  CInt             ai_family;
  CInt             ai_socktype;
  CInt             ai_protocol;
  CLongLong        ai_addrlen; // size_t ?
  Win32_PWSTR      ai_canonname;
  Win32_Sockaddr   *ai_addr;
  Win32_addrinfo   *ai_next;
}

def UVFile = CInt;
def UVOsSock = Win32_SOCKET;
def UVOsFd = Win32_HANDLE;
def UVPid = CInt;
def UVThread = Win32_HANDLE;
def UVSem = Win32_HANDLE;
def UVMutex = Win32_CRITICAL_SECTION;
def UVUid = CUChar;
def UVGid = CUChar;

struct UVPipeAccept {
  inline UVReq uv_req_fields;
  Win32_HANDLE pipeHandle;
  UVPipeAccept* next_pending;
}

struct UVTcpAccept {
  inline UVReq uv_req_fields;
  Win32_SOCKET accept_socket;
  CChar[Win32_Sockaddr_storage.sizeof * 2 + 32]* accept_buffer;
  Win32_HANDLE event_handle;
  Win32_HANDLE wait_handle;
  UVTcpAccept* next_pending;
}

struct UVRead {
  inline UVReq uv_req_fields;
  Win32_HANDLE event_handle;
  Win32_HANDLE wait_handle;
}
