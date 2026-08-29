# tracy.c3l

https://github.com/wolfpld/tracy

## Overview

These bindings are almost 1:1 with `TracyC.h` of the real tracy. Notable differences include the following:
- Optional parameters are used to reduce verbosity.
- Macros with variants (like `TracyCZoneNC`, `TracyCFrameMarkNamed`, `TracyCPlotF`, etc.) are merged into one macro.
- For functions that take `(ZString txt, sz size)` parameters, their corresponding macros use `String`.
- A dedicated allocator which automatically sends allocs and frees to the tracy profiler.

## Usage

```c3
fn int main(String[] args) => mem::@scoped(&&tracy::wrap_allocator(mem))
{
	tracy::thread_name("Work Thread");
	tracy::plot_config("My Plot", step: true);
	$if $feat(DARWIN):
	tracy::message(DEBUG, "Running on MacOS");
	$endif

	tracy::zone("Work", color: 0x89b4fa);
	for (sz i = 0; i < 100000; i++) tracy::@zone_scope("Inner Job")
	{
		tracy::frame_mark();
		// stuff...
		tracy::plot("Work Progress", i);
	}
	tracy::zone_end();
}
```
