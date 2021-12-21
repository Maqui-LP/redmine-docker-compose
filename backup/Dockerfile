FROM alpine:3.15

ENV HOURLY_SCHEDULE="0 */4 * * *"
ENV DAILY_SCHEDULE="30 23 * * *"
ENV WEEKLY_SCHEDULE="0 23 * * 0"


RUN apk --update add rsnapshot
RUN mkdir /backups

COPY rsnapshot.conf /etc/rsnapshot.conf
COPY entrypoint.sh entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]