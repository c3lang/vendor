module tracy;

struct TracyAllocator (Allocator)
{
	Allocator backing_allocator;
}

fn void TracyAllocator.init(&self, Allocator backing_allocator)
{
	self.backing_allocator = backing_allocator;
}

fn void*? TracyAllocator.acquire(&self, sz bytes, AllocInitType init_type, sz alignment) @dynamic
{
	void*? ptr = self.backing_allocator.acquire(bytes, init_type, alignment);
	$if $feat(TRACY_ENABLE):
	if (try pointer = ptr)
	{
		tracy::emit_memory_alloc_named(pointer, (usz)bytes, "acquire");
	}
	$endif
	return ptr;
}

fn void*? TracyAllocator.resize(&self, void* old_ptr, sz new_bytes, sz alignment) @dynamic
{
	$if $feat(TRACY_ENABLE):
	tracy::emit_memory_free_named(old_ptr, "resize");
	$endif
	void*? ptr = self.backing_allocator.resize(old_ptr, new_bytes, alignment);
	$if $feat(TRACY_ENABLE):
	if (try pointer = ptr)
	{
		tracy::emit_memory_alloc_named(pointer, (usz)new_bytes, "resize");
	}
	$endif
	return ptr;
}

fn void TracyAllocator.release(&self, void* old_ptr, bool aligned) @dynamic
{
	$if $feat(TRACY_ENABLE):
	tracy::emit_memory_free_named(old_ptr, "release");
	$endif
	return self.backing_allocator.release(old_ptr, aligned);
}
