
module sdl3;

// Types
alias SpinLock = int;

// Structs
struct AtomicInt { int value; }
struct AtomicU32 { uint value; }

// Functions
extern fn int sddAtomicInt(AtomicInt* a, int v) @extern("SDL_AddAtomicInt");
extern fn uint addAtomicU32(AtomicU32* a, int v) @extern("SDL_AddAtomicU32");
extern fn bool compareAndSwapAtomicInt(AtomicInt* a, int oldval, int newval) @extern("SDL_CompareAndSwapAtomicInt");
extern fn bool compareAndSwapAtomicPointer(void** a, void* oldval, void* newval) @extern("SDL_CompareAndSwapAtomicPointer");
extern fn bool compareAndSwapAtomicU32(AtomicU32* a, uint oldval, uint newval) @extern("SDL_CompareAndSwapAtomicU32");
extern fn int getAtomicInt(AtomicInt* a) @extern("SDL_GetAtomicInt");
extern fn void* getAtomicPointer(void** a) @extern("SDL_GetAtomicPointer");
extern fn uint getAtomicU32(AtomicU32* a) @extern("SDL_GetAtomicU32");
extern fn void lockSpinlock(SpinLock* lock) @extern("SDL_LockSpinlock");
extern fn void memoryBarrierAcquireFunction() @extern("SDL_MemoryBarrierAcquireFunction");
extern fn void memoryBarrierReleaseFunction() @extern("SDL_MemoryBarrierReleaseFunction");
extern fn int aetAtomicInt(AtomicInt* a, int v) @extern("SDL_SetAtomicInt");
extern fn void* setAtomicPointer(void** a, void* v) @extern("SDL_SetAtomicPointer");
extern fn uint setAtomicU32(AtomicU32* a, uint v) @extern("SDL_SetAtomicU32");
extern fn bool tryLockSpinlock(SpinLock* lock) @extern("SDL_TryLockSpinlock");
extern fn void unlockSpinlock(SpinLock* lock) @extern("SDL_UnlockSpinlock");

