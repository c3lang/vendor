
module sdl3;

// Types
alias EnumerateDirectoryCallback = fn EnumerationResult(void* userdata, char* dirname, char* fname);

// Bitstructs
bitstruct GlobFlags: uint {
  bool case_insensitive;
}

// Structs
struct PathInfo {
  PathType type;      /**< the path type */
  ulong size;         /**< the file size in bytes */
  Time create_time;   /**< the time when the path was created */
  Time modify_time;   /**< the last time the path was modified */
  Time access_time;   /**< the last time the path was read */
}

// Enums
enum EnumerationResult {
  CONTINUE,   /**< Value that requests that enumeration continue. */
  SUCCESS,    /**< Value that requests that enumeration stop, successfully. */
  FAILURE,    /**< Value that requests that enumeration stop, as a failure. */
}
enum Folder {
  HOME,        /**< The folder which contains all of the current user's data, preferences, and documents. It usually contains most of the other folders. If a requested folder does not exist, the home folder can be considered a safe fallback to store a user's documents. */
  DESKTOP,     /**< The folder of files that are displayed on the desktop. Note that the existence of a desktop folder does not guarantee that the system does show icons on its desktop; certain GNU/Linux distros with a graphical environment may not have desktop icons. */
  DOCUMENTS,   /**< User document files, possibly application-specific. This is a good place to save a user's projects. */
  DOWNLOADS,   /**< Standard folder for user files downloaded from the internet. */
  MUSIC,       /**< Music files that can be played using a standard music player (mp3, ogg...). */
  PICTURES,    /**< Image files that can be displayed using a standard viewer (png, jpg...). */
  PUBLICSHARE, /**< Files that are meant to be shared with other users on the same computer. */
  SAVEDGAMES,  /**< Save files for games. */
  SCREENSHOTS, /**< Application screenshots. */
  TEMPLATES,   /**< Template files to be used when the user requests the desktop environment to create a new file in a certain folder, such as "New Text File.txt".  Any file in the Templates folder can be used as a starting point for a new file. */
  VIDEOS,      /**< Video files that can be played using a standard video player (mp4, webm...). */
  COUNT,       /**< Total number of types in this enum, not a folder type by itself. */
}
enum PathType {
  NONE,      /**< path does not exist */
  FILE,      /**< a normal file */
  DIRECTORY, /**< a directory */
  OTHER,     /**< something completely different like a device node (not a symlink, those are always followed) */
}

// Functions
extern fn bool copyFile(char* oldpath, char* newpath) @extern("SDL_CopyFile");
extern fn bool createDirectory(char* path) @extern("SDL_CreateDirectory");
extern fn bool enumerateDirectory(char* path, EnumerateDirectoryCallback callback, void* userdata) @extern("SDL_EnumerateDirectory");
extern fn char* getBasePath() @extern("SDL_GetBasePath");
extern fn char* getCurrentDirectory() @extern("SDL_GetCurrentDirectory");
extern fn bool getPathInfo(char* path, PathInfo* info) @extern("SDL_GetPathInfo");
extern fn char* getPrefPath(char* org, char* app) @extern("SDL_GetPrefPath");
extern fn char* getUserFolder(Folder folder) @extern("SDL_GetUserFolder");
extern fn char** globDirectory(char* path, char* pattern, GlobFlags flags, int* count) @extern("SDL_GlobDirectory");

