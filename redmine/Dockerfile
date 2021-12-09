FROM redmine:${REDMINE_VERSION}
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
    && gem install bundler \
    && bundle install \
    && gem install puma \
    && gem install mysql2;
COPY database.yml.j2 /tmp/database.yml.j2
RUN echo "${DB_HOST}"
RUN pip3 install --no-cache-dir --upgrade setuptools\
    && pip3 install --no-cache-dir jinja-cli PyMySQL
RUN jinja -D DB_HOST "${DB_HOST}" \ 
    -D REDMINE_DB_DATABASE "${REDMINE_DB_DATABASE}" \
    -D REDMINE_DB_USERNAME "${REDMINE_DB_USERNAME}" \
    -D REDMINE_DB_PASSWORD "${REDMINE_DB_PASSWORD}" \
    -o "${REDMINE_PATH}"/config/database.yml /tmp/database.yml.j2;
COPY puma.rb "${REDMINE_PATH}"/config/puma.rb
COPY puma.service /etc/systemd/system/puma.service