module lmdb_test;

import libc;
import lmdb;
import std::core::mem;
import std::io;
import std::os::win32;

fn Path fresh_directory(String name)
{
	Path directory = path::temp_directory(tmem).tappend(name)!!;
	if (path::exists(directory)) (void)path::rmtree(directory);
	path::mkdir(directory)!!;
	return directory;
}


fn void assert_value(lmdb::MdbVal actual, String expected)
{
	assert(actual.size == expected.len);
	assert(libc::memcmp(actual.data, expected.ptr, actual.size) == 0);
}

fn void test_main_database() @test
{
	Path directory = fresh_directory("c3_lmdb_main");
	defer (void)path::rmtree(directory);

	lmdb::MdbEnv env;
	assert(lmdb::env_create(&env) == lmdb::MdbResult.SUCCESS);
	defer lmdb::env_close(env);
	assert(lmdb::env_set_mapsize(env, 1024 * 1024) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::env_open(env, directory.zstr_copy(tmem), lmdb::MdbEnvFlags.NONE, 0o600) == lmdb::MdbResult.SUCCESS);

	lmdb::MdbTxn transaction;
	lmdb::MdbDbi database;
	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.NONE, &transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::dbi_open(transaction, null, lmdb::MdbDbiFlags.NONE, &database) == lmdb::MdbResult.SUCCESS);
	String[3] keys = { "b", "a", "c" };
	foreach (key_bytes : keys)
	{
		lmdb::MdbVal key = key_bytes.to_mdbval();
		lmdb::MdbVal data = key_bytes.to_mdbval();
		assert(lmdb::put(transaction, database, &key, &data, lmdb::MdbWriteFlags.NOOVERWRITE) == lmdb::MdbResult.SUCCESS);
	}
	lmdb::MdbVal duplicate_key = "b".to_mdbval();
	lmdb::MdbVal duplicate_data = "other".to_mdbval();
	assert(lmdb::put(transaction, database, &duplicate_key, &duplicate_data, lmdb::MdbWriteFlags.NOOVERWRITE) == lmdb::MdbResult.KEYEXIST);
	assert(lmdb::txn_commit(transaction) == lmdb::MdbResult.SUCCESS);

	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.NONE, &transaction) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbVal aborted_key = "aborted".to_mdbval();
	lmdb::MdbVal aborted_data = "value".to_mdbval();
	assert(lmdb::put(transaction, database, &aborted_key, &aborted_data, lmdb::MdbWriteFlags.NONE) == lmdb::MdbResult.SUCCESS);
	lmdb::txn_abort(transaction);

	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.RDONLY, &transaction) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbVal found = {};
	assert(lmdb::get(transaction, database, &aborted_key, &found) == lmdb::MdbResult.NOTFOUND);
	lmdb::MdbCursor cursor;
	assert(lmdb::cursor_open(transaction, database, &cursor) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbVal cursor_key = {};
	lmdb::MdbVal cursor_value = {};
	assert(lmdb::cursor_get(cursor, &cursor_key, &cursor_value, lmdb::MdbCursorOp.FIRST) == lmdb::MdbResult.SUCCESS);
	assert_value(cursor_key, "a");
	assert(lmdb::cursor_get(cursor, &cursor_key, &cursor_value, lmdb::MdbCursorOp.NEXT) == lmdb::MdbResult.SUCCESS);
	assert_value(cursor_key, "b");
	assert(lmdb::cursor_get(cursor, &cursor_key, &cursor_value, lmdb::MdbCursorOp.LAST) == lmdb::MdbResult.SUCCESS);
	assert_value(cursor_key, "c");
	assert(lmdb::cursor_get(cursor, &cursor_key, &cursor_value, lmdb::MdbCursorOp.PREV) == lmdb::MdbResult.SUCCESS);
	assert_value(cursor_key, "b");
	lmdb::cursor_close(cursor);
	lmdb::txn_abort(transaction);

	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.NONE, &transaction) == lmdb::MdbResult.SUCCESS);
	duplicate_key = "b".to_mdbval();
	assert(lmdb::del(transaction, database, &duplicate_key, null) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::del(transaction, database, &duplicate_key, null) == lmdb::MdbResult.NOTFOUND);
	assert(lmdb::txn_commit(transaction) == lmdb::MdbResult.SUCCESS);
}

fn void test_named_database() @test
{
	Path directory = fresh_directory("c3_lmdb_named");
	defer (void)path::rmtree(directory);

	lmdb::MdbEnv env;
	assert(lmdb::env_create(&env) == lmdb::MdbResult.SUCCESS);
	defer lmdb::env_close(env);
	assert(lmdb::env_set_maxdbs(env, 2) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::env_open(env, directory.zstr_copy(tmem), lmdb::MdbEnvFlags.NONE, 0o600) == lmdb::MdbResult.SUCCESS);

	lmdb::MdbTxn transaction;
	lmdb::MdbDbi database;
	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.NONE, &transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::dbi_open(transaction, "named", lmdb::MdbDbiFlags.CREATE, &database) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbVal key = "key".to_mdbval();
	lmdb::MdbVal data = "value".to_mdbval();
	assert(lmdb::put(transaction, database, &key, &data, lmdb::MdbWriteFlags.NONE) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::txn_commit(transaction) == lmdb::MdbResult.SUCCESS);

	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.RDONLY, &transaction) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbDbi reopened;
	assert(lmdb::dbi_open(transaction, "named", lmdb::MdbDbiFlags.NONE, &reopened) == lmdb::MdbResult.SUCCESS);
	assert(reopened == database);
	lmdb::MdbVal found = {};
	assert(lmdb::get(transaction, reopened, &key, &found) == lmdb::MdbResult.SUCCESS);
	assert_value(found, "value");
	lmdb::MdbStat stat;
	assert(lmdb::stat(transaction, reopened, &stat) == lmdb::MdbResult.SUCCESS);
	assert(stat.entries == 1);
	lmdb::MdbDbiFlags flags;
	assert(lmdb::dbi_flags(transaction, reopened, &flags) == lmdb::MdbResult.SUCCESS);
	assert(flags == lmdb::MdbDbiFlags.NONE);
	lmdb::txn_abort(transaction);
}

fn void test_sorted_duplicates() @test
{
	Path directory = fresh_directory("c3_lmdb_dupsort");
	defer (void)path::rmtree(directory);

	lmdb::MdbEnv env;
	assert(lmdb::env_create(&env) == lmdb::MdbResult.SUCCESS);
	defer lmdb::env_close(env);
	assert(lmdb::env_set_maxdbs(env, 2) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::env_open(env, directory.zstr_copy(tmem), lmdb::MdbEnvFlags.NONE, 0o600) == lmdb::MdbResult.SUCCESS);

	lmdb::MdbTxn transaction;
	lmdb::MdbDbi database;
	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.NONE, &transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::dbi_open(transaction, "dups", lmdb::MdbDbiFlags.CREATE | lmdb::MdbDbiFlags.DUPSORT, &database) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbVal key = "fruit".to_mdbval();
	foreach (data_bytes : (String[2]){ "banana", "apple" })
	{
		lmdb::MdbVal data = data_bytes.to_mdbval();
		assert(lmdb::put(transaction, database, &key, &data, lmdb::MdbWriteFlags.NODUPDATA) == lmdb::MdbResult.SUCCESS);
	}
	lmdb::MdbCursor cursor;
	assert(lmdb::cursor_open(transaction, database, &cursor) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbVal cherry = "cherry".to_mdbval();
	assert(lmdb::cursor_put(cursor, &key, &cherry, lmdb::MdbWriteFlags.NODUPDATA) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbVal apple = "apple".to_mdbval();
	assert(lmdb::cursor_put(cursor, &key, &apple, lmdb::MdbWriteFlags.NODUPDATA) == lmdb::MdbResult.KEYEXIST);
	lmdb::cursor_close(cursor);
	assert(lmdb::txn_commit(transaction) == lmdb::MdbResult.SUCCESS);

	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.RDONLY, &transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::cursor_open(transaction, database, &cursor) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbVal found_key = "fruit".to_mdbval();
	lmdb::MdbVal found_data = {};
	assert(lmdb::cursor_get(cursor, &found_key, &found_data, lmdb::MdbCursorOp.SET) == lmdb::MdbResult.SUCCESS);
	assert_value(found_data, "apple");
	lmdb::MdbSize count;
	assert(lmdb::cursor_count(cursor, &count) == lmdb::MdbResult.SUCCESS);
	assert(count == 3);
	assert(lmdb::cursor_get(cursor, &found_key, &found_data, lmdb::MdbCursorOp.NEXT_DUP) == lmdb::MdbResult.SUCCESS);
	assert_value(found_data, "banana");
	assert(lmdb::cursor_get(cursor, &found_key, &found_data, lmdb::MdbCursorOp.NEXT_DUP) == lmdb::MdbResult.SUCCESS);
	assert_value(found_data, "cherry");
	assert(lmdb::cursor_get(cursor, &found_key, &found_data, lmdb::MdbCursorOp.NEXT_DUP) == lmdb::MdbResult.NOTFOUND);
	lmdb::cursor_close(cursor);
	lmdb::txn_abort(transaction);

	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.NONE, &transaction) == lmdb::MdbResult.SUCCESS);
	key = "fruit".to_mdbval();
	lmdb::MdbVal banana = "banana".to_mdbval();
	assert(lmdb::del(transaction, database, &key, &banana) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::del(transaction, database, &key, &banana) == lmdb::MdbResult.NOTFOUND);
	assert(lmdb::txn_commit(transaction) == lmdb::MdbResult.SUCCESS);
}

fn void test_fixed_duplicates() @test
{
	Path directory = fresh_directory("c3_lmdb_dupfixed");
	defer (void)path::rmtree(directory);

	lmdb::MdbEnv env;
	assert(lmdb::env_create(&env) == lmdb::MdbResult.SUCCESS);
	defer lmdb::env_close(env);
	assert(lmdb::env_set_maxdbs(env, 2) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::env_set_mapsize(env, 8 * 1024 * 1024) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::env_open(env, directory.zstr_copy(tmem), lmdb::MdbEnvFlags.NONE, 0o600) == lmdb::MdbResult.SUCCESS);

	lmdb::MdbStat env_stat;
	assert(lmdb::env_stat(env, &env_stat) == lmdb::MdbResult.SUCCESS);
	uint item_count = env_stat.page_size / 8 + 64;
	lmdb::MdbTxn transaction;
	lmdb::MdbDbi database;
	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.NONE, &transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::dbi_open(transaction, "fixed", lmdb::MdbDbiFlags.CREATE | lmdb::MdbDbiFlags.DUPSORT | lmdb::MdbDbiFlags.DUPFIXED, &database) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbVal key = "key".to_mdbval();
	for (uint i = 0; i < item_count; i++)
	{
		char[8] bytes = {};
		bytes[4] = (char)(i >> 24);
		bytes[5] = (char)(i >> 16);
		bytes[6] = (char)(i >> 8);
		bytes[7] = (char)i;
		lmdb::MdbVal data = { .size = bytes.len, .data = &bytes[0] };
		assert(lmdb::put(transaction, database, &key, &data, lmdb::MdbWriteFlags.NODUPDATA) == lmdb::MdbResult.SUCCESS);
	}
	assert(lmdb::txn_commit(transaction) == lmdb::MdbResult.SUCCESS);

	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.RDONLY, &transaction) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbStat stat;
	assert(lmdb::stat(transaction, database, &stat) == lmdb::MdbResult.SUCCESS);
	assert(stat.entries == item_count);
	lmdb::MdbCursor cursor;
	assert(lmdb::cursor_open(transaction, database, &cursor) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbVal found_key = "key".to_mdbval();
	lmdb::MdbVal batch = {};
	assert(lmdb::cursor_get(cursor, &found_key, &batch, lmdb::MdbCursorOp.SET) == lmdb::MdbResult.SUCCESS);
	int result = lmdb::cursor_get(cursor, &found_key, &batch, lmdb::MdbCursorOp.GET_MULTIPLE);
	uint seen;
	while (result == lmdb::MdbResult.SUCCESS)
	{
		assert(batch.size % 8 == 0);
		char* packed = (char*)batch.data;
		for (usz offset = 0; offset < batch.size; offset += 8)
		{
			uint actual = ((uint)packed[offset + 4] << 24)
				| ((uint)packed[offset + 5] << 16)
				| ((uint)packed[offset + 6] << 8)
				| (uint)packed[offset + 7];
			assert(actual == seen++);
		}
		result = lmdb::cursor_get(cursor, &found_key, &batch, lmdb::MdbCursorOp.NEXT_MULTIPLE);
	}
	assert(result == lmdb::MdbResult.NOTFOUND);
	assert(seen == item_count);
	lmdb::cursor_close(cursor);
	lmdb::txn_abort(transaction);
}

fn void test_integer_keys() @test
{
	Path directory = fresh_directory("c3_lmdb_integer");
	defer (void)path::rmtree(directory);

	lmdb::MdbEnv env;
	assert(lmdb::env_create(&env) == lmdb::MdbResult.SUCCESS);
	defer lmdb::env_close(env);
	assert(lmdb::env_set_maxdbs(env, 2) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::env_open(env, directory.zstr_copy(tmem), lmdb::MdbEnvFlags.NONE, 0o600) == lmdb::MdbResult.SUCCESS);

	lmdb::MdbTxn transaction;
	lmdb::MdbDbi database;
	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.NONE, &transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::dbi_open(transaction, "integers", lmdb::MdbDbiFlags.CREATE | lmdb::MdbDbiFlags.INTEGERKEY, &database) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbCursor cursor;
	assert(lmdb::cursor_open(transaction, database, &cursor) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbSize[10] keys = { 9, 1, 5, 3, 7, 0, 8, 2, 6, 4 };
	lmdb::MdbVal data = "value".to_mdbval();
	foreach (key_number : keys)
	{
		lmdb::MdbVal key = { .size = @sizeof(key_number), .data = &key_number };
		assert(lmdb::cursor_put(cursor, &key, &data, lmdb::MdbWriteFlags.NOOVERWRITE) == lmdb::MdbResult.SUCCESS);
	}
	lmdb::cursor_close(cursor);
	assert(lmdb::txn_commit(transaction) == lmdb::MdbResult.SUCCESS);

	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.RDONLY, &transaction) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbStat stat;
	assert(lmdb::stat(transaction, database, &stat) == lmdb::MdbResult.SUCCESS);
	assert(stat.entries == keys.len);
	assert(lmdb::cursor_open(transaction, database, &cursor) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbVal found_key = {};
	lmdb::MdbVal found_data = {};
	int result = lmdb::cursor_get(cursor, &found_key, &found_data, lmdb::MdbCursorOp.FIRST);
	lmdb::MdbSize expected;
	while (result == lmdb::MdbResult.SUCCESS)
	{
		assert(found_key.size == @sizeof(expected));
		assert(mem::load((lmdb::MdbSize*)found_key.data, 1) == expected++);
		result = lmdb::cursor_get(cursor, &found_key, &found_data, lmdb::MdbCursorOp.NEXT);
	}
	assert(result == lmdb::MdbResult.NOTFOUND);
	assert(expected == keys.len);
	lmdb::cursor_close(cursor);
	lmdb::txn_abort(transaction);
}

fn void test_copy_stat_and_drop() @test
{
	Path root = fresh_directory("c3_lmdb_copy");
	defer (void)path::rmtree(root);
	Path source_path = root.tappend("source")!!;
	Path copy_path = root.tappend("copy")!!;
	path::mkdir(source_path)!!;
	path::mkdir(copy_path)!!;

	lmdb::MdbEnv env;
	assert(lmdb::env_create(&env) == lmdb::MdbResult.SUCCESS);
	defer lmdb::env_close(env);
	assert(lmdb::env_set_maxdbs(env, 2) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::env_set_mapsize(env, 1024 * 1024) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::env_open(env, source_path.zstr_copy(tmem), lmdb::MdbEnvFlags.NONE, 0o600) == lmdb::MdbResult.SUCCESS);

	lmdb::MdbTxn transaction;
	lmdb::MdbDbi database;
	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.NONE, &transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::dbi_open(transaction, "records", lmdb::MdbDbiFlags.CREATE, &database) == lmdb::MdbResult.SUCCESS);
	foreach (key_bytes : (String[2]){ "one", "two" })
	{
		lmdb::MdbVal key = key_bytes.to_mdbval();
		lmdb::MdbVal data = key_bytes.to_mdbval();
		assert(lmdb::put(transaction, database, &key, &data, lmdb::MdbWriteFlags.NONE) == lmdb::MdbResult.SUCCESS);
	}
	assert(lmdb::txn_commit(transaction) == lmdb::MdbResult.SUCCESS);

	lmdb::MdbEnvInfo info;
	assert(lmdb::env_info(env, &info) == lmdb::MdbResult.SUCCESS);
	assert(info.map_size >= 1024 * 1024);
	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.RDONLY, &transaction) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbStat stat;
	assert(lmdb::stat(transaction, database, &stat) == lmdb::MdbResult.SUCCESS);
	assert(stat.entries == 2);
	lmdb::MdbDbiFlags flags;
	assert(lmdb::dbi_flags(transaction, database, &flags) == lmdb::MdbResult.SUCCESS);
	assert(flags == lmdb::MdbDbiFlags.NONE);
	lmdb::txn_abort(transaction);

	assert(lmdb::env_copy2(env, copy_path.zstr_copy(tmem), lmdb::MdbCopyFlags.COMPACT) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbEnv copied_env;
	assert(lmdb::env_create(&copied_env) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::env_set_maxdbs(copied_env, 2) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::env_open(copied_env, copy_path.zstr_copy(tmem), lmdb::MdbEnvFlags.RDONLY, 0) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbTxn copied_transaction;
	assert(lmdb::txn_begin(copied_env, null, lmdb::MdbTxnFlags.RDONLY, &copied_transaction) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbDbi copied_database;
	assert(lmdb::dbi_open(copied_transaction, "records", lmdb::MdbDbiFlags.NONE, &copied_database) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbVal copied_key = "two".to_mdbval();
	lmdb::MdbVal copied_value = {};
	assert(lmdb::get(copied_transaction, copied_database, &copied_key, &copied_value) == lmdb::MdbResult.SUCCESS);
	assert_value(copied_value, "two");
	lmdb::txn_abort(copied_transaction);
	lmdb::env_close(copied_env);

	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.NONE, &transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::drop(transaction, database, 0) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::txn_commit(transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.RDONLY, &transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::stat(transaction, database, &stat) == lmdb::MdbResult.SUCCESS);
	assert(stat.entries == 0);
	lmdb::txn_abort(transaction);

	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.NONE, &transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::drop(transaction, database, 1) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::txn_commit(transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.RDONLY, &transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::dbi_open(transaction, "records", lmdb::MdbDbiFlags.NONE, &database) == lmdb::MdbResult.NOTFOUND);
	lmdb::txn_abort(transaction);
}

fn void test_incremental_dump_and_load() @test
{
	Path root = fresh_directory("c3_lmdb_incremental");
	defer (void)path::rmtree(root);
	Path source_path = root.tappend("source")!!;
	Path baseline_path = root.tappend("baseline")!!;
	Path dump_path = root.tappend("incremental.bin")!!;
	path::mkdir(source_path)!!;
	path::mkdir(baseline_path)!!;

	lmdb::MdbEnv source_env;
	assert(lmdb::env_create(&source_env) == lmdb::MdbResult.SUCCESS);
	defer lmdb::env_close(source_env);
	assert(lmdb::env_set_mapsize(source_env, 1024 * 1024) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::env_open(source_env, source_path.zstr_copy(tmem), lmdb::MdbEnvFlags.NONE, 0o600) == lmdb::MdbResult.SUCCESS);

	lmdb::MdbTxn transaction;
	lmdb::MdbDbi database;
	assert(lmdb::txn_begin(source_env, null, lmdb::MdbTxnFlags.NONE, &transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::dbi_open(transaction, null, lmdb::MdbDbiFlags.NONE, &database) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbVal baseline_key = "baseline".to_mdbval();
	lmdb::MdbVal baseline_value = "present".to_mdbval();
	assert(lmdb::put(transaction, database, &baseline_key, &baseline_value, lmdb::MdbWriteFlags.NONE) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbSize baseline_id = lmdb::txn_id(transaction);
	assert(lmdb::txn_commit(transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::env_copy(source_env, baseline_path.zstr_copy(tmem)) == lmdb::MdbResult.SUCCESS);

	assert(lmdb::txn_begin(source_env, null, lmdb::MdbTxnFlags.NONE, &transaction) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbVal incremental_key = "incremental".to_mdbval();
	lmdb::MdbVal incremental_value = "restored".to_mdbval();
	assert(lmdb::put(transaction, database, &incremental_key, &incremental_value, lmdb::MdbWriteFlags.NONE) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::txn_commit(transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::env_incr_dump(source_env, dump_path.zstr_copy(tmem), baseline_id) == lmdb::MdbResult.SUCCESS);

	lmdb::MdbEnv baseline_env;
	assert(lmdb::env_create(&baseline_env) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::env_open(baseline_env, baseline_path.zstr_copy(tmem), lmdb::MdbEnvFlags.WRITEMAP, 0o600) == lmdb::MdbResult.SUCCESS);
	File dump_file = file::open_path(dump_path, "rb")!!;
$if env::WIN32:
	void* dump_handle = (void*)win32::_get_osfhandle(dump_file.fd());
	assert(lmdb::env_incr_loadfd(baseline_env, dump_handle) == lmdb::MdbResult.SUCCESS);
$else
	assert(lmdb::env_incr_loadfd(baseline_env, (int)dump_file.fd()) == lmdb::MdbResult.SUCCESS);
$endif
	dump_file.close()!!;
	lmdb::env_close(baseline_env);

	assert(lmdb::env_create(&baseline_env) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::env_open(baseline_env, baseline_path.zstr_copy(tmem), lmdb::MdbEnvFlags.RDONLY, 0) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::txn_begin(baseline_env, null, lmdb::MdbTxnFlags.RDONLY, &transaction) == lmdb::MdbResult.SUCCESS);
	assert(lmdb::dbi_open(transaction, null, lmdb::MdbDbiFlags.NONE, &database) == lmdb::MdbResult.SUCCESS);
	lmdb::MdbVal restored = {};
	assert(lmdb::get(transaction, database, &incremental_key, &restored) == lmdb::MdbResult.SUCCESS);
	assert_value(restored, "restored");
	lmdb::txn_abort(transaction);
	lmdb::env_close(baseline_env);
}
