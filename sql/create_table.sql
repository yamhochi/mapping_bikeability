create table twogeom2 as
SELECT id, path, ST_AsText(geom) as the_geom, geom FROM two;