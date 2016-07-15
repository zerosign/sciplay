FROM base/archlinux

MAINTAINER zerosign <r1nlx0@gmail.com>

RUN pacman-key --init
RUN pacman-key --populate archlinux
RUN pacman -Sy archlinux-keyring --noconfirm
RUN pacman-key --refresh-keys

RUN pacman -Syyu --noconfirm
RUN pacman-db-upgrade
RUN pacman -S git base-devel jdk8-openjdk jre8-openjdk jre8-openjdk-headless \
           	  openjdk8-src openjdk8-doc --noconfirm

RUN mkdir -p /home/developer/
VOLUME ["/home/developer"]
RUN mkdir -p /home/developer/Repositories
WORKDIR /home/developer/Repositories

COPY ../scripts/spark-path.sh /etc/profile.d/spark-path.sh
COPY ../scripts/spark.sh /etc/profile.d/spark.sh
RUN chmod +x /etc/profile.d/spark-path.sh
RUN chmod +x /etc/profile.d/spark.sh

RUN source /etc/profile.d/spark.sh; spark-update;
RUN source /etc/profile.d/spark-path.sh;
