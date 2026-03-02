
module sdl3;

// Types
alias Storage = void;

// Structs
struct StorageInterface {
  /* The version of this interface */
  uint version;

  /* Called when the storage is closed */
  storage::Close close;
  /* Optional, returns whether the storage is currently ready for access */
  storage::Ready ready;
  /* Enumerate a directory, optional for write-only storage */
  storage::Enumerate enumerate;
  /* Get path information, optional for write-only storage */
  storage::Info info;
  /* Read a file from storage, optional for write-only storage */
  storage::ReadFile read_file;
  /* Write a file to storage, optional for read-only storage */
  storage::WriteFile write_file;
  /* Create a directory, optional for read-only storage */
  storage::MkDir mkdir;
  /* Remove a file or empty directory, optional for read-only storage */
  storage::Remove remove;
  /* Rename a path, optional for read-only storage */
  storage::Rename rename;
  /* Copy a file, optional for read-only storage */
  storage::Copy copy;
  /* Get the space remaining, optional for read-only storage */
  storage::SpaceRemaining space_remaining;
}

// Functions
extern fn bool closeStorage(Storage *storage) @extern("SDL_CloseStorage");
extern fn bool copyStorageFile(Storage* storage, char* oldpath, char* newpath) @extern("SDL_CopyStorageFile");
extern fn bool createStorageDirectory(Storage* storage, char* path) @extern("SDL_CreateStorageDirectory");
extern fn bool enumerateStorageDirectory(Storage* storage, char* path, EnumerateDirectoryCallback callback, void* userdata) @extern("SDL_EnumerateStorageDirectory");
extern fn bool getStorageFileSize(Storage* storage, char* path, ulong* length) @extern("SDL_GetStorageFileSize");
extern fn bool getStoragePathInfo(Storage* storage, char* path, PathInfo* info) @extern("SDL_GetStoragePathInfo");
extern fn ulong getStorageSpaceRemaining(Storage* storage) @extern("SDL_GetStorageSpaceRemaining");
extern fn char** globStorageDirectory(Storage* storage, char* path, char* pattern, GlobFlags flags, int* count) @extern("SDL_GlobStorageDirectory");
extern fn Storage* openFileStorage(char* path) @extern("SDL_OpenFileStorage");
extern fn Storage* openStorage(StorageInterface* iface, void* userdata) @extern("SDL_OpenStorage");
extern fn Storage* openTitleStorage(char* override, PropertiesID props) @extern("SDL_OpenTitleStorage");
extern fn Storage* openUserStorage(char* org, char* app, PropertiesID props) @extern("SDL_OpenUserStorage");
extern fn bool readStorageFile(Storage* storage, char* path, void* destination, ulong length) @extern("SDL_ReadStorageFile");
extern fn bool removeStoragePath(Storage* storage, char* path) @extern("SDL_RemoveStoragePath");
extern fn bool renameStoragePath(Storage* storage, char* oldpath, char* newpath) @extern("SDL_RenameStoragePath");
extern fn bool storageReady(Storage *storage) @extern("SDL_StorageReady");
extern fn bool writeStorageFile(Storage* storage, char* path, void* source, ulong length) @extern("SDL_WriteStorageFile");


module sdl3::storage;

// Types
alias Close = fn bool(void* userdata);
alias Ready = fn bool(void* userdata);
alias Enumerate = fn bool(void* userdata, char* path, EnumerateDirectoryCallback callback, void* callback_userdata);
alias Info = fn bool(void* userdata, char* path, PathInfo* info);
alias ReadFile = fn bool(void* userdata, char* path, void* destination, ulong length);
alias WriteFile = fn bool(void* userdata, char* path, void* source, ulong length);
alias MkDir = fn bool(void* userdata, char* path);
alias Remove = fn bool(void* userdata, char* path);
alias Rename = fn bool(void* userdata, char* oldPath, char* newPath);
alias Copy = fn bool(void* userdata, char* oldPath, char* newPath);
alias SpaceRemaining = fn ulong(void* userdata);

