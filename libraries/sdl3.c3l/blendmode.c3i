
module sdl3;

// Bitstructs
bitstruct BlendMode : uint {
  bool blend:   0;
  bool add:     1;
  bool mod:     2;
  bool mul:     3; // Also premul
}

// Enums
enum BlendFactor {
  EMPTY,
  ZERO,
  ONE,
  SRC_COLOR,
  ONE_MINUS_SRC_COLOR,
  SRC_ALPHA,
  ONE_MINUS_SRC_ALPHA,
  DST_COLOR,
  ONE_MINUS_DST_COLOR,
  DST_ALPHA,
  ONE_MINUS_DST_ALPHA,
}
enum BlendOperation {
  EMPTY,
  ADD,
  SUBTRACT,
  REV_SUBTRACT,
  MINIMUM,
  MAXIMUM,
}

// Functions
extern fn BlendMode composeCustomBlendMode(BlendFactor srcColorFactor, BlendFactor dstColorFactor, BlendOperation colorOperation, BlendFactor srcAlphaFactor, BlendFactor dstAlphaFactor, BlendOperation alphaOperation) @extern("SDL_ComposeCustomBlendMode");

