#!/bin/bash

echo "--------------------STARTING SPARK MASTER-------------------------"

spark-class org.apache.spark.deploy.master.Master --host 0.0.0.0

