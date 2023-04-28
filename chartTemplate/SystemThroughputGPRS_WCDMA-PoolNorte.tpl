class=TimeChart
title=Throughput Pool Norte 2G-3G
rangeText=Mbps
width=1600
height=350
outputFile=Throughput-2G3G-PoolNorte.png
query=SELECT timestamp(EMS_PDSNSystemD.`localdate`,EMS_PDSNSystemD.`localtime`) as 'timestamp',EMS_PDSNSystemD.node_hostname, \
(((EMS_PDSNSystemD.`sess-txbytes-umts` - Sys2.`sess-rxbytes-umts`) + (EMS_PDSNSystemD.`sess-txbytes-gprs` - Sys2.`sess-rxbytes-gprs`)) + ((EMS_PDSNSystemD.`sess-rxbytes-umts` - Sys2.`sess-txbytes-umts`) + (EMS_PDSNSystemD.`sess-rxbytes-gprs` - Sys2.`sess-txbytes-gprs`)))*8/900/1024/1024 as 'Throughput umts' \
FROM mos.EMS_PDSNSystemD \
LEFT JOIN mos.EMS_PDSNSystemD AS Sys2 \
ON timestamp(EMS_PDSNSystemD.`localdate`,EMS_PDSNSystemD.`localtime` - INTERVAL EXTRACT(SECOND FROM EMS_PDSNSystemD.`localtime`) SECOND) = timestamp(Sys2.`localdate`,Sys2.`localtime` + INTERVAL 15 MINUTE - INTERVAL EXTRACT(SECOND FROM Sys2.`localtime`) SECOND) AND EMS_PDSNSystemD.node_hostname = Sys2.node_hostname \
WHERE (EMS_PDSNSystemD.node_hostname like 'ROS-%' or EMS_PDSNSystemD.node_hostname like 'COR-%') \
AND (((EMS_PDSNSystemD.`sess-txbytes-umts` - Sys2.`sess-rxbytes-umts`) + (EMS_PDSNSystemD.`sess-txbytes-gprs` - Sys2.`sess-rxbytes-gprs`)) + ((EMS_PDSNSystemD.`sess-rxbytes-umts` - Sys2.`sess-txbytes-umts`) + (EMS_PDSNSystemD.`sess-rxbytes-gprs` - Sys2.`sess-txbytes-gprs`)))*8/900/1024/1024 >= 0 \
GROUP BY EMS_PDSNSystemD.node_hostname, EMS_PDSNSystemD.`localdate`, EMS_PDSNSystemD.`localtime`;
