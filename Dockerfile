FROM centos:7
RUN \
  sed -i 's/^mirrorlist=/#mirrorlist=/g' /etc/yum.repos.d/CentOS-Base.repo && \
  sed -i 's/#baseurl=http:\/\/mirror.centos.org\/centos\/$releasever/baseurl=https:\/\/vault.centos.org\/7.9.2009/g' /etc/yum.repos.d/CentOS-Base.repo && \
  yum -y group install "Development Tools" && \
  yum install -y sudo yum-utils rpmdevtools rpmlint && \
  yum clean all && \
  groupadd -g 1001 build && \
  useradd -c "Build User" -u 1001 -g 1001 -G wheel -s /bin/bash -m build && \
  sed -i -E 's/^%wheel/# %wheel/; s/# %wheel(.*NOPASSWD:)/%wheel\1/' \
    /etc/sudoers
USER build
ENTRYPOINT ["/bin/bash"]
