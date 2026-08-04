## c3-tracy 

https://github.com/wolfpld/tracy <br>

checkout tracy docs for building the server https://github.com/wolfpld/tracy/releases/latest/download/tracy.pdf

## Usage

For short lived programs, set the environment variable `TRACY_NO_EXIT` which means tracy is going to freeze the program until a connection is established.
Alternatively build the client with it already enabled and replace the lib file

## Profiling allocations

There is a dedicated `TracyAllocator` to profile all `acquire, realloc, free` used with it.

## Building

the source for c3-tracy is in `lib/tracy-0.13.1`

build the cmake project 

## Features

| Features   | description
| --------   | --------
| TRACY_ENABLE | wether tracy is enabled. When disabled all calls are ignored
