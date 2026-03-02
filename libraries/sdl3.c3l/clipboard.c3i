
module sdl3;

// Types
alias ClipboardCleanupCallback = fn void(void* userdata);
alias ClipboardDataCallback = fn void*(void *userdata, char* mime_type, usz* size);

// Functions
extern fn bool clearClipboardData() @extern("SDL_ClearClipboardData");
extern fn void* getClipboardData(char* mime_type, usz* size) @extern("SDL_GetClipboardData");
extern fn char** getClipboardMimeTypes(usz* num_mime_types) @extern("SDL_GetClipboardMimeTypes");
extern fn char* getClipboardText() @extern("SDL_GetClipboardText");
extern fn char* getPrimarySelectionText() @extern("SDL_GetPrimarySelectionText");
extern fn bool hasClipboardData(char* mime_type) @extern("SDL_HasClipboardData");
extern fn bool hasClipboardText() @extern("SDL_HasClipboardText");
extern fn bool hasPrimarySelectionText() @extern("SDL_HasPrimarySelectionText");
extern fn bool setClipboardData(ClipboardDataCallback callback, ClipboardCleanupCallback cleanup, void* userdata, char** mime_types, usz num_mime_types) @extern("SDL_SetClipboardData");
extern fn bool setClipboardText(char* text) @extern("SDL_SetClipboardText");
extern fn bool setPrimarySelectionText(char* text) @extern("SDL_SetPrimarySelectionText");

