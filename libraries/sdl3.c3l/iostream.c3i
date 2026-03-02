
module sdl3;

// Type
alias IOStream = void;

// Struct
struct IOStreamInterface {
  /* The version of this interface */
  uint version;

  /** Return the number of bytes in this SDL_IOStream
   *  \return the total size of the data stream, or -1 on error. */
  iostream::Size size;

  /** Seek to `offset` relative to `whence`, one of stdio's whence values:
   *  SDL_IO_SEEK_SET, SDL_IO_SEEK_CUR, SDL_IO_SEEK_END
   *  \return the final offset in the data stream, or -1 on error. */
  iostream::Seek seek;

  /** Read up to `size` bytes from the data stream to the area pointed
   *  at by `ptr`. `size` will always be > 0.
   *  On an incomplete read, you should set `*status` to a value from the
   *  SDL_IOStatus enum. You do not have to explicitly set this on
   *  a complete, successful read.
   *  \return the number of bytes read */
  iostream::Read read;

  /** Write exactly `size` bytes from the area pointed at by `ptr`
   *  to data stream. `size` will always be > 0.
   *  On an incomplete write, you should set `*status` to a value from the
   *  SDL_IOStatus enum. You do not have to explicitly set this on
   *  a complete, successful write.
   *  \return the number of bytes written */
  iostream::Write write;

  /** If the stream is buffering, make sure the data is written out.
   *  On failure, you should set `*status` to a value from the
   *  SDL_IOStatus enum. You do not have to explicitly set this on
   *  a successful flush.
   *  \return true if successful or false on write error when flushing data. */
  iostream::Flush flush;

  /** Close and free any allocated resources.
   *  This does not guarantee file writes will sync to physical media; they
   *  can be in the system's file cache, waiting to go to disk.
   *  The SDL_IOStream is still destroyed even if this fails, so clean up anything
   *  even if flushing buffers, etc, returns an error.
   *  \return true if successful or false on write error when flushing data. */
  iostream::Close close;

}

// Enum
enum IOStatus {
  READY,     /**< Everything is ready (no errors and not EOF). */
  ERROR,     /**< Read or write I/O error */
  EOF,       /**< End of file */
  NOT_READY, /**< Non blocking I/O, not ready */
  READONLY,  /**< Tried to write a read-only buffer */
  WRITEONLY, /**< Tried to read a write-only buffer */
}
enum IOWhence {
  SET,  /**< Seek from the beginning of data */
  CUR,  /**< Seek relative to current read point */
  END,  /**< Seek relative to the end of data */
}

// Functions
extern fn bool closeIO(IOStream* context) @extern("SDL_CloseIO");
extern fn bool flushIO(IOStream* context) @extern("SDL_FlushIO");
extern fn PropertiesID getIOProperties(IOStream* context) @extern("SDL_GetIOProperties");
extern fn long getIOSize(IOStream* context) @extern("SDL_GetIOSize");
extern fn IOStatus getIOStatus(IOStream* context) @extern("SDL_GetIOStatus");
extern fn IOStream* fromConstMemIO(void* mem, usz size) @extern("SDL_IOFromConstMem");
extern fn IOStream* fromDynamicMemIO() @extern("SDL_IOFromDynamicMem");
extern fn IOStream* fromFileIO(char* file, char* mode) @extern("SDL_IOFromFile");
extern fn IOStream* fromMemIO(void* mem, usz size) @extern("SDL_IOFromMem");
extern fn usz printfIO(IOStream* context, char* fmt, ...) @extern("SDL_IOprintf");
extern fn void* loadFile(char* file, usz* datasize) @extern("SDL_LoadFile");
extern fn void* loadFile_IO(IOStream* src, usz* datasize, bool closeio) @extern("SDL_LoadFile_IO");
extern fn IOStream* openIO(IOStreamInterface* iface, void* userdata) @extern("SDL_OpenIO");
extern fn usz readIO(IOStream* context, void* ptr, usz size) @extern("SDL_ReadIO");
extern fn bool readS16BE(IOStream* src, short* value) @extern("SDL_ReadS16BE");
extern fn bool readS16LE(IOStream* src, short* value) @extern("SDL_ReadS16LE");
extern fn bool readS32BE(IOStream* src, int* value) @extern("SDL_ReadS32BE");
extern fn bool readS32LE(IOStream* src, int* value) @extern("SDL_ReadS32LE");
extern fn bool readS64BE(IOStream* src, long* value) @extern("SDL_ReadS64BE");
extern fn bool readS64LE(IOStream* src, long* value) @extern("SDL_ReadS64LE");
extern fn bool readS8(IOStream* src, ichar *value) @extern("SDL_ReadS8");
extern fn bool readU16BE(IOStream* src, ushort* value) @extern("SDL_ReadU16BE");
extern fn bool readU16LE(IOStream* src, ushort* value) @extern("SDL_ReadU16LE");
extern fn bool readU32BE(IOStream* src, uint* value) @extern("SDL_ReadU32BE");
extern fn bool readU32LE(IOStream* src, uint* value) @extern("SDL_ReadU32LE");
extern fn bool readU64BE(IOStream* src, ulong* value) @extern("SDL_ReadU64BE");
extern fn bool readU64LE(IOStream* src, ulong* value) @extern("SDL_ReadU64LE");
extern fn bool readU8(IOStream* src, char* value) @extern("SDL_ReadU8");
extern fn bool saveFile(char* file, void* data, usz datasize) @extern("SDL_SaveFile");
extern fn bool saveFile_IO(IOStream* src, void* data, usz datasize, bool closeio) @extern("SDL_SaveFile_IO");
extern fn long seekIO(IOStream* context, long offset, IOWhence whence) @extern("SDL_SeekIO");
extern fn long tellIO(IOStream* context) @extern("SDL_TellIO");
extern fn usz writeIO(IOStream* context, void* ptr, usz size) @extern("SDL_WriteIO");
extern fn bool writeS16BE(IOStream *dst, short value) @extern("SDL_WriteS16BE");
extern fn bool writeS16LE(IOStream *dst, short value) @extern("SDL_WriteS16LE");
extern fn bool writeS32BE(IOStream *dst, int value) @extern("SDL_WriteS32BE");
extern fn bool writeS32LE(IOStream *dst, int value) @extern("SDL_WriteS32LE");
extern fn bool writeS64BE(IOStream *dst, long value) @extern("SDL_WriteS64BE");
extern fn bool writeS64LE(IOStream *dst, long value) @extern("SDL_WriteS64LE");
extern fn bool writeS8(IOStream *dst, ichar value) @extern("SDL_WriteS8");
extern fn bool writeU16BE(IOStream *dst, ushort value) @extern("SDL_WriteU16BE");
extern fn bool writeU16LE(IOStream *dst, ushort value) @extern("SDL_WriteU16LE");
extern fn bool writeU32BE(IOStream *dst, uint value) @extern("SDL_WriteU32BE");
extern fn bool writeU32LE(IOStream *dst, uint value) @extern("SDL_WriteU32LE");
extern fn bool writeU64BE(IOStream *dst, ulong value) @extern("SDL_WriteU64BE");
extern fn bool writeU64LE(IOStream *dst, ulong value) @extern("SDL_WriteU64LE");
extern fn bool writeU8(IOStream *dst, char value) @extern("SDL_WriteU8");


module sdl3::iostream;

// Functions
alias Size = fn long(void* userdata);
alias Seek = fn long(void* userdata, long offset, IOWhence whence);
alias Read = fn usz(void* userdata, void* ptr, usz size, IOStatus* status);
alias Write = fn usz(void* userdata, void* ptr, usz size, IOStatus* status);
alias Flush = fn bool(void* userdata, IOStatus* status);
alias Close = fn bool(void* userdata);

