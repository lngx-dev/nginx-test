FROM centos
MAINTAINER Shinya MATSUDA <shinya.matsuda@lang-ex.jp>

# Install nginx
RUN yum -y update && \
  yum -y install epel-release && \
  yum -y install nginx && \
  yum -y clean all

# Deploy config
COPY ./src/nginx.conf  /etc/nginx/

# Open port
EXPOSE 80 8000 8001

# Start nginx
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]