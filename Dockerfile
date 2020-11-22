FROM registry.access.redhat.com/ubi8/ubi

RUN dnf install -y python3-pip \
        && pip3 install ansible PyMySQL

RUN curl -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup \
        && chmod +x mariadb_repo_setup \
        && ./mariadb_repo_setup \
        && dnf install -y libaio perl \
        && dnf install -y --repo="mariadb-main" MariaDB-client
