
module sdl3;

// Types
alias AssertionHandler = fn AssertState(AssertData* data, void* userdata);

// Structs
struct AssertData {
    bool always_ignore; /**< true if app should always continue when assertion is triggered. */
    uint trigger_count; /**< Number of times this assertion has been triggered. */
    char* condition;    /**< A string of this assert's test code. */
    char* filename;     /**< The source file where this assert lives. */
    int linenum;        /**< The line in `filename` where this assert lives. */
    char* function;     /**< The name of the function where this assert lives. */
    AssertData* next;   /**< next item in the linked list. */
}

// Enums
enum AssertState {
    RETRY,    /**< Retry the assert immediately. */
    BREAK,    /**< Make the debugger trigger a breakpoint. */
    ABORT,    /**< Terminate the program. */
    IGNORE,   /**< Ignore the assert. */
    ALWAYS_IGNORE  /**< Ignore the assert from now on. */
}

// Functions
extern fn AssertionHandler getAssertionHandler(void** puserdata) @extern("SDL_GetAssertionHandler");
extern fn AssertData* getAssertionReport() @extern("SDL_GetAssertionReport");
extern fn AssertionHandler getDefaultAssertionHandler() @extern("SDL_GetDefaultAssertionHandler");
extern fn AssertState reportAssertion(AssertData* data, char* func, char* file, int line) @extern("SDL_ReportAssertion");
extern fn void resetAssertionReport() @extern("SDL_ResetAssertionReport");
extern fn void setAssertionHandler(AssertionHandler handler, void* userdata) @extern("SDL_SetAssertionHandler");

