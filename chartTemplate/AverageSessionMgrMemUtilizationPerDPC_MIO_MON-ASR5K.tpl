class=TimeChart
title=MON-ASR5K Session Manager Average Memory Utilization (%)
rangeText=Percentage
width=1600
height=350
outputFile=AverageSessMgrMemUtilizationMON-ASR5K.png
query=select timestamp(EMS_Card2.`localdate`,EMS_Card2.`localtime`) as 'timestamp',EMS_Card2.card, \
EMS_Card2.`task-sessmgr-avgmem` from mos.EMS_Card2 \
where `node_hostname` like 'MON-ASR5K' and \
`task-sessmgr-avgcpu` > 0 and (`card` < 8 or (`card` > 9 and `card` < 17)) \
group by EMS_Card2.localdate,EMS_Card2.`localtime`,EMS_Card2.card;