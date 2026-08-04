module tracy;

constdef PlotFormatEnum
{
	TRACY_PLOT_FORMAT_NUMBER,
	TRACY_PLOT_FORMAT_MEMORY,
	TRACY_PLOT_FORMAT_PERCENTAGE,
	TRACY_PLOT_FORMAT_WATT
}

constdef MessageSeverity
{
	TRACY_MESSAGE_SEVERITY_TRACE,   // Broadly track variable states and events in the software program.
	TRACY_MESSAGE_SEVERITY_DEBUG,   // Describes variable states and details about specific internal events in the software, that are useful for investigations.
	TRACY_MESSAGE_SEVERITY_INFO,    // Describes normal events, which inform on the expected progress and state of your software.
	TRACY_MESSAGE_SEVERITY_WARNING, // Describes potentially dangerous situations caused by unexpected events and states.
	TRACY_MESSAGE_SEVERITY_ERROR,   // Describes the occurance of unexpected behavior. Does not interrupt the execution of the software.
	TRACY_MESSAGE_SEVERITY_FATAL,   // Describes a critical event that will lead to a software failure/crash.
}

struct SourceLocationData
{
	ZString name;
	ZString function;
	ZString file;
	uint line;
	uint color;
}

struct ZoneContext
{
	uint id;
	int active;
	ulong connectionId @feat(TRACY_ON_DEMAND);
}

struct GpuTimeData
{
	long gpuTime;
	ushort queryId;
	char context;
}

struct GpuZoneBeginData
{
	ulong srcloc;
	ushort queryId;
	char context;
}

struct GpuZoneBeginCallstackData
{
	ulong srcloc;
	int depth;
	ushort queryId;
	char context;
}

struct GpuZoneEndData
{
	ushort queryId;
	char context;
}

struct GpuNewContextData
{
	ulong gpuTime;
	float period;
	char context;
	char flags;
	char type;
}

struct GpuContextNameData
{
	char context;
	ZString name;
	ushort len;
}

struct GpuCalibrationData
{
	long gpuTime;
	long cpuDelta;
	char context;
}

struct GpuTimeSyncData
{
	long gpuTime;
	char context;
}

extern fn void set_thread_name(ZString name) @cname("___tracy_set_thread_name");

extern fn ulong alloc_srcloc(uint line, ZString source, usz sourceSz, ZString function, usz functionSz, uint color) @cname("___tracy_alloc_srcloc");
extern fn ulong alloc_srcloc_name(uint line, ZString source, usz sourceSz, ZString function, usz functionSz, ZString name, usz nameSz, uint color) @cname("___tracy_alloc_srcloc_name");

extern fn ZoneContext emit_zone_begin(SourceLocationData* srcloc, int active) @cname("___tracy_emit_zone_begin");
extern fn ZoneContext emit_zone_begin_callstack(SourceLocationData* srcloc, int depth, int active) @cname("___tracy_emit_zone_begin_callstack");
extern fn ZoneContext emit_zone_begin_alloc(ulong srcloc, int active) @cname("___tracy_emit_zone_begin_alloc");
extern fn ZoneContext emit_zone_begin_alloc_callstack(ulong srcloc, int depth, int active) @cname("___tracy_emit_zone_begin_alloc_callstack");
extern fn void emit_zone_end(ZoneContext ctx) @cname("___tracy_emit_zone_end");
extern fn void emit_zone_text(ZoneContext ctx, ZString txt, usz size) @cname("___tracy_emit_zone_text");
extern fn void emit_zone_text_fmt(ZoneContext ctx, ZString fmt, ...) @cname("___tracy_emit_zone_text_fmt");
extern fn void emit_zone_name(ZoneContext ctx, ZString txt, usz size) @cname("___tracy_emit_zone_name");
extern fn void emit_zone_name_fmt(ZoneContext ctx, ZString fmt, ...) @cname("___tracy_emit_zone_name_fmt");
extern fn void emit_zone_color(ZoneContext ctx, uint color) @cname("___tracy_emit_zone_color");
extern fn void emit_zone_value(ZoneContext ctx, ulong value) @cname("___tracy_emit_zone_value");

extern fn void emit_gpu_zone_begin(GpuZoneBeginData data) @cname("___tracy_emit_gpu_zone_begin");
extern fn void emit_gpu_zone_begin_callstack(GpuZoneBeginCallstackData data) @cname("___tracy_emit_gpu_zone_begin_callstack");
extern fn void emit_gpu_zone_begin_alloc(GpuZoneBeginData data) @cname("___tracy_emit_gpu_zone_begin_alloc");
extern fn void emit_gpu_zone_begin_alloc_callstack(GpuZoneBeginCallstackData) @cname("___tracy_emit_gpu_zone_begin_alloc_callstack");
extern fn void emit_gpu_zone_end(GpuZoneEndData data) @cname("___tracy_emit_gpu_zone_end");
extern fn void emit_gpu_time(GpuTimeData) @cname("___tracy_emit_gpu_time");
extern fn void emit_gpu_new_context(GpuNewContextData) @cname("___tracy_emit_gpu_new_context");
extern fn void emit_gpu_context_name(GpuContextNameData) @cname("___tracy_emit_gpu_context_name");
extern fn void emit_gpu_calibration(GpuCalibrationData) @cname("___tracy_emit_gpu_calibration");
extern fn void emit_gpu_time_sync(GpuTimeSyncData) @cname("___tracy_emit_gpu_time_sync");

extern fn void emit_gpu_zone_begin_serial(GpuZoneBeginData) @cname("___tracy_emit_gpu_zone_begin_serial");
extern fn void emit_gpu_zone_begin_callstack_serial(GpuZoneBeginCallstackData) @cname("___tracy_emit_gpu_zone_begin_callstack_serial");
extern fn void emit_gpu_zone_begin_alloc_serial(GpuZoneBeginData) @cname("___tracy_emit_gpu_zone_begin_alloc_serial");
extern fn void emit_gpu_zone_begin_alloc_callstack_serial(GpuZoneBeginCallstackData ) @cname("___tracy_emit_gpu_zone_begin_alloc_callstack_serial");
extern fn void emit_gpu_zone_end_serial(GpuZoneEndData data ) @cname("___tracy_emit_gpu_zone_end_serial");
extern fn void emit_gpu_time_serial(GpuTimeData ) @cname("___tracy_emit_gpu_time_serial");
extern fn void emit_gpu_new_context_serial(GpuNewContextData) @cname("___tracy_emit_gpu_new_context_serial");
extern fn void emit_gpu_context_name_serial(GpuContextNameData) @cname("___tracy_emit_gpu_context_name_serial");
extern fn void emit_gpu_calibration_serial(GpuCalibrationData) @cname("___tracy_emit_gpu_calibration_serial");
extern fn void emit_gpu_time_sync_serial(GpuTimeSyncData) @cname("___tracy_emit_gpu_time_sync_serial");

extern fn int connected() @cname("___tracy_connected");

extern fn void emit_memory_alloc(void* ptr, usz size) @cname("___tracy_emit_memory_alloc");
extern fn void emit_memory_alloc_callstack(void* ptr, usz size, int depth) @cname("___tracy_emit_memory_alloc_callstack");
extern fn void emit_memory_free(void* ptr) @cname("___tracy_emit_memory_free");
extern fn void emit_memory_free_callstack(void* ptr, int depth) @cname("___tracy_emit_memory_free_callstack");
extern fn void emit_memory_alloc_named(void* ptr, usz size, ZString name) @cname("___tracy_emit_memory_alloc_named");
extern fn void emit_memory_alloc_callstack_named(void* ptr, usz size, int depth, ZString name) @cname("___tracy_emit_memory_alloc_callstack_named");
extern fn void emit_memory_free_named(void* ptr, ZString name) @cname("___tracy_emit_memory_free_named");
extern fn void emit_memory_free_callstack_named(void* ptr, int depth, ZString name) @cname("___tracy_emit_memory_free_callstack_named");
extern fn void emit_memory_discard(ZString name) @cname("___tracy_emit_memory_discard");
extern fn void emit_memory_discard_callstack(ZString name, int depth) @cname("___tracy_emit_memory_discard_callstack");

extern fn void emit_message(ZString txt, usz size, int callstack_depth) @cname("___tracy_emit_message");

extern fn void emit_frame_mark(ZString name) @cname("___tracy_emit_frame_mark");
extern fn void emit_frame_mark_start(ZString name) @cname("___tracy_emit_frame_mark_start");
extern fn void emit_frame_mark_end(ZString name) @cname("___tracy_emit_frame_mark_end");
extern fn void emit_frame_image(ZString image, ushort w, ushort h, char offset, int flip) @cname("___tracy_emit_frame_image");

extern fn void emit_plot(ZString name, double val) @cname("___tracy_emit_plot");
extern fn void emit_plot_float(ZString name, float val) @cname("___tracy_emit_plot_float");
extern fn void emit_plot_int(ZString name, long val) @cname("___tracy_emit_plot_int");
extern fn void emit_plot_config(ZString name, int type, int step, int fill, uint color) @cname("___tracy_emit_plot_config");
extern fn void emit_message_appinfo(ZString txt, usz size) @cname("___tracy_emit_message_appinfo");

extern fn int begin_sampling_profiling() @cname("___tracy_begin_sampling_profiling");
extern fn void end_sampling_profiling() @cname("___tracy_end_sampling_profiling");

extern fn long get_time() @cname("___tracy_get_time");

module tracy @feat(TRACY_FIBERS);

extern fn void fiber_enter(ZString fiber) @cname("___tracy_fiber_enter");
extern fn void fiber_leave() @cname("___tracy_fiber_leave");
