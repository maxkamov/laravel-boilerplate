docker-up: memory
	sudo docker compose up -d

docker-down:
	sudo docker compose down

docker-build: memory
	sudo docker compose up --build -d

test:
	sudo docker compose exec php-cli vendor/bin/phpunit

optimize:
	sudo docker compose exec php-cli php artisan optimize

artisan:
	@echo "Running artisan command: php artisan $(command)"
	sudo docker compose exec php-cli artisan $(command)

composer:
	@echo "Running Composer command: composer $(command)"
	sudo docker compose exec php-cli composer $(command)

queue:
	sudo docker compose exec php-cli php artisan queue:work

horizon:
	sudo docker compose exec php-cli php artisan horizon

horizon-pause:
	sudo docker compose exec php-cli php artisan horizon:pause

horizon-continue:
	sudo docker compose exec php-cli php artisan horizon:continue

horizon-terminate:
	sudo docker compose exec php-cli php artisan horizon:terminate

memory:
	sudo sysctl -w vm.max_map_count=262144

perm:
	sudo chgrp -R www-data storage bootstrap/cache
	sudo chmod -R ug+rwx storage bootstrap/cache
