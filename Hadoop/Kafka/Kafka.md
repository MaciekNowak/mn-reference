# Kafka http://kafka.apache.org/
## Useful commands

|Function |Command Example|
|---------|---------------|
|list available topics|${KAFKA_HOME}/bin/kafka-topics.sh --list --zookeeper host1.com:2181,host2.com:2181,host3.com:2181|
|describe|${KAFKA_HOME}/bin/kafka-topics.sh --describe --zookeeper host1.com:2181,host2.com:2181 --topic ourdata|
|alter a topic|${KAFKA_HOME}/bin/kafka-topics.sh --alter --zookeeper host1.com:2181,host2.com:2181 --topic ourdata --partitions 4|
|delete a topic|${KAFKA_HOME}/bin/kafka-topics.sh --delete --zookeeper host1.com:2181,host2.com:2181 --topic ourdata|
|get offsets and lags|${KAFKA_HOME}/bin/kafka-consumer-groups.sh --describe --group ourgroup --zookeeper host1.com:2181,host2.com:2181|



