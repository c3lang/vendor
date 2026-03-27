
# glfw.c3l

Pure [glfw](https://github.com/glfw/glfw) bindings for [c3 programming language](https://c3-lang.org/)


## Installation

Download the latest `glfw.c3l` from the [Releases](https://github.com/c3lang/vendor/releases) and place it in your project's `libraries` directory.

Alternatively, you can clone the repository directly:

```console
$ git clone https://github.com/c3lang/vendor.git
$ cp -r vendor/libraries/glfw.c3l /path/to/project/libraries/
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


