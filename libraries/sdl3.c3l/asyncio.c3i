
module sdl3;

// Types
alias AsyncIO = void;
alias AsyncIOQueue = void;

// Structs
struct AsyncIOOutcome {
  AsyncIO* asyncio;      /**< what generated this task. This pointer will be invalid if it was closed! */
  AsyncIOTaskType type;  /**< What sort of task was this? Read, write, etc? */
  AsyncIOResult result;  /**< the result of the work (success, failure, cancellation). */
  void* buffer;          /**< buffer where data was read/written. */
  ulong offset;          /**< offset in the SDL_AsyncIO where data was read/written. */
  ulong bytes_requested; /**< number of bytes the task was to read/write. */
  ulong bytes_transferred; /**< actual number of bytes that were read/written. */
  void* userdata;        /**< pointer provided by the app when starting the task */
}

// Enums
enum AsyncIOResult {
  COMPLETE,  /**< request was completed without error */
  FAILURE,   /**< request failed for some reason; check SDL_GetError()! */
  CANCELED,  /**< request was canceled before completing. */
}
enum AsyncIOTaskType {
  READ,   /**< A read operation. */
  WRITE,  /**< A write operation. */
  CLOSE,  /**< A close operation. */
}

// Functions
extern fn AsyncIO* asyncIOFromFile(char* file, char* mode) @extern("SDL_AsyncIOFromFile");
extern fn bool closeAsyncIO(AsyncIO* asyncio, bool flush, AsyncIOQueue* queue, void* userdata) @extern("SDL_CloseAsyncIO");
extern fn AsyncIOQueue* createAsyncIOQueue() @extern("SDL_AsyncIOQueue");
extern fn void destroyAsyncIOQueue(AsyncIOQueue* queue) @extern("SDL_DestroyAsyncIOQueue");
extern fn bool getAsyncIOResult(AsyncIOQueue* queue, AsyncIOOutcome* outcome) @extern("SDL_GetAsyncIOResult");
extern fn long getAsyncIOSize(AsyncIO* asyncio) @extern("SDL_GetAsyncIOSize");
extern fn bool loadFileAsync(char* file, AsyncIOQueue* queue, void* userdata) @extern("SDL_LoadFileAsync");
extern fn bool readAsyncIO(AsyncIO* asyncio, void* ptr, ulong offset, ulong size, AsyncIOQueue* queue, void* userdata) @extern("SDL_ReadAsyncIO");
extern fn void signalAsyncIOQueue(AsyncIOQueue* queue) @extern("SDL_SignalAsyncIOQueue");
extern fn bool waitAsyncIOResult(AsyncIOQueue* queue, AsyncIOOutcome* outcome, int timeoutMS) @extern("SDL_WaitAsyncIOResult");
extern fn bool writeAsyncIO(AsyncIO* asyncio, void* ptr, ulong offset, ulong size, AsyncIOQueue* queue, void* userdata) @extern("SDL_WriteAsyncIO");

