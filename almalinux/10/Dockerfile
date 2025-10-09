FROM almalinux:10
ENV HEP_OSLIBS_VER 10.0.2-7.el10
ENV HEP_OSLIBS_AARCH64_VER 10.0.2-7.el10
ARG TARGETPLATFORM
LABEL maintainer="Alessandro.DeSalvo@roma1.infn.it"

# CERN repo
COPY cern.repo /etc/yum.repos.d/cern.repo

# HEP OSLibs
RUN if [ "$TARGETPLATFORM" == "linux/amd64" ] ; then \
      dnf install -y https://linuxsoft.cern.ch/cern/alma/10/CERN/x86_64/Packages/c/cern-gpg-keys-1.0-1.al10.cern.noarch.rpm && \
      dnf -y install epel-release dnf-plugins-core && \
      sed -i 's/\$cernalmalinux/10/g' /etc/yum.repos.d/epel.repo && \
      dnf config-manager --set-enabled crb && \
      dnf -y install http://linuxsoft.cern.ch/wlcg/el10/x86_64/HEP_OSlibs-${HEP_OSLIBS_VER}.x86_64.rpm && \
      #
      # Missing lib for nested singularity
      dnf -y install libseccomp && \
      #
      # Other packages
      dnf -y install texinfo libcurl-devel strace python3 python3-devel man-db hostname openldap bind-utils procps && \
      #
      # CERN certificates
      dnf -y install CERN-CA-certs && \
      #
      # Final update and creation of the package list
      dnf -y update && \
      rpm -qa > /var/lib/package-list && \
      #
      # Remove unuseful stuff
      rm -fr /var/lib/yum/* /var/cache/yum/* /usr/share/doc/* /boot/* \
    ; else \
      dnf install -y https://linuxsoft.cern.ch/cern/alma/10/CERN/aarch64/Packages/c/cern-gpg-keys-1.0-1.al10.cern.noarch.rpm && \
      dnf -y install epel-release dnf-plugins-core && \
      sed -i 's/\$cernalmalinux/10/g' /etc/yum.repos.d/epel.repo && \
      dnf config-manager --set-enabled crb && \
      dnf -y install http://linuxsoft.cern.ch/wlcg/el10/aarch64/HEP_OSlibs-${HEP_OSLIBS_AARCH64_VER}.aarch64.rpm && \
      #
      # Missing lib for nested singularity
      dnf -y install libseccomp && \
      #
      # Other packages
      dnf -y install texinfo libcurl-devel strace python3 python3-devel man-db hostname openldap bind-utils procps && \
      #
      # CERN certificates
      dnf -y install CERN-CA-certs && \
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
