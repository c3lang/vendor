module sdl3_test;
import sdl3;

fn void test_init_quit() @test
{
	sdl3::SdlInitFlags flags = { };
	flags.video = true;
	if (sdl3::init(flags))
	{
		sdl3::quit();
	}
}