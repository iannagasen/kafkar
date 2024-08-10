compose:
	docker compose -f 01-kafka-setup/compose/docker-compose.yaml up -d

bash:
	docker exec -it kafka bash

create-topic:
	docker exec kafka bash -c 'kafka-topics.sh --bootstrap-server localhost:9092 --topic hello-world --create'

list:
	docker exec kafka bash -c 'kafka-topics.sh --bootstrap-server localhost:9092 --list'	

# produce message
console-producer:
	docker exec kafka bash -c "echo 'my message 1' | kafka-console-producer.sh --bootstrap-server localhost:9092 --topic hello-world"


# consume message
console-consumer:
	docker exec kafka bash -c 'kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic hello-world --from-beginning'