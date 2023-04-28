class=TimeChart
title=Sesiones LTE PY
rangeText=Sessions
width=1600
height=350
outputFile=Sesiones-4G-PY.png
query=SELECT timestamp(EMS_EGTPC1.`localdate`,EMS_EGTPC1.`localtime`) as 'timestamp',EMS_EGTPC1.node_hostname, \
(`sess-cur`) as 'Current Sessions LTE' \
FROM mos.EMS_EGTPC1 \
WHERE (node_hostname like 'ASU%' or node_hostname like 'JO2-ASR5K5-1') and servname like 'gtpc-pgw-py' \
GROUP BY node_hostname, `localdate`, `localtime`;
