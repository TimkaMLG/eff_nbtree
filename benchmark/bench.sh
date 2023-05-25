#! /bin/bash

function bench_btree() {
	pkill -9 postgres
	rm -rf test_db
	$PG/initdb test_db
	$PG/pg_ctl -D test_db start
	$PG/psql -f btree.sql postgres
	$PG/pgbench -c 10 -j 4 -T 20 -f script.sql postgres
}

function bench_effbtree() {
	pkill -9 postgres
	rm -rf test_db
	$PG/initdb test_db
	$PG/pg_ctl -D test_db start
	$PG/psql -f effbtree.sql postgres
	$PG/pgbench -c 10 -j 4 -T 20 -f script.sql postgres
}

PG=bin bench_effbtree
PG=bin bench_btree
PG=bin bench_effbtree
PG=bin bench_btree
PG=bin bench_effbtree
PG=bin bench_btree
PG=bin bench_effbtree
PG=bin bench_btree
PG=bin bench_effbtree
PG=bin bench_btree
