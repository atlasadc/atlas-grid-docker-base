FROM almalinux:8
ENV HEP_OSLIBS_VER 8.3.2-1.el8
ENV HEP_OSLIBS_AARCH64_VER 8.3.2-1.el8
ARG TARGETPLATFORM
LABEL maintainer="Alessandro.DeSalvo@roma1.infn.it"

# HEP OSLibs
RUN if [ "$TARGETPLATFORM" == "linux/amd64" ] ; then \
      dnf -y install epel-release && \
      dnf config-manager --enable powertools && \
      dnf -y install http://linuxsoft.cern.ch/wlcg/centos8/x86_64/HEP_OSlibs-${HEP_OSLIBS_VER}.x86_64.rpm && \
      #
      # Missing lib for nested singularity
      dnf -y install libseccomp && \
      #
      # Other packages
      dnf -y install texinfo libcurl-devel strace python3 python3-devel man-db dnf-plugins-core compat-openssl10 && \
      #
      # Final update and creation of the package list
      dnf -y update && \
      rpm -qa > /var/lib/package-list && \
      #
      # Remove unuseful stuff
      rm -fr /var/lib/yum/* /var/cache/yum/* /usr/share/doc/* /boot/* \
    ; else \
      dnf -y install epel-release && \
      dnf config-manager --enable powertools && \
      dnf -y install https://linuxsoft.cern.ch/wlcg/el8/aarch64/HEP_OSlibs-${HEP_OSLIBS_AARCH64_VER}.aarch64.rpm && \
      #
      # Missing lib for nested singularity
      dnf -y install libseccomp && \
      #
      # Other packages
      dnf -y install texinfo libcurl-devel strace dnf-plugins-core compat-openssl10 && \
      #
      # Final update and creation of the package list
      dnf -y update && \
      rpm -qa > /var/lib/package-list && \
      #
      # Remove unuseful stuff
      rm -fr /var/lib/yum/* /var/cache/yum/* /usr/share/doc/* /boot/* /qemu_*.core \
    ; fi

# Timestamp
RUN echo `date +%Y%m%d%H%M%S` > /docker-creation-date && \
    echo "export CDATE_DOCKER=\"`cat /docker-creation-date`\"" > /etc/profile.d/container-date.sh && \
    echo "setenv CDATE_DOCKER \"`cat /docker-creation-date`\"" > /etc/profile.d/container-date.csh && \
    # Create site dirs
    mkdir -p /scratch /gpfs/work /gpfs/scratch /cvmfs /etc/grid-security/certificates /var/lib/condor /srv /alrb
