
module sdl3;

// Types
alias AudioDeviceID = uint;
alias AudioPostmixCallback = fn void(void* userdata, AudioSpec* spec, float* buffer, int buflen);
alias AudioStream = void;
alias AudioStreamCallback = fn void(void* userdata, AudioStream* stream, int additional_amount, int total_amount);
alias AudioStreamDataCompleteCallback = fn void(void* userdata, void* buf, int buflen);

// Structs
struct AudioSpec {
  AudioFormat format; /**< Audio data format */
  int channels;       /**< Number of channels: 1 mono, 2 stereo, etc */
  int freq;           /**< sample rate: sample frames per second */
}

// Enums
enum AudioFormat : const CInt {
  UNKNOWN   = 0x0000u,  /**< Unspecified audio format */
  U8        = 0x0008u,  /**< Unsigned 8-bit samples */
    /* SDL_DEFINE_AUDIO_FORMAT(0, 0, 0, 8), */
  S8        = 0x8008u,  /**< Signed 8-bit samples */
    /* SDL_DEFINE_AUDIO_FORMAT(1, 0, 0, 8), */
  S16LE     = 0x8010u,  /**< Signed 16-bit samples */
    /* SDL_DEFINE_AUDIO_FORMAT(1, 0, 0, 16), */
  S16BE     = 0x9010u,  /**< As above, but big-endian byte order */
    /* SDL_DEFINE_AUDIO_FORMAT(1, 1, 0, 16), */
  S32LE     = 0x8020u,  /**< 32-bit integer samples */
    /* SDL_DEFINE_AUDIO_FORMAT(1, 0, 0, 32), */
  S32BE     = 0x9020u,  /**< As above, but big-endian byte order */
    /* SDL_DEFINE_AUDIO_FORMAT(1, 1, 0, 32), */
  F32LE     = 0x8120u,  /**< 32-bit floating point samples */
    /* SDL_DEFINE_AUDIO_FORMAT(1, 0, 1, 32), */
  F32BE     = 0x9120u,  /**< As above, but big-endian byte order */
    /* SDL_DEFINE_AUDIO_FORMAT(1, 1, 1, 32), */
}

// Functions
extern fn bool audioDevicePaused(AudioDeviceID devid) @extern("SDL_AudioDevicePaused");
extern fn bool audioStreamDevicePaused(AudioStream* stream) @extern("SDL_AudioStreamDevicePaused");
extern fn bool bindAudioStream(AudioDeviceID devid, AudioStream* stream) @extern("SDL_BindAudioStream");
extern fn bool bindAudioStreams(AudioDeviceID devid, AudioStream** streams, int num_streams) @extern("SDL_BindAudioStreams");
extern fn bool clearAudioStream(AudioStream* stream) @extern("SDL_ClearAudioStream");
extern fn void closeAudioDevice(AudioDeviceID devid) @extern("SDL_CloseAudioDevice");
extern fn bool convertAudioSamples(AudioSpec* src_spec, char* src_data, int src_len, AudioSpec* dst_spec, char** dst_data, int* dst_len) @extern("SDL_ConvertAudioSamples");
extern fn AudioStream* createAudioStream(AudioSpec* src_spec, AudioSpec* dst_spec) @extern("SDL_CreateAudioStream");
extern fn void destroyAudioStream(AudioStream* stream) @extern("SDL_DestroyAudioStream");
extern fn bool flushAudioStream(AudioStream* stream) @extern("SDL_FlushAudioStream");
extern fn int* getAudioDeviceChannelMap(AudioDeviceID devid, int* count) @extern("SDL_GetAudioDeviceChannelMap");
extern fn bool getAudioDeviceFormat(AudioDeviceID devid, AudioSpec* spec, int* sample_frames) @extern("SDL_GetAudioDeviceFormat");
extern fn float getAudiDeviceGain(AudioDeviceID devid) @extern("SDL_GetAudioDeviceGain");
extern fn char* getAudioDeviceName(AudioDeviceID devid) @extern("SDL_GetAudioDeviceName");
extern fn char* getAudioDriver(int index) @extern("SDL_GetAudioDriver");
extern fn char* getAudioFormatName(AudioFormat format) @extern("SDL_GetAudioFormatName");
extern fn AudioDeviceID* getAudioPlaybackDevices(int* count) @extern("SDL_GetAudioPlaybackDevices");
extern fn AudioDeviceID* getAudioRecordingDevices(int* count) @extern("SDL_GetAudioRecordingDevices");
extern fn int getAudioStreamAvailable(AudioStream* stream) @extern("SDL_GetAudioStreamAvailable");
extern fn int getAudioStreamData(AudioStream* stream, void* buf, int len) @extern("SDL_GetAudioStreamData");
extern fn AudioDeviceID getAudioStreamDevice(AudioStream* stream) @extern("SDL_GetAudioStreamDevice");
extern fn bool getAudioStreamFormat(AudioStream* stream, AudioSpec* src_spec, AudioSpec* dst_spec) @extern("SDL_GetAudioStreamFormat");
extern fn float getAudioStreamFrequencyRatio(AudioStream* stream) @extern("SDL_GetAudioStreamFrequencyRatio");
extern fn float getAudioStreamGain(AudioStream* stream) @extern("SDL_GetAudioStreamGain");
extern fn int* getAudioStreamInputChannelMap(AudioStream* stream, int* count) @extern("SDL_GetAudioStreamInputChannelMap");
extern fn int* getAudioStreamOutputChannelMap(AudioStream* stream, int* count) @extern("SDL_GetAudioStreamOutputChannelMap");
extern fn PropertiesID getAudioStreamProperties(AudioStream* stream) @extern("SDL_GetAudioStreamProperties");
extern fn int getAudioStreamQueued(AudioStream* stream) @extern("SDL_GetAudioStreamQueued");
extern fn char* getCurrentAudioDriver() @extern("SDL_GetCurrentAudioDriver");
extern fn int getNumAudioDrivers() @extern("SDL_GetNumAudioDrivers");
extern fn int getSilenceValueForFormat(AudioFormat format) @extern("SDL_GetSilenceValueForFormat");
extern fn bool isAudioDevicePhysical(AudioDeviceID devid) @extern("SDL_IsAudioDevicePhysical");
extern fn bool isAudioDevicePlayback(AudioDeviceID devid) @extern("SDL_IsAudioDevicePlayback");
extern fn bool loadWAV(char* path, AudioSpec* spec, char** audio_buf, uint* audio_len) @extern("SDL_LoadWAV");
extern fn bool loadWAV_IO(IOStream* src, bool closeio, AudioSpec* spec, char** audio_buf, uint *audio_len) @extern("SDL_LoadWAV_IO");
extern fn bool lockAudioStream(AudioStream* stream) @extern("SDL_LockAudioStream");
extern fn bool mixAudio(char* dst, char* src, AudioFormat format, uint len, float volume) @extern("SDL_MixAudio");
extern fn AudioDeviceID openAudioDevice(AudioDeviceID devid, AudioSpec* spec) @extern("SDL_OpenAudioDevice");
extern fn AudioStream* openAudioDeviceStream(AudioDeviceID devid, AudioSpec* spec, AudioStreamCallback callback, void* userdata) @extern("SDL_OpenAudioDeviceStream");
extern fn bool pauseAudioDevice(AudioDeviceID devid) @extern("SDL_PauseAudioDevice");
extern fn bool pauseAudioStreamDevice(AudioStream* stream) @extern("SDL_PauseAudioStreamDevice");
extern fn bool putAudioStreamData(AudioStream* stream, void* buf, int len) @extern("SDL_PutAudioStreamData");
extern fn bool putAudioStreamDataNoCopy(AudioStream* stream, void* buf, int len, AudioStreamDataCompleteCallback callback, void* userdata) @extern("SDL_PutAudioStreamDataNoCopy");
extern fn bool putAudioStreamPlanarData(AudioStream* stream, void** channel_buffers, int num_channels, int num_samples) @extern("SDL_PutAudioStreamPlanarData");
extern fn bool resumeAudioDevice(AudioDeviceID devid) @extern("SDL_ResumeAudioDevice");
extern fn bool resumeAudioStreamDevice(AudioStream* stream) @extern("SDL_ResumeAudioStreamDevice");
extern fn bool setAudioDeviceGain(AudioDeviceID devid, float gain) @extern("SDL_SetAudioDeviceGain");
extern fn bool setAudioPostmixCallback(AudioDeviceID devid, AudioPostmixCallback callback, void* userdata) @extern("SDL_SetAudioPostmixCallback");
extern fn bool setAudioStreamFormat(AudioStream* stream, AudioSpec* src_spec, AudioSpec* dst_spec) @extern("SDL_SetAudioStreamFormat");
extern fn bool setAudioStreamFrequencyRatio(AudioStream* stream, float ratio) @extern("SDL_SetAudioStreamFrequencyRatio");
extern fn bool setAudioStreamGain(AudioStream* stream, float gain) @extern("SDL_SetAudioStreamGain");
extern fn bool setAudioStreamGetCallback(AudioStream* stream, AudioStreamCallback callback, void* userdata) @extern("SDL_SetAudioStreamGetCallback");
extern fn bool setAudioStreamInputChannelMap(AudioStream* stream, int* chmap, int count) @extern("SDL_SetAudioStreamInputChannelMap");
extern fn bool setAudioStreamOutputChannelMap(AudioStream* stream, int* chmap, int count) @extern("SDL_SetAudioStreamOutputChannelMap");
extern fn bool setAudioStreamPutCallback(AudioStream* stream, AudioStreamCallback callback, void* userdata) @extern("SDL_SetAudioStreamPutCallback");
extern fn void unbindAudioStream(AudioStream* stream) @extern("SDL_UnbindAudioStream");
extern fn void unbindAudioStreams(AudioStream** streams, int num_streams) @extern("SDL_UnbindAudioStreams");
extern fn bool unlockAudioStream(AudioStream* stream) @extern("SDL_UnlockAudioStream");

