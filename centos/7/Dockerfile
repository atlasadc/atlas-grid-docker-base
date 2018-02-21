FROM centos:7
ENV HEP_OSLIBS_VER 7.2.5-1.el7.cern
MAINTAINER Alessandro De Salvo "Alessandro.DeSalvo@roma1.infn.it"

# HEP OSLibs
RUN yum -y install epel-release
RUN yum -y install http://linuxsoft.cern.ch/wlcg/centos7/x86_64/HEP_OSlibs-${HEP_OSLIBS_VER}.x86_64.rpm

# Final update and creation of the package list
RUN yum -y update
RUN rpm -qa > /var/lib/package-list

# Remove unuseful stuff
RUN rm -fr /var/lib/yum/* /var/cache/yum/* /usr/lib/locale/* /usr/share/locale/* /usr/share/doc/* /boot/*

# Timestamp
RUN /bin/sh -c 'touch /creation-date-`date +%Y%m%d%H%M%S`'

# Create site dirs
RUN mkdir -p /scratch /gpfs/work /gpfs/scratch /cvmfs /etc/grid-security/certificates /var/lib/condor /srv /alrb
