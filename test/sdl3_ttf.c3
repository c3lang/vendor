module sdl3_ttf_test;
import sdl3_ttf;

fn void test_version() @test
{
	int v = sdl3_ttf::version();
	assert (v >= 3000000);
}