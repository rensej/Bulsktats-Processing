class=TimeChart
title=Aggregate CPU Memory Utilization (%)
rangeText=Percentage
width=918
height=191
thresshold=75
outputFile=AggregateCPUMemoryUtilizationEPDG.png
query=select timestamp(EMS_Card.`localdate`,EMS_Card.`localtime`) as 'timestamp',EMS_Card.node_hostname, \
ROUND(AVG((EMS_Card.`cpu0-memused` + EMS_Card.`cpu1-memused`)/(EMS_Card.`cpu0-memtotal` + EMS_Card.`cpu1-memtotal`))*100,2) as 'Aggregate_CPU Memory Usage %' \
from mos.EMS_Card \
where ((`node_hostname` like 'TOR-ASR5K5-1' or `node_hostname` like 'TOR-ASR5K5-3') and `task-sessmgr-num` > 0 and (`card` < 5 or (`card` > 6 and `card` < 11))) \
group by EMS_Card.localdate,EMS_Card.`localtime`,EMS_Card.node_hostname;