# LMDB

C3 bindings for **LMDB**, the Lightning Memory-Mapped Database — a compact,
transactional, memory-mapped key/value store from the OpenLDAP project.

http://www.lmdb.tech/doc/

## Version

These bindings target the **LMDB 1.0.x** API (`LMDB_1.0.1`, Aug 6 2026), not the
older 0.9 series. This matters when linking against a system library:

| Platform | Notes |
| --- | --- |
| Linux, macOS, Windows | A static LMDB 1.0.1 is built and shipped by CI — nothing to install. |
| FreeBSD | `pkg install lmdb` (the main ports tree is 1.0.1). Do **not** use `lmdb0`, which is the 0.9 legacy ABI, and note that the *quarterly* branch is still on 0.9.x. |
| OpenBSD | Ports only carries 0.9.x; build LMDB 1.0 from source until that catches up. |

LMDB 1.0 changed the on-disk format and added API that does not exist in 0.9
(`mdb_env_incr_dump`, `mdb_env_set_encrypt`, `mdb_txn_prepare`,
`mdb_env_rollback`, `mdb_cursor_is_db`, the crypto module hooks, and every error
code below `MDB_PROBLEM`). Linking these bindings against a 0.9 library will fail
with undefined symbols as soon as any of that is used. Databases are not
interchangeable between the two series.

## Naming

This is a direct binding. The `mdb_` prefix moves into the module name, so
`mdb_env_open` becomes `lmdb::env_open`. Types keep their shape with a `Mdb`
prefix: `MDB_val` is `lmdb::MdbVal`, `MDB_stat` is `lmdb::MdbStat`. Flag sets are
`constset`s (`MdbEnvFlags`, `MdbTxnFlags`, `MdbDbiFlags`, `MdbWriteFlags`,
`MdbCopyFlags`) and return codes are `MdbResult`.

## Example

```c3
import lmdb;

fn void main()
{
	lmdb::MdbEnv env;
	lmdb::env_create(&env);
	defer lmdb::env_close(env);
	lmdb::env_set_mapsize(env, 1024 * 1024);
	lmdb::env_open(env, "./mydb", lmdb::MdbEnvFlags.NOSUBDIR, 0o600);

	lmdb::MdbTxn txn;
	lmdb::MdbDbi dbi;
	lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.NONE, &txn);
	lmdb::dbi_open(txn, null, lmdb::MdbDbiFlags.NONE, &dbi);

	lmdb::MdbVal key = "greeting".to_mdbval();
	lmdb::MdbVal data = "hello world".to_mdbval();
	lmdb::put(txn, dbi, &key, &data, lmdb::MdbWriteFlags.NONE);
	lmdb::txn_commit(txn);

	lmdb::txn_begin(env, null, lmdb::MdbTxnFlags.RDONLY, &txn);
	lmdb::MdbVal found = {};
	if (lmdb::get(txn, dbi, &key, &found) == lmdb::MdbResult.SUCCESS)
	{
		io::printfn("%s", ((char*)found.data)[:found.size]);
	}
	lmdb::txn_abort(txn);
}
```

## Notes

* Values returned by `get` and `cursor_get` point directly into the memory map.
  They are only valid until the transaction ends or the key is written again —
  copy them out if you need to keep them.
* A write transaction must be closed with `txn_commit` or `txn_abort`; leaving
  one open blocks every other writer on the environment.
* `env_set_mapsize` sets the maximum size the database can grow to, not an
  initial allocation. Exceeding it returns `MdbResult.MAP_FULL`.
* `dbi_open` with a non-null name requires `env_set_maxdbs` to have been called
  before `env_open`.
