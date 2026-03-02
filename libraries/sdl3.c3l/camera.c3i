
module sdl3;

// Types
alias Camera = void;
alias CameraID = uint;

// Structs
struct CameraSpec {
  PixelFormat format;      /**< Frame format */
  Colorspace colorspace;   /**< Frame colorspace */
  int width;               /**< Frame width */
  int height;              /**< Frame height */
  int framerate_numerator; /**< Frame rate numerator ((num / denom) == FPS, (denom / num) == duration in seconds) */
  int framerate_denominator; /**< Frame rate denominator ((num / denom) == FPS, (denom / num) == duration in seconds) */
}

// Enums
enum CameraPermissionState : const CInt {
    DENIED   = -1,
    PENDING  =  0,
    APPROVED =  1,
}
enum CameraPosition {
  UNKNOWN,
  FRONT_FACING,
  BACK_FACING,
}

// Functions
extern fn Surface* acquireCameraFrame(Camera* camera, ulong* timestampNS) @extern("SDL_AcquireCameraFrame");
extern fn void closeCamera(Camera* camera) @extern("SDL_CloseCamera");
extern fn char* getCameraDriver(int index) @extern("SDL_GetCameraDriver");
extern fn bool getCameraFormat(Camera* camera, CameraSpec* spec) @extern("SDL_GetCameraFormat");
extern fn CameraID getCameraID(Camera* camera) @extern("SDL_GetCameraID");
extern fn char* getCameraName(CameraID instance_id) @extern("SDL_GetCameraName");
extern fn CameraPermissionState getCameraPermissionState(Camera* camera) @extern("SDL_GetCameraPermissionState");
extern fn CameraPosition getCameraPosition(CameraID instance_id) @extern("SDL_GetCameraPosition");
extern fn PropertiesID getCameraProperties(Camera* camera) @extern("SDL_GetCameraProperties");
extern fn CameraID* getCameras(int* count) @extern("SDL_GetCameras");
extern fn CameraSpec** getCameraSupportedFormats(CameraID instance_id, int* count) @extern("SDL_GetCameraSupportedFormats");
extern fn char* getCurrentCameraDriver() @extern("SDL_GetCurrentCameraDriver");
extern fn int getNumCameraDrivers() @extern("SDL_GetNumCameraDrivers");
extern fn Camera* openCamera(CameraID instance_id, CameraSpec* spec) @extern("SDL_OpenCamera");
extern fn void releaseCameraFrame(Camera* camera, Surface* frame) @extern("SDL_ReleaseCameraFrame");

