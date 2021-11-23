FROM quay.io/centos/centos:stream9
ARG TARGETPLATFORM
LABEL maintainer="Alessandro.DeSalvo@roma1.infn.it"

# No epel release yet for centos 9 stream \
#RUN dnf -y install epel-release && \
#
# Home-made pre-version of Hep_OSlibs 
RUN dnf -y install alsa-lib alsa-lib-devel atlas atlas-devel attr automake bash bind-utils binutils bzip2 bzip2-devel bzip2-libs compat-libgfortran-48 cpp cyrus-sasl-lib dbus dbus-devel dbus-glib dbus-libs e2fsprogs-libs expat expat-devel filesystem fontconfig fontconfig-devel fontpackages-filesystem freetype freetype-devel gawk gcc gcc-c++ gettext gettext-libs ghostscript giflib git glib2 glib2-devel glibc glibc-common glibc-devel glibc-headers glibmm24 gmp gmp-devel gperf grep gzip json-c kernel-headers keyutils-libs keyutils-libs-devel krb5-devel krb5-libs libicu libicu-devel libICE libICE-devel libSM libSM-devel libX11 libX11-common libX11-devel libXScrnSaver libXScrnSaver-devel libXau libXau-devel libXcomposite libXcomposite-devel libXcursor libXcursor-devel libXdamage libXdamage-devel libXext libXext-devel libXfixes libXfixes-devel libXft libXft-devel libXi libXi-devel libXinerama libXmu libXmu-devel libXp libXp-devel libXpm libXpm-devel libXrandr libXrandr-devel libXrender libXrender-devel libXt libXt-devel libXtst libXtst-devel libacl libaio libatomic libattr libcap libcap-devel libcap-ng libcap-ng-devel libcom_err libcom_err-devel libdb libdb-devel libdb-utils libdrm libdrm-devel libedit libevent libgcc libgcrypt libgfortran libgpg-error libjpeg-turbo libjpeg-turbo-devel libpng libpng-devel libpng15 libselinux libselinux-devel libsepol libsepol-devel libstdc++ libstdc++-devel libtiff libtiff-devel libtool libtool-ltdl libuuid libuuid-devel libxcb libxcb-devel libxml2-devel libxshmfence libxslt man-db make mesa-dri-drivers mesa-filesystem mesa-libEGL mesa-libEGL-devel mesa-libGL mesa-libGL-devel mesa-libGLU mesa-libGLU-devel mesa-libglapi motif motif-devel ncurses-base ncurses-devel ncurses-libs net-tools nspr nspr-devel nss nss-devel nss-softokn nss-softokn-devel nss-softokn-freebl nss-softokn-freebl-devel nss-sysinit nss-tools nss-util nss-util-devel openldap openssl-devel openssl-libs pciutils pciutils-devel pciutils-libs pcre pcre-devel perl perl-CGI perl-Carp perl-Data-Dumper perl-Encode perl-Error perl-Exporter perl-ExtUtils-Embed perl-ExtUtils-Install perl-ExtUtils-MakeMaker perl-ExtUtils-Manifest perl-ExtUtils-ParseXS perl-FCGI perl-File-Path perl-File-Temp perl-Filter perl-Getopt-Long perl-Git perl-HTTP-Tiny perl-PathTools perl-Pod-Escapes perl-Pod-Perldoc perl-Pod-Simple perl-Pod-Usage perl-Scalar-List-Utils perl-Socket perl-Storable perl-TermReadKey perl-Test-Harness perl-Text-ParseWords perl-Text-Unidecode perl-Thread-Queue perl-Time-HiRes perl-Time-Local perl-constant perl-devel perl-libintl perl-libs perl-macros perl-parent perl-podlators perl-threads perl-threads-shared pkgconfig python3 python3-devel readline sed sqlite tar tcsh texlive-dvipng-bin tk tzdata unzip util-linux wget which xkeyboard-config xz-devel xz-libs zlib zlib-devel zsh && \
  #
  # Missing lib for nested singularity
  dnf -y install libseccomp && \
  #
  # Other packages
  dnf -y install texinfo libcurl-devel strace && \
  #
  # Final update and creation of the package list
  dnf -y update && \
  rpm -qa > /var/lib/package-list && \
  #
  # Remove unuseful stuff
  rm -fr /var/lib/yum/* /var/cache/yum/* /usr/share/doc/* /boot/* /qemu_*.core \

# Timestamp
RUN echo `date +%Y%m%d%H%M%S` > /docker-creation-date && \
    echo "export CDATE_DOCKER=\"`cat /docker-creation-date`\"" > /etc/profile.d/container-date.sh && \
    echo "setenv CDATE_DOCKER \"`cat /docker-creation-date`\"" > /etc/profile.d/container-date.csh && \
    # Create site dirs
    mkdir -p /scratch /gpfs/work /gpfs/scratch /cvmfs /etc/grid-security/certificates /var/lib/condor /srv /alrb
