module tracy_test;
import tracy;
import std::io;

fn int main(String[] args)
{
	io::printn("Initializing Tracy test...");

	tracy::thread_name("Main Thread");
	tracy::message("Tracy C3 binding test initialized");
	tracy::plot_config("Counter", step: true);

	tracy::zone("Main Zone", color: 0x89b4fa);
	for (sz i = 0; i < 100; i++)
	{
		tracy::@zone_scope("Loop Zone")
		{
			tracy::frame_mark();
			tracy::plot("Counter", i);
		};
	}
	tracy::zone_end();

	// Test memory tracking
	void* ptr = mem::alloc_array(char, 128);
	tracy::alloc(ptr, 128);
	tracy::free(ptr);
	mem::free(ptr);

	io::printn("Tracy test passed successfully!");
	return 0;
}
