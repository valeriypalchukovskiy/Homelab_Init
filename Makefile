.PHONY: up ssh tunnel down clean

up:
	vagrant up

ssh:
	vagrant ssh

tunnel:
	vagrant ssh -- -L 8081:localhost:8080

down:
	vagrant halt

clean:
	vagrant destroy -f

run: up
	@echo "VM запущена. Запусти 'make tunnel' в отдельном окне для доступа к приложению."