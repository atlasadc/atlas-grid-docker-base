FROM centos:6
ENV HEP_OSLIBS_VER 1.1.4-1.el6
MAINTAINER Alessandro De Salvo "Alessandro.DeSalvo@roma1.infn.it"

# HEP OSlibs
RUN yum -y install epel-release
RUN yum -y install http://linuxsoft.cern.ch/wlcg/sl6/x86_64/HEP_OSlibs_SL6-${HEP_OSLIBS_VER}.x86_64.rpm

# Final update and creation of the package list
RUN yum -y update
RUN rpm -qa > /var/lib/package-list

# Remove unuseful stuff
RUN rm -fr /var/lib/yum/* /var/cache/yum/* /usr/lib/locale/* /usr/share/locale/* /usr/share/doc/* /boot/*

# Timestamp
RUN /bin/sh -c 'touch /creation-date-`date +%Y%m%d%H%M%S`'

# Create site dirs
RUN mkdir -p /scratch /gpfs/work /gpfs/scratch /cvmfs /etc/grid-security/certificates /var/lib/condor /srv /alrb
