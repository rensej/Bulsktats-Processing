class=TimeChart
title=ECS Total Active Sessions
rangeText=Sessions
width=1600
height=350
outputFile=ECSCurrentNumberOfSessions.png
query=SELECT timestamp(EMS_ECS3.`localdate`,EMS_ECS3.`localtime`) as 'timestamp',EMS_ECS3.node_hostname, \
EMS_ECS3.`ecs-curactive` as 'ECS Current Sessions' \
FROM mos.EMS_ECS3 \
WHERE node_hostname not like 'TOR-ASR5K5-3' \
GROUP by EMS_ECS3.localdate,EMS_ECS3.`localtime`,EMS_ECS3.node_hostname;