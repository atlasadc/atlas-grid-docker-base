FROM almalinux:9
ENV HEP_OSLIBS_VER 9.0.2-3.el9
ENV HEP_OSLIBS_AARCH64_VER 9.0.2-3.el9
ARG TARGETPLATFORM
LABEL maintainer="Alessandro.DeSalvo@roma1.infn.it"

# HEP OSLibs
RUN if [ "$TARGETPLATFORM" == "linux/amd64" ] ; then \
      yum -y install epel-release dnf-plugins-core && \
      yum config-manager --set-enabled crb && \
      yum -y install http://linuxsoft.cern.ch/wlcg/el9/x86_64/HEP_OSlibs-${HEP_OSLIBS_VER}.x86_64.rpm && \
      #
      # Missing lib for nested singularity
      yum -y install libseccomp && \
      #
      # Other packages
      yum -y install texinfo libcurl-devel strace python3 python3-devel man-db hostname openldap bind-utils && \
      #
      # Final update and creation of the package list
      yum -y update && \
      rpm -qa > /var/lib/package-list && \
      #
      # Remove unuseful stuff
      rm -fr /var/lib/yum/* /var/cache/yum/* /usr/share/doc/* /boot/* \
    ; else \
      yum -y install epel-release dnf-plugins-core && \
      yum config-manager --set-enabled crb && \
      yum -y install http://linuxsoft.cern.ch/wlcg/el9/aarch64/HEP_OSlibs-${HEP_OSLIBS_AARCH64_VER}.aarch64.rpm && \
      #
      # Missing lib for nested singularity
      yum -y install libseccomp && \
      #
      # Other packages
      yum -y install texinfo libcurl-devel strace python3 python3-devel man-db hostname openldap bind-utils && \
      #
      # Final update and creation of the package list
      yum -y update && \
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
