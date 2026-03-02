
module sdl3;

// Types
alias Process = void;

// Enums
enum ProcessIO {
  INHERITED,    /**< The I/O stream is inherited from the application. */
  NULL,         /**< The I/O stream is ignored. */
  APP,          /**< The I/O stream is connected to a new SDL_IOStream that the application can read or write */
  REDIRECT,     /**< The I/O stream is redirected to an existing SDL_IOStream. */
}

// Functions
extern fn Process* createProcess(char** args, bool pipe_stdio) @extern("SDL_CreateProcess");
extern fn Process* createProcessWithProperties(PropertiesID props) @extern("SDL_CreateProcessWithProperties");
extern fn void destroyProcess(Process* process) @extern("SDL_DestroyProcess");
extern fn IOStream* getProcessInput(Process* process) @extern("SDL_GetProcessInput");
extern fn IOStream* getProcessOutput(Process* process) @extern("SDL_GetProcessOutput");
extern fn PropertiesID getProcessProperties(Process* process) @extern("SDL_GetProcessProperties");
extern fn bool killProcess(Process* process, bool force) @extern("SDL_KillProcess");
extern fn void* readProcess(Process* process, usz* datasize, int* exitcode) @extern("SDL_ReadProcess");
extern fn bool waitProcess(Process* process, bool block, int* exitcode) @extern("SDL_WaitProcess");

