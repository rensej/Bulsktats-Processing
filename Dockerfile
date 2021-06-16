#Build Docker Bulkstat Processor Image
FROM mysql:8.0.25
EXPOSE 3306
ENV MYSQL_ROOT_PASSWORD="ciscomos"

#App Folder
ARG appFolder=/BS

RUN mkdir $appFolder

#Update and install JRE
RUN mkdir /usr/share/man/man1/ && apt-get update && apt-get install -y default-jre vim

#Copy application files
COPY StarOS_CounterProcessing.jar $appFolder
RUN mkdir $appFolder/lib
COPY lib $appFolder/lib

COPY BulkstatStatistics_documentation.csv $appFolder
COPY running.properties $appFolder

RUN echo alias bulks=\'java -jar /BS/StarOS_CounterProcessing.jar\' >> ~/.bashrc

#MySQL database configuration
COPY config-file.cnf /etc/mysql/conf.d/
RUN chmod 0444 /etc/mysql/conf.d/config-file.cnf

WORKDIR $appFolder