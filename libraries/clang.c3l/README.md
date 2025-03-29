
# libclang for c3

Bindings for [libclang](https://clang.llvm.org/docs/LibClang.html) C library (not C++).

## Translation Rules

1. Types which point to incomplete types are declared as `typedef inline`. For example: `typedef struct CXTargetInfoImpl *CXTargetInfo` -> `typedef CXTargetInfo = inline void*`.
2. All fields in structures, starting with upper case letter, are lowercased. For example: `Length` -> `length`
3. All function prefixes are deleted. For example: `clang_<func-name>` -> `<func-name>`.
4. The following basic type substitutions are performed:
  - `int` -> `CInt`, `long` -> `CLong`, `unsigned` -> `CUInt` etc.
  - `const <type>` -> `<type>` (`const int` -> `CInt`)
  - `char*` -> `ZString`
  - `size_t` -> `usz`
5. All enumerations are replaced with a set of `const` values and enumeration types themselves are `typedef`s for their underlying types. Their members are uppercased and got rid of library prefix. For example `enum CXGlobalOptFlags : int` -> `typedef CXGlobalOptFlags = inline CInt` and `CXGlobalOpt_None` -> `GLOBAL_OPT_NONE`.
6. All functions, which names start with a 'type' or 'subclass' and followed by `_` and started with upper-case letter (like `CXXConstructor_isCopyConstructor`), have this 'type' moved to the end and prefixed with `_` (to `isCopyConstructor_CXXConstructor`).
7. All functions, marked `CINDEX_DEPRECATED` are marked `@deprecated`


