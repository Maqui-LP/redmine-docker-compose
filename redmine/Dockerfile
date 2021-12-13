FROM ruby:2.6.6
ARG DB_HOST=localhost
ARG REDMINE_DB_DATABASE=redmine
ARG REDMINE_DB_PASSWORD=password
ARG REDMINE_DB_USERNAME=redmine
ARG REDMINE_PATH=/usr/src/redmine

ENV DB_HOST=${DB_HOST}
ENV REDMINE_DB_DATABASE=${REDMINE_DB_DATABASE}
ENV REDMINE_DB_PASSWORD=${REDMINE_DB_PASSWORD}
ENV REDMINE_DB_USERNAME=${REDMINE_DB_USERNAME}
ENV REDMINE_PATH=${REDMINE_PATH}

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
    && rm -r "${REDMINE_PATH}"redmine-4.2.3;

RUN mkdir mkdir -p "${REDMINE_PATH}"/pids

RUN gem install mysql2 bundler && bundle install

COPY database.yml.j2 /tmp/database.yml.j2
COPY puma.rb "${REDMINE_PATH}"/config/puma.rb
COPY entrypoint.sh entrypoint.sh

RUN pip3 install --no-cache-dir --upgrade setuptools\
    && pip3 install --no-cache-dir jinja-cli PyMySQL

RUN jinja -D DB_HOST "${DB_HOST}" \
    -D REDMINE_DB_DATABASE "${REDMINE_DB_DATABASE}" \
    -D REDMINE_DB_USERNAME "${REDMINE_DB_USERNAME}" \
    -D REDMINE_DB_PASSWORD "${REDMINE_DB_PASSWORD}" \
    -o "${REDMINE_PATH}"/config/database.yml /tmp/database.yml.j2;


ENTRYPOINT [ "./entrypoint.sh" ]
