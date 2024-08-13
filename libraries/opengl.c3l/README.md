# OpenGL Bindings for C3
This library was adapted from [https://github.com/KhronosGroup/OpenGL-Registry/blob/main/api/GL/glcorearb.h].


### Formating details

constant definitions are converted to C3 consts keeping the same name

so: ```#define GL_TRUE 1``` becomes ```const GL_TRUE = 1;```

function names follow the pattern:
```glClearColor -> gl10::clearColor```

The module name refers to the gl_version number (GL_VERSION_X_X macro)

Other names have been kept as similar as possible, only changing to satisfy the C3 naming rules.

For example the matrix constants (e.g. GL_FLOAT_MAT4x2) change NxN to NXN to comply.

This implementation does not currently contain any gl extensions

Types are converted as follows:

* if a C typedef refers to a specefic usage (e.g. GLenum) it is converted to a distinct type
* if the type is a non-exact C type (e.g. int, char etc.) it is converted to either the C__ format (so int becomes CInt) or the closest representation
* if the type is exact (e.g. uint32_t, size_t, etc.) than it is converted to the C3 equivalent, (so uint32_t becomes uint)
* all constant storage-class specefiers are removed
* any const char* are converted to ZString unless it is obvious that the type is not being used as a string



