class=TimeChart
title=Sesiones LTE Pool Sur
rangeText=Sessions
width=1600
height=350
outputFile=Sesiones-4G-PoolSur.png
query=select timestamp(EMS_PDSNSystemD.`localdate`,EMS_PDSNSystemD.`localtime`) as 'timestamp',EMS_PDSNSystemD.node_hostname, \
(`sess-total-sessions-lte`) as 'Current Sessions LTE' \
from mos.EMS_PDSNSystemD \
where (EMS_PDSNSystemD.node_hostname like 'TOR-ASR5K5-1' or EMS_PDSNSystemD.node_hostname like 'TOR-ASR5K5-2' or EMS_PDSNSystemD.node_hostname like 'JO2-%' or EMS_PDSNSystemD.node_hostname like 'OLL-%') \
group by node_hostname, `localdate`, `localtime`;
