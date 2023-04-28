class=TimeChart
title=TOR-ASR5K5-2 Session Manager Average Memory Utilization (%)
rangeText=Percentage
width=1600
height=350
outputFile=AverageSessMgrMemUtilizationTOR-ASR5K5-2.png
query=select timestamp(EMS_Card2.`localdate`,EMS_Card2.`localtime`) as 'timestamp',EMS_Card2.`card`, EMS_Card2.`task-sessmgr-avgmem` from mos.EMS_Card2 where `node_hostname` like 'TOR-ASR5K5-2%' and `task-sessmgr-avgcpu` > 0 and `card` < 11 group by EMS_Card2.localdate,EMS_Card2.`localtime`,EMS_Card2.`card`;