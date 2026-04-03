module glfw_test;
import glfw;

fn void test_init_terminate() @test
{
	if (glfw::init() == 1)
	{
		glfw::terminate();
	}
}

fn void test_version() @test
{
	int major, minor, rev;
	glfw::getVersion(&major, &minor, &rev);
	assert (major >= 3);
}