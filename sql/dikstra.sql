UPDATE pbn SET x1 = ST_x(ST_startpoint(geom));
UPDATE pbn SET y1 = ST_y(ST_startpoint(geom));

UPDATE pbn SET x2 = ST_x(ST_endpoint(geom));
UPDATE pbn SET y2 = ST_y(ST_endpoint(geom));


