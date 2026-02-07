# Vendor
<p align="center">
  <img src="https://img.shields.io/badge/c3-v0.7.9-blue">
</p>

This repository contains external libraries for use with C3.

### List of libraries

- Raylib 5.5 https://www.raylib.com
- Raygui
- SDL2 2.28.x https://libsdl.org/ - WIP
- Tigr https://github.com/erkkah/tigr (Needs Windows & macOS static libraries)
- Curl https://curl.se/docs/manpage.html
- OpenGL
- Vulkan (WIP)
- GLFW https://www.glfw.org/ - WIP
- PQ (PostgreSQL) https://www.postgresql.org/docs/current/libpq.html
- MySQL 8 https://dev.mysql.com/doc/c-api/8.0/en/
- SQLite 3 https://sqlite.com/c3ref/intro.html
- LZ4 https://lz4.org
- LibClang https://clang.llvm.org/docs/LibClang.html
- tinyfiledialogs http://tinyfiledialogs.sourceforge.net

## Installing libraries from vendor

When using a project with a `project.json`, running `c3c vendor-fetch <library name>`
will download the corresponding library into the `lib/` folder and add it into the
`dependencies` array in `project.json`.

If not using a project the same command will instead download the library into
the current directory where it be used with `--libdir <folder>` and `--lib <libname>`.

## Guide for writing bindings

Because of the hard naming rules in C3, names sometimes need to be
rewritten to work in C3, and one also have to consider the namespacing C3 will add. Here follows a short guide on current best practices:

### Names in general

1. Keep names predicable so that a user who knows the name in C can easily find the name in C3.
2. Avoid changing the names to conform to some other style, even if it's the C3 standard. By keeping the original name it's much
 easier to drop in code examples and to see exactly what is the library code. Users can write 'C3-like' wrappers later, 
 but that can be added when the "raw" functions are already there.

### Module name

The user will use the last component in the module name you choose, shorter names
 are often appreciated, if possible. But also make sure that the full name 
is unique. `com::mylib::asyncio` is better than `asyncio`.

### Function names

#### If functions are prefixed

Given a naming like `glBufferStorage` or `sqlite3_open`. There are two options:

1. Model it with the prefix moved into the last module name, e.g. `gl::bufferStorage(...)` or `sqlite3::open(...)`.
2. Retain the full name and use `@builtin` to retain the original name, e.g. `extern fn void glBufferStorage(...) @builtin;` or `extern fn int sqlite3_open(...) @builtin;`

In the above examples, the advantages and disadvantages balance each other out
so both are equally possible as long as they are done consistent.

#### If functions aren't prefixed or inconsistently prefixed

Given instead `OpenWindow(...)` namespacing is needed. There are two primary
options:

1. Use a lowercase prefix and use `@builtin`: `win32_OpenWindow(...)`.
2. Use a module and lowercase the first letter in the function `win32::openWindow(...)`.

*Note* never combine things, `win32::win32_OpenWindow(...)` is *bad*.

When converting OS functions, then (1) is sometimes fine. Otherwise, prefer (2).

1. Don't change anything more about the name, at most add the prefix or change the first character to lower case.
2. If (2) is used, pick a module name where the library source is immediately obvious. 
 For example, imagine `module mylib::ui;` was used, and now `ui::openWindow(...)` 
 is suddenly super unclear.
3. For bindings to OS libraries, use the name of the OS as the last module component,
 e.g. `module std::os::win32`, `module std::os::posix`, `module std::os::darwin` etc.

### Type names

Types will in general not be prefixed as long as they're unique,
but if the library uses very common names, there is a risk for 
name collision.

#### Type names that are not valid C3 type names

The recommended solution is to prefix them with a minimal name prefix which
that ensures the rule is followed:

`HANDLE` -> `Win32_HANDLE`
`foo_t` -> `Posix_foo_t`

If the name correspond to an existing C3 stdlib type, it can be simply
replaced by that name:

```
// Example
size_t -> usz
UINT32 -> uint
```

#### Type names that collide with existing C3 type names

In these cases, consider retaining the type name as is and require the user
to use the module prefix. Alternatively use a prefix as for invalid type
names.

#### Mixed types names

If type names are a mix of types that work in C3 and ones that don't,
you need to pick a strategy and apply them to all types. For example,
if one encounters a `Foo` type after adding a prefix `Win32_` to all other
types, then that type should be prefixed as well, so `Win32_Foo`.

### C types

For bindings that use `int`, `char` etc, there are two options:

1. Use `CInt`, `CChar` and others. This maximizes compatibility and allows 
 the binding to be correct on platforms that might have 16-bit ints.
2. Just use C3 `int` for `int`, `char` for `char`.
3. Unless the sign of the `char` is important, replace C `char` by `char` and not `CChar`.

If it's known that the C type in the binding will always match the C3 size,
then prefer (2) for that type.

For example, on MacOS and Win32 an `int` in C will always be the same size as in C3,
so use `int` rather than `CInt` if you are making a binding for 
OS libraries. However, the `long` in C may differ, so use `CLong` for that.

#### C strings (char *)

For zero terminated strings, prefer `ZString` over `char*`. This gives
much more convenience for the user.

### Translating enums

For simple C enums that are implicitly sequential, i.e. they start at 0 with no break, 
C3 enums can be used unchanged. There is no need to set the type of the 
enum as C3 enum sizes will default to C int size. So use `enum Foo { ... }`
not `enum Foo : int { ... }`.

#### Enum naming

Enums constants must always be upper case:

```
my_constant -> MY_CONSTANT
MyConstant -> MY_CONSTANT
```

If simple enums are used, then (consistently for the entire binding) 
pick one of the following:

1. Remove any namespacing prefix, but don't remove suffixes. (Usually recommended)
2. Keep the entire prefix.

The first strategy is usually recommended, but there are cases where this just yields
a bad result. In those cases, (2) can be considered - keeping in mind that it must be
done for all simple enums.

An example of the two strategies:
```c
enum Button
{
 MYLIB_BUTTON_ANY_TYPE,
 MYLIB_BUTTON_CANCEL_TYPE
}
```
This can be:
```c
// 1. Remove prefix
enum Button
{
   ANY_TYPE,
   CANCEL_TYPE,
} 
// 2. Full name:
enum Button
{
   MYLIB_BUTTON_ANY_TYPE,
   MYLIB_BUTTON_CANCEL_TYPE
}
```

#### C enums with gaps

C enums that have gaps need to be modelled as constants. This can be done
from simple to more complex.

1. Declare them as regular constants (do this sparingly)
2. Declare as constants with a distinct type.
3. Declare in a sub-module with a distinct type.

##### Declaring a regular constant

This is simply 

```c
const GL_TEXTURE_2D = ...`
```

However, if this is plainly added as such, the
module prefix will be required. So if a prefix
already exists, then add `@builtin`:

```c
const GL_TEXTURE_2D @builtin = ...`
```

This allows it to be used without prefix. The
enum is then replaced in types and functions with
CInt / int.

##### Using a distinct type

In this case we first define a distinct type, 
matching the enum name, then use constant but with
the distinct type. This is a better experience for 
the user and is recommended.

The same recommendation regarding `@builtin`
should be followed as in the normal const case.

```
distinct GlEnum = CInt;

const GlEnum GL_TEXTURE_2D @builtin = ...;
const GlEnum GL_LINE_LOOP @builtin = ...;
```

##### Declare in a sub-module with a distinct type.

This method can be used when the enum doesn't have any good namespacing,
so we want to introduce one.

An example, with the following C definition:
```c
// C enum:
typedef enum
{
   ANY = 0x1,
   CANCEL = 0xAA,
} Button;
```

We can model this as:
```c
// Define the distinct type
distinct Button = CInt;

// Create a specific sub module based on the enum name  
module mylib::ui::button;

// Place the constants inside
const Button ANY = 0x1;
const Button CANCEL = 0xAA;
```

The advantage that we can now do:
```c
ui::newButton(button::ANY);
```

### Global and constant names

Global and constant names can usually be just converted to conform in a minimal manner (e.g
lower case the first character or convert all to upper case).

If this is not desired, use the same strategies as functions.
