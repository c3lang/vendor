## c3-tracy 

https://github.com/wolfpld/tracy

## Building

Checkout the tracy docs for more information on cmake options.

For short lived programs, add the option `-DTRACY_NO_EXIT=ON`. Alternatively that can be set via env to dynamically change it.
For manual lifetimes set `-DTRACY_MANUAL_LIFETIME=ON`.
There is a Feature `TRACY_ENABLE` that needs to be set for bindings to get called

```
git clone -b v0.13.1 --depth 1 https://github.com/wolfpld/tracy
cd tracy
cmake -B build -DTRACY_ENABLE=ON -DTRACY_STATIC=ON -DTRACY_MANUAL_LIFETIME=ON
```

NOTE: you should have a file named something.something under some/path, you can add the search path with `-L <library-dir>` or in your project.json with `dependency-search-paths`

When compiling with `-DTRACY_ON_DEMAND` set `TRACY_ON_DEMAND` as a feature, same for `-DTRACY_FIBER` set `TRACY_FIBER`

## Profiling allocations

There is a dedicated `TracyAllocator` to profile all `acquire, realloc, free` used with it.

## Example code
```C3
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
