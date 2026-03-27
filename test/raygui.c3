module raygui_test;
import raygui;

fn void test_lock() @test
{
	rg::guiLock();
	rg::guiUnlock();
}