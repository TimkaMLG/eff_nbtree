create unlogged table y(i int) ;
create index bidx on y using btree(i) ;
insert into y select random()*100000::int as i from generate_series(1,1e7);
