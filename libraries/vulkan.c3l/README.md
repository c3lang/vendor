# Vulkan Bindings FAQ
* Vulkan functions are renamed as follows: `vkFunctionName` -> `vk::functionName`
* Constant definitions (`#define ... ...` in C) keep the same name and value
* C's fixed length types are converted to C3 types, and if there are any variable length types they are converted to C3's standard library equivalent: `int`->`CInt`
* Most vulkan typedefs are converted to distinct types.
* all string equivalents (e.g. `const char *`) are converted to ZStrings

# Choosing a Version
* Vulkan versions 1.0 - 1.3 are currently supported, by default the most current version is used (1.3)
* If an older version is needed it can be set like:
```C3
module vulkan;
const VK_VERSION = VK_API_VERSION_1_0; //supported versions are 1_0, 1_1, 1_2, and 1_3
```
* Only the functions and definitions from the set version are defined.
