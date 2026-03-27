module glfw34_test;
import glfw34;

fn void test_init_terminate() @test
{
	if (glfw34::init() == 1)
	{
		glfw34::terminate();
	}
}

fn void test_version() @test
{
	int major, minor, rev;
	glfw34::getVersion(&major, &minor, &rev);
	assert (major >= 3);
}