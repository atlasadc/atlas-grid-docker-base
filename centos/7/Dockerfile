FROM centos:7
ENV HEP_OSLIBS_VER 7.2.6-1.el7.cern
LABEL maintainer="Alessandro.DeSalvo@roma1.infn.it"

# HEP OSLibs
RUN yum -y install epel-release && \
    yum -y install http://linuxsoft.cern.ch/wlcg/centos7/x86_64/HEP_OSlibs-${HEP_OSLIBS_VER}.x86_64.rpm && \
    #
    # Missing lib for nested singularity
    yum -y install libseccomp && \
    #
    # Final update and creation of the package list
    yum -y update && \
    rpm -qa > /var/lib/package-list && \
    #
    # Remove unuseful stuff
    rm -fr /var/lib/yum/* /var/cache/yum/* /usr/share/doc/* /boot/*

# Timestamp
RUN echo `date +%Y%m%d%H%M%S` > /docker-creation-date && \
    echo "export CDATE_DOCKER=\"`cat /docker-creation-date`\"" > /etc/profile.d/container-date.sh && \
    echo "setenv CDATE_DOCKER \"`cat /docker-creation-date`\"" > /etc/profile.d/container-date.csh && \
    # Create site dirs
    mkdir -p /scratch /gpfs/work /gpfs/scratch /cvmfs /etc/grid-security/certificates /var/lib/condor /srv /alrb
