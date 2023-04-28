class=TimeChart
title=Throughput Pool Sur 4G
rangeText=Mbps
width=1600
height=350
outputFile=Throughput-4G-PoolSur.png
query=SELECT timestamp(EMS_PDSNSystemD.`localdate`,EMS_PDSNSystemD.`localtime`) as 'timestamp',EMS_PDSNSystemD.node_hostname, \
((EMS_PDSNSystemD.`sess-txbytes-lte` - Sys2.`sess-rxbytes-lte`) + (EMS_PDSNSystemD.`sess-rxbytes-lte` - Sys2.`sess-txbytes-lte`))*8/900/1024/1024 as 'Throughput LTE' \
FROM mos.EMS_PDSNSystemD \
LEFT JOIN mos.EMS_PDSNSystemD AS Sys2 \
ON timestamp(EMS_PDSNSystemD.`localdate`,EMS_PDSNSystemD.`localtime` - INTERVAL EXTRACT(SECOND FROM EMS_PDSNSystemD.`localtime`) SECOND) = timestamp(Sys2.`localdate`,Sys2.`localtime` + INTERVAL 15 MINUTE - INTERVAL EXTRACT(SECOND FROM Sys2.`localtime`) SECOND) AND EMS_PDSNSystemD.node_hostname = Sys2.node_hostname \
WHERE (EMS_PDSNSystemD.node_hostname like 'TOR-ASR5K5-1' or EMS_PDSNSystemD.node_hostname like 'TOR-ASR5K5-2' or EMS_PDSNSystemD.node_hostname like 'JO2-%' or EMS_PDSNSystemD.node_hostname like 'OLL-%') \
AND ((EMS_PDSNSystemD.`sess-txbytes-lte` - Sys2.`sess-rxbytes-lte`) + (EMS_PDSNSystemD.`sess-rxbytes-lte` - Sys2.`sess-txbytes-lte`))*8/900/1024/1024 >= 0 \
GROUP BY EMS_PDSNSystemD.node_hostname, EMS_PDSNSystemD.`localdate`, EMS_PDSNSystemD.`localtime`;
