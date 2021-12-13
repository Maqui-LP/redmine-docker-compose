FROM python:3.10.1-alpine

ENV HOURLY_SCHEDULE="0 */4 * * *"
ENV DAILY_SCHEDULE="30 23 * * *"
ENV WEEKLY_SCHEDULE="0 23 * * 0"


RUN apt-get update && apt-get install \
    rsnapshot \
    python3-pip \
    && pip3 install --no-cache-dir --upgrade setuptools \
    && pip3 install --no-cache-dir jinja-cli;

RUN mkdir /backups

COPY rsnapshot.conf.j2 /tmp/rsnapshot.conf.j2
RUN jinja -D REDMINE_PATH "${REDMINE_PATH}" \
    -o /etc/rsnapshot.conf /tmp/rsnapshot.conf.j2;

ENTRYPOINT [ "./entrypoint.sh" ]