
module sdl3;

// Types
alias DialogFileCallback = fn void(void* userdata, char** filelist, int filter);

// Structs
struct DialogFileFilter {
  char* name;
  char* pattern;
}

// Enums
enum FileDialogType {
  OPENFILE,
  SAVEFILE,
  OPENFOLDER
}

// Functions
extern fn void showFileDialogWithProperties(FileDialogType type, DialogFileCallback callback, void* userdata, PropertiesID props) @extern("SDL_ShowFileDialogWithProperties");
extern fn void showOpenFileDialog(DialogFileCallback callback, void* userdata, Window* window, DialogFileFilter* filters, int nfilters, char* default_location, bool allow_many) @extern("SDL_ShowOpenFileDialog");
extern fn void showOpenFolderDialog(DialogFileCallback callback, void* userdata, Window* window, char* default_location, bool allow_many) @extern("SDL_ShowOpenFolderDialog");
extern fn void showSaveFileDialog(DialogFileCallback callback, void* userdata, Window* window, DialogFileFilter* filters, int nfilters, char* default_location) @extern("SDL_ShowSaveFileDialog");

