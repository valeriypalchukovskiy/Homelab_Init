# Homelab Init — Счётчик посещений на Python + Redis

Проект для портфолио: веб-приложение, которое считает количество посещений страницы.  
Данные хранятся в Redis, приложение упаковано в Docker, среда разворачивается через Vagrant.

## Технологии

- Python 3
- Redis
- Docker
- Vagrant + VirtualBox
- Makefile

## Структура

```
.
├── Makefile
├── README.md
├── Vagrantfile
├── infra/
│   └── provision.sh
└── src/
    ├── app.py
    ├── Dockerfile
    └── requirements.txt
```

## Запуск

### 1. Клонировать репозиторий

```bash
git clone https://github.com/valeriypalchukovskiy/Homelab_Init.git
cd Homelab_Init
```

### 2. Запустить VM

```bash
make up
# или vagrant up
```

### 3. Войти в VM и запустить приложение

```bash
make ssh
# затем внутри VM:
cd ~/web_project
sudo systemctl start redis
python3 app.py &
```

### 4. Открыть туннель (в отдельном окне)

```bash
make tunnel
# или vagrant ssh -- -L 8081:localhost:8080
```

### 5. Открыть в браузере

[http://localhost:8081](http://localhost:8081)

## Docker (внутри VM)

```bash
cd ~/web_project
docker build -t counter-app .
docker run -d --network host --name counter counter-app
curl http://localhost:8080   # проверка
```

## Автор

Валерий Пальчуковский