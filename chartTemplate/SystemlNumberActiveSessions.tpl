class=TimeChart
title=System - Total Active Sessions
rangeText=Sessions
width=1600
height=350
outputFile=SystemTotalActiveNumberOfSessions.png
query=select timestamp(EMS_PDSNSystem.`localdate`,EMS_PDSNSystem.`localtime`) as 'timestamp',EMS_PDSNSystem.node_hostname, \
EMS_PDSNSystem.`sess-curttlcalls` as 'Current Sessions' \
from mos.EMS_PDSNSystem \
WHERE node_hostname not like 'TOR-ASR5K5-3' \
group by EMS_PDSNSystem.localdate,EMS_PDSNSystem.`localtime`,EMS_PDSNSystem.node_hostname;