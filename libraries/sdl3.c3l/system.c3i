
module sdl3;

// Types
alias IOSAnimationCallback = fn void(void* userdata);
alias RequestAndroidPermissionCallback = fn void(void* userdata, char* permission, bool granted);

// Enums
enum Sandbox {
  NONE,
  UNKNOWN_CONTAINER,
  FLATPAK,
  SNAP,
  MACOS,
}

// Functions
extern fn void* getAndroidActivity() @extern("SDL_GetAndroidActivity");
extern fn char* getAndroidCachePath() @extern("SDL_GetAndroidCachePath");
extern fn char* getAndroidExternalStoragePath() @extern("SDL_GetAndroidExternalStoragePath");
extern fn uint getAndroidExternalStorageState() @extern("SDL_GetAndroidExternalStorageState");
extern fn char* getAndroidInternalStoragePath() @extern("SDL_GetAndroidInternalStoragePath");
extern fn void* getAndroidJNIEnv() @extern("SDL_GetAndroidJNIEnv");
extern fn int getAndroidSDKVersion() @extern("SDL_GetAndroidSDKVersion");
extern fn int getDirect3D9AdapterIndex(DisplayID displayID) @extern("SDL_GetDirect3D9AdapterIndex");
extern fn bool getDXGIOutputInfo(DisplayID displayID, int* adapterIndex, int* outputIndex) @extern("SDL_GetDXGIOutputInfo");
extern fn Sandbox getSandbox() @extern("SDL_GetSandbox");
extern fn bool isChromebook() @extern("SDL_IsChromebook");
extern fn bool isDeXMode() @extern("SDL_IsDeXMode");
extern fn bool isTablet() @extern("SDL_IsTablet");
extern fn bool isTV() @extern("SDL_IsTV");
extern fn void onApplicationDidChangeStatusBarOrientation() @extern("SDL_OnApplicationDidChangeStatusBarOrientation");
extern fn void onApplicationDidEnterBackground() @extern("SDL_OnApplicationDidEnterBackground");
extern fn void onApplicationDidEnterForeground() @extern("SDL_OnApplicationDidEnterForeground");
extern fn void onApplicationDidReceiveMemoryWarning() @extern("SDL_OnApplicationDidReceiveMemoryWarning");
extern fn void onApplicationWillEnterBackground() @extern("SDL_OnApplicationWillEnterBackground");
extern fn void onApplicationWillEnterForeground() @extern("SDL_OnApplicationWillEnterForeground");
extern fn void onApplicationWillTerminate() @extern("SDL_OnApplicationWillTerminate");
extern fn bool requestAndroidPermission(char* permission, RequestAndroidPermissionCallback cb, void* userdata) @extern("SDL_RequestAndroidPermission");
extern fn void sendAndroidBackButton() @extern("SDL_SendAndroidBackButton");
extern fn bool sendAndroidMessage(uint command, int param) @extern("SDL_SendAndroidMessage");
extern fn bool setiOSAnimationCallback(Window* window, int interval, IOSAnimationCallback callback, void *callbackParam) @extern("SDL_SetiOSAnimationCallback");
extern fn void setiOSEventPump(bool enabled) @extern("SDL_SetiOSEventPump");
extern fn bool setLinuxThreadPriority(long threadID, int priority) @extern("SDL_SetLinuxThreadPriority");
extern fn bool setLinuxThreadPriorityAndPolicy(long threadID, int sdlPriority, int schedPolicy) @extern("SDL_SetLinuxThreadPriorityAndPolicy");
extern fn bool showAndroidToast(char* message, int duration, int gravity, int xoffset, int yoffset) @extern("SDL_ShowAndroidToast");

