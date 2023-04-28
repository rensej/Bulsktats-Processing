class=TimeChart
title=MIO, PSC and CF Memory Utilization (%)
rangeText=Percentage
width=1200
height=800
thresshold=75
outputFile=ControlMemoryUtilization.png
query=select timestamp(EMS_Card.`localdate`,EMS_Card.`localtime`) as 'timestamp',concat_ws('-',EMS_Card.node_hostname, EMS_Card.card), (EMS_Card.`memused`)/(EMS_Card.`memtotal`)*100 as 'Aggregate_CPU Memory Usage %' from mos.EMS_Card where (`node_hostname` like '%VPC%' and `card` < 3) group by EMS_Card.localdate,EMS_Card.`localtime`,EMS_Card.node_hostname, EMS_Card.card union \
select timestamp(EMS_Card.`localdate`,EMS_Card.`localtime`) as 'timestamp',concat_ws('-',EMS_Card.node_hostname, EMS_Card.card), (EMS_Card.`memused`)/(EMS_Card.`memtotal`)*100 as 'Aggregate_CPU Memory Usage %' from mos.EMS_Card where (`node_hostname` like '%ASR5K5%' and `card` > 4 and `card` < 7 ) group by EMS_Card.localdate,EMS_Card.`localtime`,EMS_Card.node_hostname, EMS_Card.card union \
select timestamp(EMS_Card.`localdate`,EMS_Card.`localtime`) as 'timestamp',concat_ws('-',EMS_Card.node_hostname, EMS_Card.card), (EMS_Card.`memused`)/(EMS_Card.`memtotal`)*100 as 'Aggregate_CPU Memory Usage %' from mos.EMS_Card where (`node_hostname` like '%ASR5K-%' and `card` > 7 and `card` < 10) group by EMS_Card.localdate,EMS_Card.`localtime`,EMS_Card.node_hostname, EMS_Card.card;