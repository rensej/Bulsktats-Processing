class=TimeChart
title=ASU-ASR5k5-1 Aggregate CPU Utilization Per DPC/MIO (%)
rangeText=Percentage
width=918
height=191
thresshold=75
outputFile=AggregateCPUUtilizationASU-ASR5K-1.png
query=select timestamp(EMS_Card.`localdate`,EMS_Card.`localtime`) as 'timestamp',EMS_Card.`card`, ROUND(AVG((EMS_Card.`cpu0-cpubusy`)),2) as 'CPU Load Busy' \
from mos.EMS_Card \
where (`node_hostname` like 'ASU-ASR5K5-1' and `card` < 11) \
group by EMS_Card.localdate,EMS_Card.`localtime`,EMS_Card.`card`;