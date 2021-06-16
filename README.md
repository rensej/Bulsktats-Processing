# Bulsktats-Processing
Bulsktats Processor, mysql/containerized/java based

to run this container from build image:

docker run --name [container name] -dtp [published port]:3306  --mount type=bind,src=[binded volume],dst=/binded [image name]

within the container the alias "bulks" was created to run the application.

# Files description
- BulkstatStatistics_documentation.csv: KPI Reference file, used to obtain vartype from counter name.
- running.properties: properties file containing inintial var values (can be edited before each command execution).
- config-file.cnf: initial setings for mysql DB.
- StarOS_CounterProcessing.jar: java application.
- lib: libraries used by java application.
