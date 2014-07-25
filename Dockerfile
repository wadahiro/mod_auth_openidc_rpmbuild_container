FROM centos:centos6
MAINTAINER Hiroyuki Wada <wadahiro@gmail.com>

# setup
RUN yum update -y
RUN yum install -y rpm-build gcc tar git autoconf automake libtool

# jansson depends
RUN yum install -y python-sphinx

# build jannson rpm
WORKDIR /opt/rpmbuild
ENV HOME /opt/rpmbuild
RUN mkdir -p $HOME/rpm/{BUILD,SRPMS,SPECS,SOURCES,RPMS}
RUN echo "%_topdir $HOME/rpm" > ~/.rpmmacros
RUN curl -o $HOME/rpm/SOURCES/jansson-2.6.tar.bz2 http://www.digip.org/jansson/releases/jansson-2.6.tar.bz2
ADD jansson.spec $HOME/rpm/SPECS/jansson.spec
RUN rpmbuild -bb $HOME/rpm/SPECS/jansson.spec

# mod_auth_openidc depends
RUN yum install --enablerepo=centosplus -y openssl-devel 
RUN yum install -y httpd httpd-devel curl-devel
RUN rpm -ivh $HOME/rpm/RPMS/x86_64/jansson-*.el6.x86_64.rpm

# build mod_auth_openidc rpm
RUN curl -o $HOME/rpm/SOURCES/mod_auth_openidc-1.5.2.tar.gz https://codeload.github.com/pingidentity/mod_auth_openidc/tar.gz/v1.5.2
ADD mod_auth_openidc.spec $HOME/rpm/SPECS/mod_auth_openidc.spec
RUN rpmbuild -bb $HOME/rpm/SPECS/mod_auth_openidc.spec

