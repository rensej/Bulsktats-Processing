class=TimeChart
title=Port Utilization Rx (%)
rangeText=Percentage
width=918
height=191
thresshold=70
outputFile=PortUtilizationRxEPDG.png
query=SELECT timestamp(EMS_Port.`localdate`,EMS_Port.`localtime`) AS 'timestamp', EMS_Port.node_hostname, ROUND(AVG(EMS_Port.`util-tx-curr`/10000)*100,2) AS 'Port Utilization Transmit %' \
FROM mos.EMS_Port  \
WHERE EMS_Port.`util-tx-curr` > 0 \
AND ((EMS_Port.node_hostname LIKE 'TOR-ASR5K5-1' OR EMS_Port.node_hostname LIKE 'TOR-ASR5K5-3') \
AND maxrate > 1000000000 AND rxbytes > 0 AND EMS_Port.card <> 6) \
group by EMS_Port.localdate,EMS_Port.`localtime`,EMS_Port.node_hostname;