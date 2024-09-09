#!/bin/sh

/kafka/bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c /kafka/config/kraft/server.properties --ignore-formatted
/kafka/bin/kafka-server-start.sh /kafka/config/kraft/server.properties