class=TimeChart
title=Aggregate CPU Memory Utilization (%)
rangeText=Percentage
width=1600
height=350
threshold=75
outputFile=AggregateCPUMemoryUtilization.png
query=select timestamp(EMS_Card.`localdate`,EMS_Card.`localtime`) as 'timestamp',EMS_Card.node_hostname, \
ROUND(AVG((EMS_Card.`cpu0-memused`)/(EMS_Card.`cpu0-memtotal`))*100,2) as 'Aggregate_CPU Memory Usage %' \
from mos.EMS_Card \
where (`node_hostname` like '%VPC%' and `task-sessmgr-num` > 0) \
group by EMS_Card.localdate,EMS_Card.`localtime`,EMS_Card.node_hostname union \
select timestamp(EMS_Card.`localdate`,EMS_Card.`localtime`) as 'timestamp',EMS_Card.node_hostname, \
ROUND(AVG((EMS_Card.`cpu0-memused` + EMS_Card.`cpu1-memused`)/(EMS_Card.`cpu0-memtotal` + EMS_Card.`cpu1-memtotal`))*100,2) as 'Aggregate_CPU Memory Usage %' \
from mos.EMS_Card \
where (`node_hostname` like '%ASR5K5%' and `task-sessmgr-num` > 0 and (`card` < 5 or (`card` > 6 and `card` < 11))) \
group by EMS_Card.localdate,EMS_Card.`localtime`,EMS_Card.node_hostname union \
select timestamp(EMS_Card.`localdate`,EMS_Card.`localtime`) as 'timestamp',EMS_Card.node_hostname, \
ROUND(AVG((EMS_Card.`cpu0-memused`)/(EMS_Card.`cpu0-memtotal`))*100,2) as 'Aggregate_CPU Memory Usage %' \
from mos.EMS_Card \
where ((`node_hostname` like '%ASR5K-%' or `node_hostname` like 'MON-ASR5k') and `task-sessmgr-num` > 0 and (`card` < 8 or (`card` > 9 and `card` < 17))) \
group by EMS_Card.localdate,EMS_Card.`localtime`,EMS_Card.node_hostname;