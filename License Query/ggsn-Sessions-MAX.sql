SELECT node.hostname as 'Hostname', GGSNAR.`Current GTPC Sessions ARG`, GGSNPY.`Current GTPC Sessions PY`, GGSNUY.`Current GTPC Sessions UY`  from node 

LEFT JOIN (

SELECT node_hostname,  ROUND(MAX(`Current GTPC Sessions ARG`)) as 'Current GTPC Sessions ARG' FROM (
SELECT timestamp(EMS_GTPC2.`localdate`,EMS_GTPC2.`localtime`) as "timestamp",EMS_GTPC2.node_hostname, EMS_GTPC2.servname, 
EMS_GTPC2.`setup-current` as "Current GTPC Sessions ARG" 
FROM mos.EMS_GTPC2 
WHERE EMS_GTPC2.servname like '%-AR'
GROUP BY EMS_GTPC2.`localdate`, EMS_GTPC2.`localtime`, EMS_GTPC2.node_hostname, EMS_GTPC2.servname) as ggsnAr group by node_hostname

) AS GGSNAR ON node.hostname = GGSNAR.node_hostname

LEFT JOIN (

SELECT node_hostname,  ROUND(MAX(`Current GTPC Sessions PY`)) as 'Current GTPC Sessions PY' FROM (
SELECT timestamp(EMS_GTPC2.`localdate`,EMS_GTPC2.`localtime`) as "timestamp",EMS_GTPC2.node_hostname, EMS_GTPC2.servname, 
EMS_GTPC2.`setup-current` as "Current GTPC Sessions PY" 
FROM mos.EMS_GTPC2 
WHERE EMS_GTPC2.servname like '%-PY'
GROUP BY EMS_GTPC2.`localdate`, EMS_GTPC2.`localtime`, EMS_GTPC2.node_hostname, EMS_GTPC2.servname) as ggsnPy group by node_hostname

) AS GGSNPY ON node.hostname = GGSNPY.node_hostname

LEFT JOIN (

SELECT node_hostname,  ROUND(MAX(`Current GTPC Sessions UY`)) as 'Current GTPC Sessions UY' FROM (
SELECT timestamp(EMS_GTPC2.`localdate`,EMS_GTPC2.`localtime`) as "timestamp",EMS_GTPC2.node_hostname, EMS_GTPC2.servname, 
EMS_GTPC2.`setup-current` as "Current GTPC Sessions UY" 
FROM mos.EMS_GTPC2 
WHERE EMS_GTPC2.servname like '%-UY'
GROUP BY EMS_GTPC2.`localdate`, EMS_GTPC2.`localtime`, EMS_GTPC2.node_hostname, EMS_GTPC2.servname) as ggsnUy group by node_hostname

) AS GGSNUY ON node.hostname = GGSNUY.node_hostname