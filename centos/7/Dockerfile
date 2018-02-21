FROM centos:7
ENV HEP_OSLIBS_VER 7.2.5-1.el7.cern
LABEL maintainer="Alessandro.DeSalvo@roma1.infn.it"

# HEP OSLibs
RUN yum -y install epel-release
RUN yum -y install http://linuxsoft.cern.ch/wlcg/centos7/x86_64/HEP_OSlibs-${HEP_OSLIBS_VER}.x86_64.rpm

# Final update and creation of the package list
RUN yum -y update
RUN rpm -qa > /var/lib/package-list

# Remove unuseful stuff
RUN rm -fr /var/lib/yum/* /var/cache/yum/* /usr/lib/locale/* /usr/share/locale/* /usr/share/doc/* /boot/*

# Timestamp
RUN /bin/sh -c 'TS=`date +%Y%m%d%H%M%S`; echo $TS > /docker-creation-date'
RUN /bin/sh -c 'echo "export CDATE_DOCKER=\"`cat /docker-creation-date`\"" > /etc/profile.d/container-date.sh'
RUN /bin/sh -c 'echo "setenv CDATE_DOCKER \"`cat /docker-creation-date`\"" > /etc/profile.d/container-date.csh'

# Create site dirs
RUN mkdir -p /scratch /gpfs/work /gpfs/scratch /cvmfs /etc/grid-security/certificates /var/lib/condor /srv /alrb
