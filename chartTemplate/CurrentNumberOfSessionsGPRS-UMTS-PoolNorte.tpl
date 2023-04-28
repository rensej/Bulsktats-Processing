class=TimeChart
title=Sesiones 2G/3G Pool Norte
rangeText=Sessions
width=1600
height=350
outputFile=Sesiones-2G3G-PoolNorte.png
query=select timestamp(EMS_PDSNSystemD.`localdate`,EMS_PDSNSystemD.`localtime`) as 'timestamp',EMS_PDSNSystemD.node_hostname, \
(`sess-total-sessions-umts` + `sess-total-sessions-gprs`) as 'Current Sessions GPRS+UMTS' \
from mos.EMS_PDSNSystemD \
where node_hostname like 'ROS-%' or node_hostname like 'COR-%' \
group by node_hostname, `localdate`, `localtime`;
