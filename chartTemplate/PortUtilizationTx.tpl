class=TimeChart
title=Port Utilization Tx (%)
rangeText=Percentage
width=918
height=191
thresshold=70
outputFile=PortUtilizationTx.png
query=SELECT timestamp(EMS_Port.`localdate`,EMS_Port.`localtime`) AS 'timestamp', EMS_Port.node_hostname, ROUND(AVG(EMS_Port.`util-rx-curr`/10000)*100,2) AS 'Port Utilization Transmit %' \
FROM mos.EMS_Port \
WHERE EMS_Port.`util-tx-curr` > 0 AND (EMS_Port.node_hostname LIKE '%ASR5K%' AND maxrate > 1000000000 AND rxbytes > 0 AND EMS_Port.card <> 6) group by EMS_Port.localdate,EMS_Port.`localtime`,EMS_Port.node_hostname  union \
SELECT timestamp(EMS_Port.`localdate`,EMS_Port.`localtime`) as 'timestamp', EMS_Port.node_hostname, ROUND(AVG(EMS_Port.`util-rx-curr`/10000)*100,2) as 'Port Utilization Transmit %' \
FROM mos.EMS_Port \
WHERE EMS_Port.`util-tx-curr` > 0 and (EMS_Port.node_hostname like 'GRY-VPC-1' OR EMS_Port.node_hostname LIKE 'TOR-VPC-1') AND rxbytes > 0 group by EMS_Port.localdate,EMS_Port.`localtime`,EMS_Port.node_hostname union \
SELECT timestamp(EMS_Port.`localdate`,EMS_Port.`localtime`) as 'timestamp', EMS_Port.node_hostname, ROUND(AVG(EMS_Port.`util-rx-curr`/40000)*100,2) as 'Port Utilization Transmit %' \
FROM mos.EMS_Port \
WHERE EMS_Port.`util-tx-curr` > 0 and (EMS_Port.node_hostname like 'OLL-VPC-1' or EMS_Port.node_hostname like 'COR-VPC-1') AND rxbytes > 0 group by EMS_Port.localdate,EMS_Port.`localtime`,EMS_Port.node_hostname;