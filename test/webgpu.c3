module webgpu_test;
import webgpu;

fn void test_create_instance() @test
{
	webgpu::Instance instance = webgpu::createInstance(null);
	if ((void*)instance != null)
	{
		instance.release();
	}
}