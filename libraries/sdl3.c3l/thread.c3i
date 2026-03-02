
module sdl3;

// Types
alias Thread = void;
alias ThreadID = ulong;
alias TLsID = AtomicInt;
alias ThreadFunction = fn int(void* data);
alias TLSDestructorCallback = fn void(void* data);

// Enums
enum ThreadPriority {
  LOW,
  NORMAL,
  HIGH,
  TIME_CRITICAL,
}
enum ThreadState {
  UNKNOWN,     /**< The thread is not valid */
  ALIVE,       /**< The thread is currently running */
  DETACHED,    /**< The thread is detached and can't be waited on */
  COMPLETE,    /**< The thread has finished and should be cleaned up with SDL_WaitThread() */
}

// Functions
extern fn void cleanupTLS() @extern("SDL_CleanupTLS");
extern fn Thread* createThread(ThreadFunction func, char* name, void* data) @extern("SDL_CreateThread");
extern fn Thread* createThreadWithProperties(PropertiesID props) @extern("SDL_CreateThreadWithProperties");
extern fn void detachThread(Thread* thread) @extern("SDL_DetachThread");
extern fn ThreadID getCurrentThreadID() @extern("SDL_GetCurrentThreadID");
extern fn ThreadID getThreadID(Thread* thread) @extern("SDL_GetThreadID");
extern fn char* getThreadName(Thread* thread) @extern("SDL_GetThreadName");
extern fn ThreadState getThreadState(Thread* thread) @extern("SDL_GetThreadState");
extern fn void* getTLS(TLsID* id) @extern("SDL_GetTLS");
extern fn bool setCurrentThreadPriority(ThreadPriority priority) @extern("SDL_SetCurrentThreadPriority");
extern fn bool setTLS(TLsID* id, void* value, TLSDestructorCallback destructor) @extern("SDL_SetTLS");
extern fn void waitThread(Thread* thread, int* status) @extern("SDL_WaitThread");

