class=TimeChart
title=Aggregate CPU Utilization Per DPC/MIO (%)
rangeText=Percentage
width=1600
height=350
thresshold=75
outputFile=AggregateCPUUtilizationJO2-ASR5K-1.png
query=select timestamp(EMS_Card.`localdate`,EMS_Card.`localtime`) as 'timestamp',EMS_Card.`card`, ROUND(AVG((EMS_Card.`cpu0-cpubusy`)),2) as 'CPU Load Busy' \
from mos.EMS_Card \
where (`node_hostname` like 'JO2-ASR5K5-1' and `card` < 11) \
group by EMS_Card.localdate,EMS_Card.`localtime`,EMS_Card.`card`;