
module sdl3;

// Types
alias Condition = void;
alias Mutex = void;
alias RWLock = void;
alias Semaphore = void;

// Structs
struct InitState {
  AtomicInt status;
  ThreadID thread;
  void* reserved;
}

// Enums
enum InitStatus {
  UNINITIALIZED,
  INITIALIZING,
  INITIALIZED,
  UNINITIALIZING,
}

// Functions
extern fn void broadcastCondition(Condition* cond) @extern("SDL_BroadcastCondition");
extern fn Condition* createCondition() @extern("SDL_CreateCondition");
extern fn Mutex* createMutex() @extern("SDL_CreateMutex");
extern fn RWLock* createRWLock() @extern("SDL_CreateRWLock");
extern fn Semaphore* createSemaphore(uint initial_value) @extern("SDL_CreateSemaphore");
extern fn void destroyCondition(Condition* cond) @extern("SDL_DestroyCondition");
extern fn void destroyMutex(Mutex* mutex) @extern("SDL_DestroyMutex");
extern fn void destroyRWLock(RWLock* rwlock) @extern("SDL_DestroyRWLock");
extern fn void destroySemaphore(Semaphore* sem) @extern("SDL_DestroySemaphore");
extern fn uint getSemaphoreValue(Semaphore* sem) @extern("SDL_GetSemaphoreValue");
extern fn void lockMutex(Mutex* mutex) @extern("SDL_LockMutex");
extern fn void lockRWLockForReading(RWLock* rwlock) @extern("SDL_LockRWLockForReading");
extern fn void lockRWLockForWriting(RWLock* rwlock) @extern("SDL_LockRWLockForWriting");
extern fn void setInitialized(InitState* state, bool initialized) @extern("SDL_SetInitialized");
extern fn bool shouldInit(InitState* state) @extern("SDL_ShouldInit");
extern fn bool shouldQuit(InitState* state) @extern("SDL_ShouldQuit");
extern fn void signalCondition(Condition* cond) @extern("SDL_SignalCondition");
extern fn void signalSemaphore(Semaphore* sem) @extern("SDL_SignalCondition");
extern fn bool tryLockMutex(Mutex* mutex) @extern("SDL_TryLockMutex");
extern fn bool tryLockRWLockForReading(RWLock* rwlock) @extern("SDL_TryLockRWLockForReading");
extern fn bool tryLockRWLockForWriting(RWLock* rwlock) @extern("SDL_TryLockRWLockForWriting");
extern fn bool tryWaitSemaphore(Semaphore* sem) @extern("SDL_TryWaitSemaphore");
extern fn void unlockMutex(Mutex* mutex) @extern("SDL_UnlockMutex");
extern fn void unlockRWLock(RWLock* rwlock) @extern("SDL_UnlockRWLock");
extern fn void waitCondition(Condition* cond, Mutex *mutex) @extern("SDL_WaitCondition");
extern fn bool waitConditionTimeout(Condition* cond, Mutex* mutex, int timeoutMS) @extern("SDL_WaitConditionTimeout");
extern fn void waitSemaphore(Semaphore* sem) @extern("SDL_WaitSemaphore");
extern fn bool waitSemaphoreTimeout(Semaphore* sem, int timeoutMS) @extern("SDL_WaitSemaphoreTimeout");

