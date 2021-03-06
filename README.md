# nginx-librdkafka
A full docker environment with kafka, zookeeper, nginx and schema-registry showing how to push messages to kafka using a simple curl command through nginx.

### Step to build and run kafka and nginx updated with librdkafka

* Build the nginx-librdkafka container by running the following commnand:
```
docker build -t nginx-librdkafka .
```

* Verify this new nginx container has been properly created:
```
docker images | grep nginx-librdkafka
```

* Start up kafka, zookeeper, schema-registry and nginx containers by running the following docker compose command:
```
docker-compose up -d
```

* Verify they are all up and running without errors:
```
docker-compose ps
```

* Check the nginx container logs and make sure it is running:
```
docker logs -f nginx-librdkafka
```

* Push a payload into kafka using the following curl command:
```
curl localhost/kafka/my-topic -d "test message"
```
If the message is correctly pushed into kafka a 204 (NO-CONTENT) should be returned.

* To check the message from kafka topic, open a kafka console topic consumer using the following command:
```
docker exec -it broker sh
#kafka-console-consumer --bootstrap-server localhost:9092 --zookeeper zookeeper:2181 --topic my-topic --from-beginning
```
If everything running fine, you should be able to see the message pushed in the previous step using the above curl command.



