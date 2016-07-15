#!/bin/sh

# exports all the required paths for sparks

export SPARK_HOME=/opt/spark/default
export PATH=$PATH:/opt/spark/default/bin:/opt/spark/default/sbin
export PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH
export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.9-src.zip:$PYTHONPATH
