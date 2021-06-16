SELECT node.hostname as 'Hostname', PGWAR.`Current PGW Sessions ARG`, PGWPY.`Current PGW Sessions PY`, PGWUY.`Current PGW Sessions UY`  from node 
LEFT JOIN (

SELECT pgwAR.node_hostname, ROUND((`Current PGW Sessions`)) as 'Current PGW Sessions ARG' FROM (
SELECT timestamp(EMS_PGW1.`localdate`,EMS_PGW1.`localtime`) as 'timestamp',EMS_PGW1.node_hostname, EMS_PGW1.servname, 
EMS_PGW1.`sess-cur` as 'Current PGW Sessions' 
FROM mos.EMS_PGW1 
WHERE mos.EMS_PGW1.servname LIKE '%-ar'
GROUP BY EMS_PGW1.`localdate`, EMS_PGW1.`localtime`, EMS_PGW1.node_hostname, EMS_PGW1.servname) as pgwAR group by node_hostname, servname 

) AS PGWAR ON node.hostname = PGWAR.node_hostname

LEFT JOIN (

SELECT pgwPY.node_hostname, ROUND((`Current PGW Sessions`)) as 'Current PGW Sessions PY' FROM (
SELECT timestamp(EMS_PGW1.`localdate`,EMS_PGW1.`localtime`) as 'timestamp',EMS_PGW1.node_hostname, EMS_PGW1.servname, 
EMS_PGW1.`sess-cur` as 'Current PGW Sessions' 
FROM mos.EMS_PGW1 
WHERE mos.EMS_PGW1.servname LIKE '%-py' 
GROUP BY EMS_PGW1.`localdate`, EMS_PGW1.`localtime`, EMS_PGW1.node_hostname, EMS_PGW1.servname) as pgwPY group by node_hostname, servname 

) AS PGWPY ON node.hostname = PGWPY.node_hostname

LEFT JOIN (

SELECT pgwUY.node_hostname, ROUND((`Current PGW Sessions`)) as 'Current PGW Sessions UY' FROM (
SELECT timestamp(EMS_PGW1.`localdate`,EMS_PGW1.`localtime`) as 'timestamp',EMS_PGW1.node_hostname, EMS_PGW1.servname, 
EMS_PGW1.`sess-cur` as 'Current PGW Sessions' 
FROM mos.EMS_PGW1 
WHERE mos.EMS_PGW1.servname LIKE '%-uy' OR mos.EMS_PGW1.servname LIKE 'pgw-svc'
GROUP BY EMS_PGW1.`localdate`, EMS_PGW1.`localtime`, EMS_PGW1.node_hostname, EMS_PGW1.servname) as pgwUY group by node_hostname, servname 

) AS PGWUY ON node.hostname = PGWUY.node_hostname
