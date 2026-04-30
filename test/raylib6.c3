module raylib6_test;
import raylib6;

fn void test_log() @test
{
	rl::set_trace_log_level(NONE);
}

fn void test_struct_layout() @test
{
	Color c = { 255, 128, 64, 255 };
	assert (c.r == (char)255);
	assert (c.g == (char)128);

	Vector2 v = { 10.0f, 20.0f };
	assert (v.x == 10.0f);
	assert (v.y == 20.0f);
}
