FROM centos:7

RUN yum install -y epel-release && \
  yum install -y yum-plugin-remove-with-leaves dialog augeas-libs python-pip \
    python-devel libffi libffi-devel openssl openssl-devel gcc && \
  pip install --upgrade pip && \
  pip install --upgrade letsencrypt letsencrypt-apache letsencrypt-nginx \
    letsencrypt-s3front && \
  yum remove -y --remove-leaves python-devel openssl-devel gcc && \
  yum clean all

VOLUME /etc/letsencrypt /var/lib/letsencrypt
