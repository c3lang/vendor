
module sdl3;

// Types
alias LogOutputFunction = fn void(void* userdata, int category, LogPriority priority, char* message);

// Enums
enum LogCategory {
  APPLICATION,
  ERROR,
  ASSERT,
  SYSTEM,
  AUDIO,
  VIDEO,
  RENDER,
  INPUT,
  TEST,
  GPU,

  /* Reserved for future SDL library use */
  RESERVED2,
  RESERVED3,
  RESERVED4,
  RESERVED5,
  RESERVED6,
  RESERVED7,
  RESERVED8,
  RESERVED9,
  RESERVED10,

  CUSTOM,
}
enum SDL_LogPriority {
  INVALID,
  TRACE,
  VERBOSE,
  DEBUG,
  INFO,
  WARN,
  ERROR,
  CRITICAL,
  COUNT,
}

// Functions
extern fn LogOutputFunction getDefaultLogOutputFunction() @extern("SDL_GetDefaultLogOutputFunction");
extern fn void getLogOutputFunction(LogOutputFunction* callback, void** userdata) @extern("SDL_GetLogOutputFunction");
extern fn LogPriority getLogPriority(int category) @extern("SDL_GetLogPriority");
extern fn void log(char* fmt, ...) @extern("SDL_Log");
extern fn void logCritical(int category, char* fmt, ...) @extern("SDL_LogCritical");
extern fn void logDebug(int category, char* fmt, ...) @extern("SDL_LogDebug");
extern fn void logError(int category, char* fmt, ...) @extern("SDL_LogError");
extern fn void logInfo(int category, char* fmt, ...) @extern("SDL_LogInfo");
extern fn void logMessage(int category, LogPriority priority, char* fmt, ...) @extern("SDL_LogMessage");
extern fn void logTrace(int category, char* fmt, ...) @extern("SDL_LogTrace");
extern fn void logVerbose(int category, char* fmt, ...) @extern("SDL_LogVerbose");
extern fn void logWarn(int category, char* fmt, ...) @extern("SDL_LogWarn");
extern fn void resetLogPriorities() @extern("SDL_ResetLogPriorities");
extern fn void setLogOutputFunction(LogOutputFunction callback, void* userdata) @extern("SDL_SetLogOutputFunction");
extern fn void setLogPriorities(LogPriority priority) @extern("SDL_SetLogPriorities");
extern fn void setLogPriority(int category, LogPriority priority) @extern("SDL_SetLogPriority");
extern fn bool setLogPriorityPrefix(LogPriority priority, char* prefix) @extern("SDL_SetLogPriorityPrefix");

