module raylib5_test;
import raylib5::rl;

fn void test_log() @test
{
	rl::setTraceLogLevel(rl::TraceLogLevel.NONE);
}

fn void test_struct_layout() @test
{
	rl::Color c = { 255, 128, 64, 255 };
	assert (c.r == (char)255);
	assert (c.g == (char)128);

	rl::Vector2 v = { 10.0f, 20.0f };
	assert (v.x == 10.0f);
	assert (v.y == 20.0f);
}