FROM base/archlinux

MAINTAINER zerosign <r1nlx0@gmail.com>

COPY scripts/mirrorlist /etc/pacman.d/mirrorlist

RUN pacman-key --init; \
	 pacman-key --populate archlinux; \
	 pacman -Sy archlinux-keyring --noconfirm; \
	 pacman-key --refresh-keys; \
	 pacman -Syyu --noconfirm; \
	 pacman-db-upgrade; \
	 pacman -S git base-devel jdk8-openjdk jre8-openjdk jre8-openjdk-headless \
           	  openjdk8-src openjdk8-doc --noconfirm;

RUN mkdir -p /home/developer/
VOLUME ["/home/developer"]
RUN mkdir -p /home/developer/Repositories
WORKDIR /home/developer/Repositories

COPY scripts/spark-path.sh /etc/profile.d/spark-path.sh
COPY scripts/spark.sh /etc/profile.d/spark.sh
RUN chmod +x /etc/profile.d/spark-path.sh
RUN chmod +x /etc/profile.d/spark.sh

RUN source /etc/profile.d/spark.sh; spark-update;
RUN source /etc/profile.d/spark-path.sh;
