class=TimeChart
title=Current Number of Sessions on the Whole System
rangeText=Sessions
width=1600
height=350
outputFile=CurrentNumberOfSessions.png
query=select timestamp(EMS_PDSNSystem.`localdate`,EMS_PDSNSystem.`localtime`) as 'timestamp',EMS_PDSNSystem.node_hostname, EMS_PDSNSystem.`sess-curttlcalls` as 'Current Sessions' \
from mos.EMS_PDSNSystem;