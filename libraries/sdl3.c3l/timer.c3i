
module sdl3;

// Types
alias TimerID = uint;
alias NSTimerCallback = fn ulong(void* userdata, TimerID timerID, ulong interval);
alias TimerCallback = fn uint(void* usedata, TimerID timerID, uint interval);

// Functions
extern fn TimerID addTimer(uint interval, TimerCallback callback, void* userdata) @extern("SDL_AddTimer");
extern fn TimerID addTimerNS(ulong interval, NSTimerCallback callback, void* userdata) @extern("SDL_AddTimerNS");
extern fn void delay(uint ms) @extern("SDL_Delay");
extern fn void delayNS(ulong ns) @extern("SDL_DelayNS");
extern fn void delayPrecise(ulong ns) @extern("SDL_DelayPrecise");
extern fn ulong getPerformanceCounter() @extern("SDL_GetPerformanceCounter");
extern fn ulong getPerformanceFrequency() @extern("SDL_GetPerformanceFrequency");
extern fn ulong getTicks() @extern("SDL_GetTicks");
extern fn ulong getTicksNS() @extern("SDL_GetTicksNS");
extern fn bool removeTimer(TimerID id) @extern("SDL_RemoveTimer");

