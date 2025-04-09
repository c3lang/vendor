# Welcome to the [TinyFileDialogs](https://sourceforge.net/projects/tinyfiledialogs/) bindings for [C3](https://c3-lang.org/).

## Installation:

```console
$ c3c vendor-fetch tinyfiledialogs  #Download the bindings and library files into C3 your project or in the current folder when not using a C3 project.
```

When using a C3 project make sure the `project.json` is altered to set tinyfiledialogs as a dependacy
```JSON
{
  // some stuff
  "dependencies":  [ "tinyfiledialogs", /* Some other dependencies */ ],
  // some other stuff
}
```

In a C3 project compiling is as easy as doing `c3c build`.

When compiling without C3 project include the following flags
```console
$ c3c compile --libdir <path_tinyfiledialogs.c3l> --lib tinyfiledialogs #rest of compilation command
```

## Usage:
TinyFileDialogs is used like any other module in C3.

```C++
import tinyfd;

fn void main(){
    tinyfd::notifyPopup("Succes", "You have succesfully installed TinyFileDialogs", "info");
}
```

# Naming:

All TinyFileDialog functions and variables no longer use their original prefix. but use the module as a prefix.

Eg. `tinyfd_beep()` to `tinyfd::beep()` or `tinyfd_version` to `tinyfd::version`

# Acknowledgement:

The original software is distributed under the Zlib license by Guillaume Vareille http://ysengrin.com

# Notice:

Testing of the library has not been done for the Windows, MacOS and linux aarch64. Help is greatly appriciated