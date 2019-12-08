FROM centos:7

# Install azcopy 10
RUN mkdir /opt/azcopy && \
    curl -o /opt/azcopy/azcopy.tar.gz -L https://aka.ms/downloadazcopy-v10-linux && \
    tar xzf /opt/azcopy/azcopy.tar.gz -C /opt/azcopy/ --strip-components=1 && \
    mv /opt/azcopy/azcopy /usr/bin/azcopy && rm -rf /opt/azcopy

# Install pg_dump
RUN yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-ppc64le/pgdg-redhat-repo-latest.noarch.rpm && \
    yum install -y postgresql11

# dotnetclub-backup-runner:azcp10pg11