module ktx_test;
import khr;

fn void test_error_string() @test
{
	ZString s = ktx::error_string(ktx::KtxErrorCode.SUCCESS);
	assert (s != null);
}