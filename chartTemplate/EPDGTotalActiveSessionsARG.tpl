class=TimeChart
title=EPDG Total Active Sessions ARG
rangeText=Sessions
width=1600
height=350
outputFile=EPDGCurrentNumberOfSessionsARG.png
query=SELECT timestamp(EMS_epdg_epdgSch1.`localdate`,EMS_epdg_epdgSch1.`localtime`) as 'timestamp',EMS_epdg_epdgSch1.node_hostname, \
EMS_epdg_epdgSch1.`cursess` as 'EPDG Current Sessions ARG' \
FROM mos.EMS_epdg_epdgSch1 \
WHERE servname like 'epdg_svc' \
GROUP by EMS_epdg_epdgSch1.localdate,EMS_epdg_epdgSch1.`localtime`,EMS_epdg_epdgSch1.node_hostname,EMS_epdg_epdgSch1.servname;