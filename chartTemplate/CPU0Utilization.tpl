class=TimeChart
title=CPU0 Utilization (%)
rangeText=Percentage
width=834
height=191
threshold=75
outputFile=CPU0Utilization.png
query=select timestamp(EMS_Card.`localdate`,EMS_Card.`localtime`) as 'timestamp',EMS_Card.node_hostname, ROUND(AVG(EMS_Card.`cpu0-cpubusy`),2) as 'CPU Load Busy' \
from mos.EMS_Card \
where (`node_hostname` like '%VPC%' and `task-sessmgr-num` > 0) \
group by EMS_Card.localdate,EMS_Card.`localtime`,EMS_Card.node_hostname union \
select timestamp(EMS_Card.`localdate`,EMS_Card.`localtime`) as 'timestamp',EMS_Card.node_hostname, ROUND(AVG(EMS_Card.`cpu0-cpubusy`),2) as 'CPU Load Busy' \
from mos.EMS_Card \
where (`node_hostname` like '%ASR5K5%' and `task-sessmgr-num` > 0 and (`card` < 5 or (`card` > 6 and `card` < 11))) \
group by EMS_Card.localdate,EMS_Card.`localtime`,EMS_Card.node_hostname union \
select timestamp(EMS_Card.`localdate`,EMS_Card.`localtime`) as 'timestamp',EMS_Card.node_hostname, ROUND(AVG(EMS_Card.`cpu0-cpubusy`),2) as 'CPU Load Busy' \
from mos.EMS_Card \
where (`node_hostname` like '%ASR5K-%' and `task-sessmgr-num` > 0 and (`card` < 8 or (`card` > 9 and `card` < 17))) \
group by EMS_Card.localdate,EMS_Card.`localtime`,EMS_Card.node_hostname;