FROM centos:centos6
MAINTAINER Cody Welch

#pkgs
RUN yum -y install epel-release
RUN yum -y install python-pip

#why are we installing these??
RUN yum -y install gcc
RUN yum -y install tar
RUN yum -y install python-devel

#install rspec/serverspec 
RUN yum -y install rubygems-devel
RUN gem install rspec
RUN gem install serverspec
RUN gem install rake

#install the correct version of pycrypto for ansible-lint
RUN yum -y erase python-crypto
RUN yum -y install python-crypto
RUN yum -y install python-paramiko

#install ansible/ansible lint
RUN yum -y install ansible
RUN pip install ansible-lint

#make jenkins user
RUN useradd jenkins
# This is not safe, this is a test
RUN echo "jenkins:xt4dFV4WdkURU3v8TRWu" | chpasswd
RUN echo "jenkins    ALL=NOPASSWD: ALL" >> /etc/sudoers
