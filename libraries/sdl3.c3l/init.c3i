
module sdl3;

// Types
alias AppEvent_func = fn AppResult(void* appstate, Event* event);
alias AppInit_func = fn AppResult(void** appstate, int argc, char* argv);
alias AppIterate_func = fn AppResult(void* appstate);
alias AppQuit_func = fn void(void* appstate, AppResult result);
alias MainThreadCallback = fn void(void* userdata);

// Bitstructs
bitstruct InitFlags : uint {
  bool audio    :  4;
  bool video    :  5;
  bool joystick :  9;
  bool haptic   : 12;
  bool gamepad  : 13;
  bool events   : 14;
  bool sensor   : 15;
  bool camera   : 16;
}

// Enums
enum AppResult {
  CONTINUE,   /**< Value that requests that the app continue from the main callbacks. */
  SUCCESS,    /**< Value that requests termination with success from the main callbacks. */
  FAILURE,    /**< Value that requests termination with error from the main callbacks. */
}

// Functions
extern fn char* getAppMetadataProperty(char* name) @extern("SDL_GetAppMetadataProperty");
extern fn bool init(InitFlags flags) @extern("SDL_Init");
extern fn bool initSubSystem(InitFlags flags) @extern("SDL_InitSubSystem");
extern fn bool isMainThread() @extern("SDL_IsMainThread");
extern fn void quit() @extern("SDL_Quit");
extern fn void quitSubSystem(InitFlags flags) @extern("SDL_QuitSubSystem");
extern fn bool runOnMainThread(MainThreadCallback callback, void* userdata, bool wait_complete) @extern("SDL_RunOnMainThread");
extern fn bool setAppMetadata(char* appname, char* appversion, char* appidentifier) @extern("SDL_SetAppMetadata");
extern fn bool setAppMetadataProperty(char* name, char* value) @extern("SDL_SetAppMetadataProperty");
extern fn InitFlags wasInit(InitFlags flags) @extern("SDL_WasInit");

