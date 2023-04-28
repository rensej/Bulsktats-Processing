class=TimeChart
title=Call Events Per Second Network Wide
rangeText=Sessions
width=918
height=250
outputFile=CEPSCallEvents.png
query=SELECT TIMESTAMP(EMS_PDSNSystem.`localdate`,EMS_PDSNSystem.`localtime`) as 'timestamp',EMS_PDSNSystem.node_hostname, ROUND((((EMS_PDSNSystem.`sess-ttlarrived` - Sys2.`sess-ttlarrived`) + (EMS_PDSNSystem.`sess-ttldisconn` - Sys2.`sess-ttldisconn`))/900),2) as 'CEPS Call Events Per Second' \
FROM mos.EMS_PDSNSystem \
LEFT JOIN mos.EMS_PDSNSystem AS Sys2 \
ON timestamp(EMS_PDSNSystem.`localdate`,EMS_PDSNSystem.`localtime` - INTERVAL EXTRACT(SECOND FROM EMS_PDSNSystem.`localtime`) SECOND) = timestamp(Sys2.`localdate`,Sys2.`localtime` + INTERVAL 15 MINUTE - INTERVAL EXTRACT(SECOND FROM Sys2.`localtime`) SECOND) \
WHERE ROUND((((EMS_PDSNSystem.`sess-ttlarrived` - Sys2.`sess-ttlarrived`) + (EMS_PDSNSystem.`sess-ttldisconn` - Sys2.`sess-ttldisconn`))/900),2) >= 0 \
GROUP BY EMS_PDSNSystem.localdate,EMS_PDSNSystem.`localtime`,EMS_PDSNSystem.node_hostname;