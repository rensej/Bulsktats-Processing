SELECT node.hostname as 'Hostname', SGWAR.`Current SGW Sessions ARG`, SGWPY.`Current SGW Sessions PY`, SGWUY.`Current SGW Sessions UY`  from node 
LEFT JOIN (

SELECT sgwAR.node_hostname, ROUND(MAX(`Current SGW Sessions`)) as 'Current SGW Sessions ARG' FROM (
SELECT timestamp(EMS_SGW1.`localdate`,EMS_SGW1.`localtime`) as 'timestamp',EMS_SGW1.node_hostname, EMS_SGW1.servname, 
EMS_SGW1.`sess-cur` as 'Current SGW Sessions' 
FROM mos.EMS_SGW1 
WHERE mos.EMS_SGW1.servname LIKE '%-ar'
GROUP BY EMS_SGW1.`localdate`, EMS_SGW1.`localtime`, EMS_SGW1.node_hostname, EMS_SGW1.servname) as sgwAR group by node_hostname, servname 

) AS SGWAR ON node.hostname = SGWAR.node_hostname

LEFT JOIN (

SELECT sgwPY.node_hostname, ROUND(MAX(`Current SGW Sessions`)) as 'Current SGW Sessions PY' FROM (
SELECT timestamp(EMS_SGW1.`localdate`,EMS_SGW1.`localtime`) as 'timestamp',EMS_SGW1.node_hostname, EMS_SGW1.servname, 
EMS_SGW1.`sess-cur` as 'Current SGW Sessions' 
FROM mos.EMS_SGW1 
WHERE mos.EMS_SGW1.servname LIKE '%-py' 
GROUP BY EMS_SGW1.`localdate`, EMS_SGW1.`localtime`, EMS_SGW1.node_hostname, EMS_SGW1.servname) as sgwPY group by node_hostname, servname 

) AS SGWPY ON node.hostname = SGWPY.node_hostname

LEFT JOIN (

SELECT sgwUY.node_hostname, ROUND(MAX(`Current SGW Sessions`)) as 'Current SGW Sessions UY' FROM (
SELECT timestamp(EMS_SGW1.`localdate`,EMS_SGW1.`localtime`) as 'timestamp',EMS_SGW1.node_hostname, EMS_SGW1.servname, 
EMS_SGW1.`sess-cur` as 'Current SGW Sessions' 
FROM mos.EMS_SGW1 
WHERE mos.EMS_SGW1.servname LIKE '%-uy' OR mos.EMS_SGW1.servname LIKE 'sgw-svc'
GROUP BY EMS_SGW1.`localdate`, EMS_SGW1.`localtime`, EMS_SGW1.node_hostname, EMS_SGW1.servname) as sgwUY group by node_hostname, servname 

) AS SGWUY ON node.hostname = SGWUY.node_hostname
