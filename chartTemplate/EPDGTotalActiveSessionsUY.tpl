class=TimeChart
title=EPDG Total Active Sessions UY
rangeText=Sessions
width=1600
height=350
outputFile=EPDGCurrentNumberOfSessionsUY.png
query=SELECT timestamp(EMS_epdg_epdgSch1.`localdate`,EMS_epdg_epdgSch1.`localtime`) as 'timestamp',EMS_epdg_epdgSch1.node_hostname, \
EMS_epdg_epdgSch1.`cursess` as 'EPDG Current Sessions UY' \
FROM mos.EMS_epdg_epdgSch1 \
WHERE servname like 'epdg_svc_uy' \
GROUP by EMS_epdg_epdgSch1.localdate,EMS_epdg_epdgSch1.`localtime`,EMS_epdg_epdgSch1.node_hostname,EMS_epdg_epdgSch1.servname;