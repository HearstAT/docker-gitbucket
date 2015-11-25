FROM hearstat/alpine-tomcat:7.0.8
MAINTAINER Hearst Automation Team <atat@hearst.com>

LABEL version 3.8

ENV version 3.8
ENV CATALINA_HOME /opt/tomcat
ENV GITBUCKET_HOME /opt/gitbucket

# Create gitbucket home and associated folders
RUN mkdir -p ${GITBUCKET_HOME}/plugins

# Pull version of gitbucket listed above
ADD https://github.com/gitbucket/gitbucket/releases/download/${version}/gitbucket.war ${CATALINA_HOME}/webapps/gitbucket.war
RUN chmod 755 ${CATALINA_HOME}/webapps/gitbucket.war

# Expose Gitbucket home and set as working directory
VOLUME $GITBUCKET_HOME
VOLUME $GITBUCKET_HOME/plugins
WORKDIR $GITBUCKET_HOME

# Expose the tomcat and ssh port needed for Gitbucket
EXPOSE 8080
EXPOSE 29418

CMD [ "/opt/tomcat/bin/catalina.sh", "run" ]
