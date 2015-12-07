FROM hearstat/alpine-tomcat:7.0.65
MAINTAINER Hearst Automation Team <atat@hearst.com>

LABEL version 3.9

ENV version 3.9
ENV CATALINA_HOME /opt/tomcat
ENV GITBUCKET_HOME /opt/gitbucket

USER root
RUN apk update
RUN apk add \
    git \
    tar \
    && rm -rf /var/cache/apk/*

USER tomcat
# Create gitbucket home and associated folders
RUN mkdir -p ${GITBUCKET_HOME}/plugins

# Pull version of gitbucket listed above
ADD https://github.com/gitbucket/gitbucket/releases/download/${version}/gitbucket.war ${CATALINA_HOME}/webapps/ROOT.war

USER root
RUN chmod 755 ${CATALINA_HOME}/webapps/ROOT.war

USER tomcat

# Expose Gitbucket home and set as working directory
RUN chown -R tomcat:tomcat $GITBUCKET_HOME
RUN chmod -R 775 $GITBUCKET_HOME

VOLUME $GITBUCKET_HOME
VOLUME $GITBUCKET_HOME/plugins
WORKDIR $GITBUCKET_HOME

# Expose the tomcat and ssh port needed for Gitbucket
EXPOSE 8080
EXPOSE 29418

CMD [ "/opt/tomcat/bin/catalina.sh", "run" ]
