create extension eff_nbtree ;
create unlogged table y(i int) ;
create index effidx on y using eff_nbtree(i) ;
insert into y select random()*100000::int as i from generate_series(1,1e7);
