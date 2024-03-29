class=TimeChart
title=Session Manager Average CPU Utilization (%)
rangeText=Percentage
width=1600
height=350
threshold=75
outputFile=AverageSessmgrCPUUtilizationJO2-ASR5K5-1.png
query=select timestamp(EMS_Card2.`localdate`,EMS_Card2.`localtime`) as 'timestamp',EMS_Card2.`card`, \
EMS_Card2.`task-sessmgr-avgcpu` from mos.EMS_Card2 \
where (`node_hostname` like 'JO2-ASR5K5-1' and `task-sessmgr-avgcpu` > 0 and `card` < 11) \
group by EMS_Card2.localdate,EMS_Card2.`localtime`,EMS_Card2.`card`;