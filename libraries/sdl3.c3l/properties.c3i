
module sdl3;

// Types
alias CleanupPropertyCallback = fn void(void* userdata, void* value);
alias EnumeratePropertiesCallback = fn void(void* userdata, PropertiesID props, char* name);
alias PropertiesID = uint;

// Enums
enum PropertyType {
  INVALID,
  POINTER,
  STRING,
  NUMBER,
  FLOAT,
  BOOLEAN,
}

// Functions
extern fn bool clearProperty(PropertiesID props, char* name) @extern("SDL_ClearProperty");
extern fn bool copyProperties(PropertiesID src, PropertiesID dst) @extern("SDL_CopyProperties");
extern fn PropertiesID createProperties() @extern("SDL_CreateProperties");
extern fn void destroyProperties(PropertiesID props) @extern("SDL_DestroyProperties");
extern fn bool enumerateProperties(PropertiesID props, EnumeratePropertiesCallback callback, void* userdata) @extern("SDL_EnumerateProperties");
extern fn bool getBooleanProperty(PropertiesID props, char* name, bool default_value) @extern("SDL_GetBooleanProperty");
extern fn float getFloatProperty(PropertiesID props, char* name, float default_value) @extern("SDL_GetFloatProperty");
extern fn PropertiesID getGlobalProperties() @extern("SDL_GetGlobalProperties");
extern fn long getNumberProperty(PropertiesID props, char* name, long default_value) @extern("SDL_GetNumberProperty");
extern fn void* getPointerProperty(PropertiesID props, char* name, void* default_value) @extern("SDL_GetPointerProperty");
extern fn PropertyType getPropertyType(PropertiesID props, char* name) @extern("SDL_GetPropertyType");
extern fn char* getStringProperty(PropertiesID props, char* name, char* default_value) @extern("SDL_GetStringProperty");
extern fn bool hasProperty(PropertiesID props, char* name) @extern("SDL_HasProperty");
extern fn bool lockProperties(PropertiesID props) @extern("SDL_LockProperties");
extern fn bool setBooleanProperty(PropertiesID props, char* name, bool value) @extern("SDL_GetBooleanProperty");
extern fn bool setFloatProperty(PropertiesID props, char* name, float value) @extern("SDL_GetFloatProperty");
extern fn bool setNumberProperty(PropertiesID props, char* name, long value) @extern("SDL_SetNumberProperty");
extern fn bool setPointerProperty(PropertiesID props, char* name, void* value) @extern("SDL_SetPointerProperty");
extern fn bool setPointerPropertyWithCleanup(PropertiesID props, char* name, void* value, CleanupPropertyCallback cleanup, void* userdata) @extern("SDL_SetPointerPropertyWithCleanup");
extern fn bool setStringProperty(PropertiesID props, char* name, char* value) @extern("SDL_SetStringProperty");
extern fn void unlockProperties(PropertiesID props) @extern("SDL_UnlockProperties");

