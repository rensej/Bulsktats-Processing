class=TimeChart
title=Sesiones 2G/3G PY
rangeText=Sessions
width=1600
height=350
outputFile=Sesiones-2G3G-PY.png
query=SELECT timestamp(EMS_PDSNSystemD.`localdate`,EMS_PDSNSystemD.`localtime`) as 'timestamp',EMS_PDSNSystemD.node_hostname, \
(`sess-total-sessions-umts` + `sess-total-sessions-gprs`) as 'Current Sessions GPRS+UMTS' \
FROM mos.EMS_PDSNSystemD \
WHERE node_hostname like 'ASU%' or node_hostname like 'JO2-ASR5K5-1' \
GROUP BY node_hostname, `localdate`, `localtime`;
