FROM local/spark

MAINTAINER zerosign <r1nlx0@gmail.com>

RUN pacman-key --init
RUN pacman-key --populate archlinux
RUN pacman -Sy archlinux-keyring --noconfirm
RUN pacman-key --refresh-keys

RUN pacman -Syyu --noconfirm
RUN pacman-db-upgrade
RUN pacman -S git base-devel jdk8-openjdk jre8-openjdk jre8-openjdk-headless \
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
