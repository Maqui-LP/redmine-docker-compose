FROM ruby:2.6.6

ARG REDMINE_PATH=/usr/src/redmine
ARG REDMINE_VERSION=4.2.3
ENV RAILS_ENV=production

WORKDIR "${REDMINE_PATH}"

RUN apt-get update && apt-get install -y \
    build-essential \
    libmagickwand-dev \
    default-libmysqlclient-dev \
    default-mysql-server \
    libssl-dev \
    ca-certificates \
    python3-pip \
    python3-mysqldb \
    libcurl4-openssl-dev;

RUN wget -O /tmp/redmine.zip https://www.redmine.org/releases/redmine-"${REDMINE_VERSION}".zip \
    && unzip /tmp/redmine.zip -d "${REDMINE_PATH}" \
    && cp -r "${REDMINE_PATH}"/redmine-"${REDMINE_VERSION}"/* "${REDMINE_PATH}" \
    && rm -r "${REDMINE_PATH}"/redmine-"${REDMINE_VERSION}";

RUN mkdir -p "${REDMINE_PATH}"/pids

RUN gem install mysql2 bundler && bundle install

COPY database.yml "${REDMINE_PATH}"/config/database.yml
COPY puma.rb "${REDMINE_PATH}"/config/puma.rb
COPY secrets.yml "${REDMINE_PATH}"/config/secrets.yml

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]