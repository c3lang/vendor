module sdl2_test;
import sdl;

fn void test_init_quit() @test
{
	if (sdl::init(sdl::INIT_VIDEO) == 0)
	{
		sdl::quit();
	}
}