#!/bin/bash

set -x

if [ x$HADOOP_VERSION == 'x' ]
	then
	HADOOP_VERSION=2.7.3
	echo "HADOOP_VERSION: $HADOOP_VERSION"
fi

DOWNLAOD_PATH_PREFIX=./

URL[0]="http://mirror.fibergrid.in/apache/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz"
URL[1]="http://www-eu.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz"
URL[2]="http://www-us.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz"

cd $DOWNLAOD_PATH_PREFIX

for u in ${URL[@]}
do
	echo "Trying to download from URL:$u"
	curl -sf -o hadoop-$HADOOP_VERSION.tar.gz $u
	if [ $? -eq 0 -a -s hadoop-$HADOOP_VERSION.tar.gz ]
		then
		tar xzf hadoop-$HADOOP_VERSION.tar.gz
		rm -rf hadoop-$HADOOP_VERSION hadoop-$HADOOP_VERSION.tar.gz
		break
	fi
done

if [ ! -d hadoop-$HADOOP_VERSION ]
	then
	echo "Error in Downloading hadoop-$HADOOP_VERSION"
	exit 1
else
	echo "Install hadoop in path `pwd`/hadoop-$HADOOP_VERSION"
fi