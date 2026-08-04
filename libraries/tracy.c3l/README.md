## c3-tracy 

https://github.com/wolfpld/tracy

## Usage

For short lived programs, set the environment variable `TRACY_NO_EXIT` which means tracy is going to freeze the program until a connection is established.
Alternatively build the client with it already enabled and replace the lib file

## Profiling allocations

There is a dedicated `TracyAllocator` to profile all `acquire, realloc, free` used with it.

## Example code
```
	fn void test() => @tracy("test")
	{
	  TracyAllocator alloc; alloc.init(tmem);
	  Allocator allocator = &alloc;
	
	  for (int i = 0; i < 100; i++)
	  {
		    tracy::frame_mark(string::tformat_zstr("Frame %d", i));
		    void* ptr = alloc::alloc(allocator, void*);
	  }
	}
```
## Features

| Features   | description
| --------   | --------
| TRACY_ENABLE | wether tracy is enabled. When disabled all calls are ignored
| TRACY_FIBERS | 
| TRACY_ON_DEMAND |
