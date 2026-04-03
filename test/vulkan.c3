module vulkan_test;
import vulkan;

fn void test_vk_version() @test
{
	int v = vk::VK_API_VERSION_1_0;
	assert (v > 0);
}