# OpenGL Bindings FAQ

- OpenGL functions are renamed as follows: `glFunctionName` -> `gl::functionName`
- Constant definitions keep the same name but are converted to C3 constants: `#define GL_FALSE 0` -> `const GL_FALSE = 0;`
- Fixed length types are converted to the corresponding C3 types: `uint32_t` -> `int`
- Variable length types are converted to the corresponding standard library compatibility types: `int` -> `CInt`
- If a C typedef corresponds to a unique type that expects a subset of values it keeps the same name and gets converted to C3: `GLenum` -> `GLenum`
- all `const char *` sequences are converted to `ZString`

# Older OpenGL Versions

- All older versions of OpenGL are supported.
- By default the most recent version is used.
- The specific version used can be set as follows:
```C3
module opengl;
const GL_VERSION = 33;
```
- The `GL_VERSION` is just the desired opengl version without the decimal point (so version 1.0 becomes 10, and 4.5 becomes 45)
- Once the version is set only the functions and definitions from that version can be used. The only exception is anything defined in opengl.c3i as global.
