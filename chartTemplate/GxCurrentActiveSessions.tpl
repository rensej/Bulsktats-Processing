class=BarChart
title=Total Active Gx Sessions
rangeText=Sessions
width=1600
height=350
outputFile=GxTotalActiveSessions.png
query=SELECT SUM(`dpca-cursess`) AS 'Gx Sessions', '', EMS_PDSNSystemC.node_hostname \
FROM mos.EMS_PDSNSystemC \
WHERE (node_hostname not like 'TOR-ASR5K5-3' and node_hostname not like 'GRY%') \
GROUP BY node_hostname ORDER BY SUM(`dpca-cursess`) DESC ;