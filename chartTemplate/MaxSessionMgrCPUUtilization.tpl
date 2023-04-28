class=TimeChart
title=Session Manager Maximum CPU Utilization (%)
rangeText=Percentage
width=1600
height=350
threshold=75
outputFile=MaxSessmgrCPUUtilization.png
query=select timestamp(EMS_Card2.`localdate`,EMS_Card2.`localtime`) as 'timestamp',EMS_Card2.node_hostname, EMS_Card2.`task-sessmgr-maxcpu` \
from mos.EMS_Card2 \
where (`node_hostname` like '%VPC%' and `task-sessmgr-avgcpu` > 0) \
group by EMS_Card2.localdate,EMS_Card2.`localtime`,EMS_Card2.node_hostname union \
select timestamp(EMS_Card2.`localdate`,EMS_Card2.`localtime`) as 'timestamp',EMS_Card2.node_hostname, EMS_Card2.`task-sessmgr-maxcpu` \
from mos.EMS_Card2 \
where (`node_hostname` like '%ASR5K5%' and `task-sessmgr-avgcpu` > 0 and (`card` < 5 or (`card` > 6 and `card` < 11))) \
group by EMS_Card2.localdate,EMS_Card2.`localtime`,EMS_Card2.node_hostname union \
select timestamp(EMS_Card2.`localdate`,EMS_Card2.`localtime`) as 'timestamp',EMS_Card2.node_hostname, EMS_Card2.`task-sessmgr-maxcpu` \
from mos.EMS_Card2 \
where (`node_hostname` like '%ASR5K-%' and `task-sessmgr-avgcpu` > 0 and (`card` < 8 or (`card` > 9 and `card` < 17))) \
group by EMS_Card2.localdate,EMS_Card2.`localtime`,EMS_Card2.node_hostname;