module mysql_test;
import mysql8;

fn void test_init_close() @test
{
	mysql8::Mysql conn = mysql8::init(null);
	if (conn != null)
	{
		mysql8::close(conn);
	}
}