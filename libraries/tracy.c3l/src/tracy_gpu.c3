module tracy;

struct TracyGpuCtx
{
	char context;
	ushort head;
	long cpuLastTime;
}
enum TracyGpuCtxType : char
{
    INVALID,
    OPENGL,
    VULKAN,
    OPENCL,
    DIRECT3D12,
    DIRECT3D11,
    METAL,
    CUSTOM,
    CUDA,
    ROCPROF,
    WEBGPU,
}

module tracy @feat(!TRACY_DISABLE);

import std::time;
import std::collections::linkedlist;
import std::collections::map;

macro TracyGpuCtx gpu_context(TracyGpuCtxType type, float timestamp_period, long gpu_time)
{
	TracyGpuCtx gpu_ctx = {
		.context = 0,
		.cpuLastTime = ___tracy_get_time(),
	};
	___tracy_emit_gpu_new_context_serial({
		.context = gpu_ctx.context,
		.type = type,
		.period = timestamp_period,
		.gpuTime = gpu_time,
	});
	return gpu_ctx;
}
macro ushort next_query_id(TracyGpuCtx* self) @local => (ushort)self.head++;
macro void TracyGpuCtx.zone_begin(&self, String name)
{
	ulong srcloc = ___tracy_alloc_srcloc_name($$LINE,
		$$FILE, ((String)$$FILE).len,
		$$FUNC, ((String)$$FUNC).len,
		(ZString)name.ptr, name.len,
		tracy::random_color());
	___tracy_emit_gpu_zone_begin_alloc_serial({
		.context = self.context,
		.queryId = next_query_id(self),
		.srcloc = srcloc,
	});
}
macro void TracyGpuCtx.zone_end(&self)
{
	___tracy_emit_gpu_zone_end_serial({
		.context = self.context,
		.queryId = next_query_id(self),
	});
}
macro void TracyGpuCtx.emit_time(&self, ushort query, long time)
{
	___tracy_emit_gpu_time_serial({
		.context = self.context,
		.queryId = query,
		.gpuTime = time,
	});
}
macro void TracyGpuCtx.reset_ctx(&self) => self.head = 0;
macro void TracyGpuCtx.calibrate(&self, long time)
{
	long cpu_now = ___tracy_get_time();
	defer self.cpuLastTime = cpu_now;
	// ___tracy_emit_gpu_time_sync_serial({
	// 	.context = self.context,
	// 	.gpuTime = time,
	// });
	___tracy_emit_gpu_calibration_serial({
		.context = self.context,
		.gpuTime = time,
		.cpuDelta = cpu_now - self.cpuLastTime,
	});
}

module tracy @feat(TRACY_DISABLE);

macro TracyGpuCtx gpu_context(TracyGpuCtxType type, float timestamp_period, long gpu_time) => (TracyGpuCtx){};
macro void TracyGpuCtx.zone_begin(&self, String name) {}
macro void TracyGpuCtx.zone_end(&self) {}
macro void TracyGpuCtx.emit_time(&self, ushort query, long time) {}
macro void TracyGpuCtx.reset_ctx(&self) {}
macro void TracyGpuCtx.calibrate(&self, long time) {}
