class=TimeChart
title=TOR-ASR5K5-2 Aggregate CPU Utilization Per DPC/MIO (%)
rangeText=Percentage
width=1600
height=350
thresshold=75
outputFile=AggregateCPUUtilizationTOR-ASR5K5-2.png
query=select timestamp(EMS_Card.`localdate`,EMS_Card.`localtime`) as 'timestamp',EMS_Card.`card`, ROUND(AVG((EMS_Card.`cpu0-cpubusy`)),2) as 'CPU Load Busy' \
from mos.EMS_Card \
where (`node_hostname` like 'TOR-ASR5K5-2' and `card` < 11) \
group by EMS_Card.localdate,EMS_Card.`localtime`,EMS_Card.`card`;