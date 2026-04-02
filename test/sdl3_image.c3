module sdl3_image_test;
import sdl3_image;

fn void test_version() @test
{
	int v = sdl3_image::version();
	assert (v >= 3000000);
}