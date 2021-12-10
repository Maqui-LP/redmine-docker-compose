FROM redmine:4.2.3
ARG DB_HOST=localhost
ARG REDMINE_DB_DATABASE=redmine
ARG REDMINE_DB_PASSWORD=password
ARG REDMINE_DB_USERNAME=redmine
ARG REDMINE_PATH=/usr/src/redmine

ENV DB_HOST=${DB_HOST}
ENV REDMINE_DB_DATABASE=${REDMINE_DB_DATABASE}
ENV REDMINE_DB_PASSWORD=${REDMINE_DB_PASS}
ENV REDMINE_DB_USERNAME=${REDMINE_DB_USERNAME}
ENV REDMINE_PATH=${REDMINE_PATH}

RUN apt-get update -y \
    && apt-get upgrade \
    && apt-get install -y \
    build-essential \
    ca-certificates \
    python3-pip \
    python3-mysqldb \
    libcurl4-openssl-dev \
    libmagickwand-dev \
    default-libmysqlclient-dev \
    default-mysql-server \
    && gem install bundler mysql2\
    && bundle install;

COPY database.yml "${REDMINE_PATH}"/config/database.yml
RUN pip3 install --no-cache-dir --upgrade setuptools\
    && pip3 install --no-cache-dir jinja-cli PyMySQL
RUN jinja -E "${DB_HOST}" \
    -E "${REDMINE_DB_DATABASE}" \
    -E "${REDMINE_DB_USERNAME}" \
    -E "${REDMINE_DB_PASSWORD}" \
    -o "${REDMINE_PATH}"/config/database.yml /tmp/database.yml.j2;

WORKDIR "${REDMINE_PATH}"

# RUN bundle exec rake generate_secret_token
# && bundle exec rake db:migrate RAILS_ENV=production

RUN gem install puma && mkdir -p "${REDMINE_PATH}"/pids "${REDMINE_PATH}"/sockets
COPY puma.rb "${REDMINE_PATH}"/config/puma.rb
# CMD ["puma", "-C", "/usr/src/redmine/config/puma.rb"]
