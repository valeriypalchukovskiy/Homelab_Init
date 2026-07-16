#!/bin/bash
set -e
set -x

echo "=== 1. Обновление системы ==="
apt-get update -y
apt-get upgrade -y

echo "=== 2. Установка базовых утилит ==="
apt-get install -y git curl wget vim ufw python3 python3-pip

echo "=== 3. Настройка файрвола UFW ==="
ufw allow 22/tcp
ufw allow 80/tcp
ufw --force enable
ufw status verbose

echo "=== 4. Установка Redis ==="
apt-get install -y redis-server
systemctl enable redis
systemctl start redis

echo "=== 5. Установка Docker ==="
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker vagrant

echo "=== 6. Копирование кода приложения ==="
mkdir -p /home/vagrant/web_project
cp /vagrant/src/* /home/vagrant/web_project/
chown -R vagrant:vagrant /home/vagrant/web_project

echo "=== 7. Установка Python-зависимостей ==="
pip3 install redis

echo "=== 8. Запуск приложения ==="
sudo -u vagrant bash -c "cd /home/vagrant/web_project && nohup python3 app.py > /home/vagrant/app.log 2>&1 &"

echo "=== Всё готово! ==="