# OpenGL Bindings

These are OpenGL bindings for C3. They are generated from the opengl registry [here](https://github.com/KhronosGroup/OpenGL-Registry)

### Formating details

constant definitions are converted to C3 consts keeping the same name

so: ```#define GL_TRUE 1``` becomes ```const GL_TRUE = 1;```

function names follow the pattern:
```glClearColor -> gl::clearColor```

Other names have been kept as similar as possible, only changing to satisfy the C3 naming rules.

For example the matrix constants (e.g. GL_FLOAT_MAT4x2) change NxN to NXN to comply with C3.


The `loadGL` function *must* be called before using any opengl functions. It also must be called after a valid OpenGL context is created (from something like GLFW). The argument it takes in glfw would be `loadGL((GLLoadFn)glfw::getProcAddress)`. 

The `loadGL` function returns either 0 if it fails or the current OpenGL version in the format of (major * 10) + minor
