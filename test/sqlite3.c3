module sqlite3_test;
import sqlite3;
import std::io;

fn void test_open_close() @test
{
	sqlite3::SqliteHandle db;
	sqlite3::SqliteResult res = sqlite3::open(":memory:", &db);
	assert (res == sqlite3::SqliteResult.OK);
	res = sqlite3::close(db);
	assert (res == sqlite3::SqliteResult.OK);
}

fn void test_exec() @test
{
	sqlite3::SqliteHandle db;
	sqlite3::SqliteResult res = sqlite3::open(":memory:", &db);
	assert (res == sqlite3::SqliteResult.OK);
	defer sqlite3::close(db);

	res = sqlite3::exec(db, "CREATE TABLE test (id INTEGER PRIMARY KEY, name TEXT);", null, null, null);
	assert (res == sqlite3::SqliteResult.OK);

	res = sqlite3::exec(db, "INSERT INTO test (name) VALUES ('C3');", null, null, null);
	assert (res == sqlite3::SqliteResult.OK);
}