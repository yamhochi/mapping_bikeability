﻿alter table pbn4 add column source integer;
alter table pbn4 add column target integer;
select pgr_createTopology('pbn4', 10, 'geom', 'id');