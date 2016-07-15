#!/bin/sh

#
# Method to do spark-update to the latest version.
#
function spark-update() {
	 version = $1;
	 mkdir /opt/spark/downloads -p;
	 wget -c "http://mirror.wanxp.id/apache/spark/spark-$version/spark-$version-bin-hadoop2.6.tgz" \
			-o /opt/spark/downloads/spark-hadoop2.6.tgz;
	 tar xf /opt/spark/downloads/spark-hadoop2.6.tgz -C /opt/spark;
	 ln -s "/opt/spark/spark-$version-bin-hadoop2.6" /opt/spark/default;
}
