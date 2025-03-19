# Kafka KRaft Cluster Docker Compose (DEV)

- 3 nodes
- 2 different UIs (http:localhost:8082, http:localhost:8080)

## Running
```
docker network create kafka-net
docker-compose up -d
```


## Test producer
#### Basic 
```
docker run -it --rm --network kafka-net confluentinc/cp-kafka /bin/kafka-console-producer --bootstrap-server kafka-01:9092,kafka-02:9092,kafka-03:9092 --topic hello-world-topic
```
#### Benchmark
```
docker run -it --rm --network kafka-net confluentinc/cp-kafka /bin/kafka-producer-perf-test --topic hello-world-topic --num-records 1000000 --throughput -1 --producer-props bootstrap.servers=kafka-01:9092,kafka-02:9092,kafka-03:9092 batch.size=16384 acks=1 linger.ms=50 --record-size 1000

```

## Test consumer
```
docker run -it --rm --network kafka-net confluentinc/cp-kafka bin/kafka-console-consumer.sh --bootstrap-server kafka-01:9092,kafka-02:9092,kafka-03:9092 --topic hello-world-topic --from-beginning 
```


## Performance test

inside docker (container => container)

```
 docker run -it --rm --network kafka-net confluentinc/cp-kafka /bin/kafka-producer-perf-test --topic test_topic --num-records 1000000 --throughput -1 --producer-props bootstrap.servers=kafka-01:9092,kafka-02:9092,kafka-03:9092 batch.size=16384 acks=1 linger.ms=50 --record-size 1000
```
