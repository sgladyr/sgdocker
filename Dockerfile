FROM centos:6.6
MAINTAINER Serhii Hladyr <shladyr@cisco.com>

EXPOSE 80

# Zero tuning
# RUN yum -y update && yum clean all
RUN yum -y install htop mc ccze iftop && yum clean all

# Application and Environment Startup Script
COPY ./env_setup.sh /root
RUN chmod +x /root/env_setup.sh

# Configure environment and start nginx
CMD ["/root/env_setup.sh"]