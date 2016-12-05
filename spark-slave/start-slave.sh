#!/bin/bash

echo "--------------------STARTING SPARK MASTER-------------------------"

spark-class org.apache.spark.deploy.worker.Worker spark://spark-master:7077

