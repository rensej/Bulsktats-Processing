class=BarChart
title= Max Port Utilization Rx (%)
rangeText=Percentage
width=918
height=300
thresshold=70
outputFile=MaxPortUtilizationRx.png
query=SELECT MAX(EMS_Port.`util-rx-curr`/10000)*100 AS 'Port Utilization Receive %', '', EMS_Port.node_hostname \
FROM mos.EMS_Port  \
WHERE EMS_Port.`util-rx-curr` > 0 AND (EMS_Port.node_hostname LIKE '%ASR5K%' AND maxrate > 1000000000 AND rxbytes > 0 AND EMS_Port.card <> 6) group by EMS_Port.node_hostname  union \
SELECT MAX(EMS_Port.`util-rx-curr`/10000)*100 as 'Port Utilization Receive %' , '', EMS_Port.node_hostname \
FROM mos.EMS_Port  \
WHERE EMS_Port.`util-rx-curr` > 0 and (EMS_Port.node_hostname like 'GRY-VPC-1' OR EMS_Port.node_hostname LIKE 'TOR-VPC-1') AND rxbytes > 0 group by EMS_Port.node_hostname union \
SELECT MAX(EMS_Port.`util-rx-curr`/40000)*100 as 'Port Utilization Receive %' , '', EMS_Port.node_hostname \
FROM mos.EMS_Port  \
WHERE EMS_Port.`util-rx-curr` > 0 and (EMS_Port.node_hostname like 'OLL-VPC-1' or EMS_Port.node_hostname like 'COR-VPC-1') AND rxbytes > 0 group by EMS_Port.node_hostname;