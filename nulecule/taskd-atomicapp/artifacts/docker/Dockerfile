FROM fedora

RUN dnf install -y taskd which

RUN mkdir /taskdata
RUN mkdir /opt/taskd-docker
RUN mkdir /opt/taskd-docker/logs
ADD config.sh /opt/taskd-docker/
ADD start.sh /opt/taskd-docker/
RUN chown -R taskd:taskd /opt/taskd-docker
RUN chown -R taskd:taskd /taskdata
RUN chmod -R u+x /opt/taskd-docker/*sh

ENV TASKDDATA /taskdata 
VOLUME /taskdata
EXPOSE 53589

USER taskd

CMD /opt/taskd-docker/start.sh