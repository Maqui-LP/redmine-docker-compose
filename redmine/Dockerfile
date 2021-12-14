FROM ruby:2.6.6

ARG REDMINE_PATH=/usr/src/redmine
ENV RAILS_ENV=production

WORKDIR "${REDMINE_PATH}"

RUN apt-get update && apt-get install -y \
    build-essential \
    ca-certificates \
    python3-pip \
    python3-mysqldb \
    libcurl4-openssl-dev \
    libmagickwand-dev \
    default-libmysqlclient-dev \
    default-mysql-server \
    libssl-dev;

RUN wget -O /tmp/redmine.zip https://www.redmine.org/releases/redmine-4.2.3.zip \
    && unzip /tmp/redmine.zip -d "${REDMINE_PATH}" \
    && cp -r "${REDMINE_PATH}"/redmine-4.2.3/* "${REDMINE_PATH}" \
    && rm -r "${REDMINE_PATH}"/redmine-4.2.3;

RUN mkdir mkdir -p "${REDMINE_PATH}"/pids

RUN gem install mysql2 bundler && bundle install

COPY database.yml "${REDMINE_PATH}"/config/database.yml
COPY puma.rb "${REDMINE_PATH}"/config/puma.rb
COPY entrypoint.sh entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
