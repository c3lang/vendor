
# glfw.c3l

Pure [glfw](https://github.com/glfw/glfw) bindings for [c3 programming language](https://c3-lang.org/)


## Installation

To include these bindings into your project, do:
```console
$ git clone https://github.com/vssukharev/glfw.c3l.git   # Clone repo somewhere
$ make                                                   # Create archive (make sure 'zip' is installed)
$ mv glfw.c3l /path/to/project/libraries                 # Move archive to libraries directory of your project
```

Or just:
```console
$ git clone https://github.com/vssukharev/glfw.c3l.git /path/to/project/libraries/glfw.c3l # Add dependency without zip compression
```

Then you need to modify your `project.json`:
```json
{
  // some stuff
  "dependencies":  [ "glfw", /* Some other dependencies */ ],
  // some other stuff
}
```

Simply do `c3c run` to check whether everything is fine (make sure to have `glfw` installed on your system).


## Usage with Vulkan

To use specific features of GLFW for Vulkan (e.g., `glfwCreateWindowSurface`), you need to define `env::GLFW_INCLUDE_VULKAN` as though:
```c++
module std::core::env;
const bool GLFW_INCLUDE_VULKAN = true

module yourmodule;
import glfw;
// ...
```

## Usage with OpenGL

Just use it, I haven't tested yet)


## Naming

- All functions are renamed from `glfwSomeStuff` to `someStuff` and called as `glfw::someStuff`
- All types are renamed from `GLFWsometype` to `SomeType`
- All constants are renamed form `GLFW_SOME_CONSTANT` to `SOME_CONSTANT` and accesed throguh `glfw::SOME_CONSTANT`


## Breaking Changes

- All functions, taking `void` as parameter, now take no parameters (due to C3 rules)


