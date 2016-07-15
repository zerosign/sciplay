FROM base/archlinux

MAINTAINER zerosign <r1nlx0@gmail.com>

RUN cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup; \
	 sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup; \
	 rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist; \
	 pacman-key --init; \
	 pacman-key --populate archlinux; \
	 pacman -Sy archlinux-keyring --noconfirm; \
	 pacman-key --refresh-keys; \
	 pacman -Syyu --noconfirm; \
	 pacman-db-upgrade; \
	 pacman -S git base-devel jdk8-openjdk jre8-openjdk jre8-openjdk-headless \
	 		  	  openjdk8-src openjdk8-doc \
				  python2 python2-setuptools python2-pip --noconfirm

RUN pacman -S npm nodejs --noconfirm

RUN mkdir -p /home/developer
VOLUME ["/home/developer"]

RUN mkdir -p /opt/jupyterlab
WORKDIR /opt/jupyterlab

RUN pip2 install jupyterlab numpy scipy pandas

RUN mkdir -p /home/developer/notebooks
WORKDIR /home/developer/notebooks

ENTRYPOINT source /etc/profile.d/spark-path.sh; \
			  jupyter serverextension enable --py jupyterlab
