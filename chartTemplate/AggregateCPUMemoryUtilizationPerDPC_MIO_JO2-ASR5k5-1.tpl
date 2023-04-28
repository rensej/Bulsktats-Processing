class=TimeChart
title=JO2-ASR5K5-1 Aggregate CPU Memory Utilization Per DPC/MIO Card (%)
rangeText=Percentage
width=1600
height=350
threshold=75
outputFile=AggregateCPUMemoryUtilizationJO2-ASR5K5-1.png
query=select timestamp(EMS_Card.`localdate`,EMS_Card.`localtime`) as 'timestamp',EMS_Card.`card`, \
ROUND(AVG((EMS_Card.`cpu0-memused` + EMS_Card.`cpu1-memused`)/(EMS_Card.`cpu0-memtotal` + EMS_Card.`cpu1-memtotal`))*100,2) as 'Aggregate_CPU Memory Usage %' \
from mos.EMS_Card \
where (`node_hostname` like 'JO2-ASR5K5-1' and `card` < 11) \
group by EMS_Card.localdate,EMS_Card.`localtime`,EMS_Card.`node_hostname`,EMS_Card.`card`;