module raylib_test;
import raylib55;

fn void test_log_level() @test
{
	rl::set_trace_log_level(rl::RLTraceLogLevel.NONE);
}

fn void test_math() @test
{
	rl::RLVector2 v = { 3.0f, 4.0f };
	float len = rl::vector2_length(v);
	assert (len == 5.0f);
}