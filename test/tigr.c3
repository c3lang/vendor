module tigr_test;
import tigr;

fn void test_bitmap() @test
{
	tigr::Tigr* bmp = tigr::bitmap(100, 100);
	if (bmp != null)
	{
		tigr::free(bmp);
	}
}