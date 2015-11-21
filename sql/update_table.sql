UPDATE pbn n
set notraffic = w."no trucks"
from weight w
where n."OBJECTID" = w."OBJECTID"