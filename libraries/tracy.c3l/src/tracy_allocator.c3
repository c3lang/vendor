module tracy::allocator;

struct TracyAllocator (Allocator)
{
	Allocator inner_allocator;
}

<*
 Initialize the Tracy allocator.

 @param [&inout] allocator
*>
fn void TracyAllocator.init(&self, Allocator allocator)
{
	self.inner_allocator = allocator;
}

<*
 @require old_pointer != null
*>
fn void TracyAllocator.release(&self, void* old_pointer, bool aligned) @dynamic
{
	tracy::free(old_pointer);
	self.inner_allocator.release(old_pointer, aligned);
}

<*
 @require size > 0
 @require old_pointer != null
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
*>
fn void*? TracyAllocator.resize(&self, void* old_pointer, sz size, sz alignment) @dynamic
{
	void* new_pointer = self.inner_allocator.resize(old_pointer, size, alignment)!;
	tracy::free(old_pointer);
	tracy::alloc(new_pointer, size);
	return new_pointer;
}

<*
 @require alignment <= mem::MAX_MEMORY_ALIGNMENT : `alignment too big`
 @require size > 0
*>
fn void*? TracyAllocator.acquire(&self, sz size, AllocInitType init_type, sz alignment) @dynamic
{
	void* pointer = self.inner_allocator.acquire(size, init_type, alignment)!;
	tracy::alloc(pointer, size);
	return pointer;
}

module tracy;
macro TracyAllocator wrap_allocator(Allocator alloc)
{
	TracyAllocator tracy_alloc;
	tracy_alloc.init(alloc);
	return tracy_alloc;
}
