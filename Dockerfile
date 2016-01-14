FROM centos:centos6
MAINTAINER Cody Welch

RUN yum -y install epel-release
RUN yum -y install ansible
RUN yum -y install python-pip
RUN pip install --upgrade pip
RUN yum -y install gcc
RUN yum -y install tar
#RUN yum groupinstall -y 'development tools'
#RUN yum -y install which
#RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
#RUN curl -L get.rvm.io | bash -s stable
#RUN source /etc/profile.d/rvm.sh
#RUN /usr/local/rvm/bin/rvm reload
#RUN /usr/local/rvm/bin/rvm install 2.0.0
#RUN /usr/local/rvm/bin/rvm use 2.0.0 --default
RUN yum -y install python-devel
RUN pip install ansible-lint
RUN yum -y install rubygems-devel
RUN gem install rspec
RUN gem install net-ssh -v 2.9.2
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
