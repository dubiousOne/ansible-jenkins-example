FROM centos:centos6
MAINTAINER Cody Welch

RUN yum -y install epel-release
RUN yum -y install ansible
RUN yum -y install python-pip
RUN pip install --upgrade pip
RUN yum -y install gcc
RUN yum -y upgrade python-crypto
RUN pip install ansible-lint
RUN yum -y install rubygems-devel
RUN gem install rspec
RUN gem install serverspec
RUN gem install rake

# Required for Docker jenkins plugin
RUN yum -y install openssh-server
RUN mkdir /var/run/sshd
EXPOSE 22
RUN yum -y install java-1.6.0-openjdk
RUN useradd jenkins
# This is not safe, this is a test
RUN echo "jenkins:xt4dFV4WdkURU3v8TRWu" | chpasswd
RUN echo "jenkins    ALL=NOPASSWD: ALL" >> /etc/sudoers
