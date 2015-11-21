create table test as
SELECT path, st_linemerge(st_union(geom)) as geom
FROM del_dup
group by path

