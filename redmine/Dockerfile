FROM redmine:4.2.3
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
COPY database.yml "${REDMINE_PATH}/config/database.yml"
COPY puma.rb "${REDMINE_PATH}/config/puma.rb"
COPY puma.service /etc/systemd/system/puma.service