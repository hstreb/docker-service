FROM jenkins

ENV JAVA_OPTS="-Xmx1g"

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt