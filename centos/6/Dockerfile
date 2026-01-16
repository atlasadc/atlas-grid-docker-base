FROM centos:6
ENV HEP_OSLIBS_VER=1.1.13-1.el6
LABEL maintainer="Alessandro.DeSalvo@roma1.infn.it"

# Copy manilinux build_scripts
COPY ./build_scripts /build_scripts 

# HEP OSlibs and other packages
RUN sed -i 's/enabled=1/enabled=0/g' /etc/yum/pluginconf.d/fastestmirror.conf &&     sed -i 's/^mirrorlist/#mirrorlist/g' /etc/yum.repos.d/*.repo &&     sed -i 's;^#baseurl=http://mirror;baseurl=https://vault;g' /etc/yum.repos.d/*.repo && \
    #
    # epel
    yum -y install epel-release && \
    #
    # Fix epel repositories
    sed -i 's/^mirrorlist/#mirrorlist/g' /etc/yum.repos.d/epel*.repo && sed -i 's;^#baseurl=http://download.fedoraproject.org/pub/;baseurl=https://archives.fedoraproject.org/pub/archive/;g' /etc/yum.repos.d/epel*.repo && \
    #
    # HEP_OSlibs
    yum -y install http://linuxsoft.cern.ch/wlcg/sl6/x86_64/HEP_OSlibs_SL6-${HEP_OSLIBS_VER}.x86_64.rpm && \
    #
    # Other packages
    yum -y install texinfo libcurl-devel && \
    #
    # Final update
    yum -y update && \
    #
    # Rebuild glibc without vsyscall
    sed -i 's|^rm -rf /root /tmp /var /sbin$|#&|g' /build_scripts/rebuild-glibc-without-vsyscall.sh && \
    sed -i 's|^rm -rf /usr /lib\*$|#&|g' /build_scripts/rebuild-glibc-without-vsyscall.sh && \
    bash /build_scripts/rebuild-glibc-without-vsyscall.sh && \
    rpm -Uvh --oldpackage --replacefiles --replacepkgs --nodeps /rpms/glibc-2*.rpm /rpms/glibc-common-2*.rpm && \
    #
    # creation of the package list
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
