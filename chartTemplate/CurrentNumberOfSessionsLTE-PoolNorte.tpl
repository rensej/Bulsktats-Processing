class=TimeChart
title=Sesiones LTE Pool Norte
rangeText=Sessions
width=1600
height=350
outputFile=Sesiones-4G-PoolNorte.png
query=select timestamp(EMS_PDSNSystemD.`localdate`,EMS_PDSNSystemD.`localtime`) as 'timestamp',EMS_PDSNSystemD.node_hostname, \
(`sess-total-sessions-lte`) as 'Current Sessions LTE' \
from mos.EMS_PDSNSystemD \
where node_hostname like 'ROS-%' or node_hostname like 'COR-%' \
group by node_hostname, `localdate`, `localtime`;
