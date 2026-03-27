module ts_test;
import ts;

fn void test_parser_new() @test
{
	ts::TSParser* parser = ts::parser_new();
	assert (parser != null);
	ts::parser_delete(parser);
}