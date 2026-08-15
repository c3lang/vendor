module pq_test;
import pq;

fn void test_lib_version() @test @feat(!WIN32)
{
	int version = pq::lib_version();
	assert (version > 0);
}