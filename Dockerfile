FROM python:3.6-stretch
ADD requirements.txt requirements.txt
RUN apt-get update && apt-get install -y git nano
RUN pip3 install -r requirements.txt
ARG GIT_USERNAME
ARG GIT_PASSWORD
RUN git clone https://${GIT_USERNAME}:${GIT_PASSWORD}@gitlab.com/hendrapm99/celery_addons.git /home/.
ADD config/default /etc/default
ADD config/init.d /etc/init.d
WORKDIR /home/celery
RUN mkdir -p /var/run
RUN mkdir -p /var/run/celery
CMD ["celery", "worker"]
