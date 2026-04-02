module clang_test;
import clang;

fn void test_null_location() @test
{
	clang::CXSourceLocation loc = clang::getNullLocation();
	assert (loc.int_data == 0);
}