#!/usr/bin/env sh

set -e
printf "%s /usr/bin/rsnapshot hourly\n%s /usr/bin/rsnapshot daily\n%s /usr/bin/rsnapshot weekly" "${HOURLY_SCHEDULE}" "${DAILY_SCHEDULE}" "${WEEKLY_SCHEDULE}" | crontab -

exec crond -f
