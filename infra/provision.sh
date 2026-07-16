#!/bin/bash
set -e
set -x

echo "=== 1. Обновление системы ==="
apt-get update -y
apt-get upgrade -y

echo "=== 2. Установка базовых утилит ==="
apt-get install -y git curl wget vim ufw

echo "=== 3. Настройка файрвола UFW ==="
ufw allow 22/tcp
ufw allow 80/tcp
ufw --force enable
ufw status verbose

echo "=== 4. Проверка установленных версий ==="
git --version
curl --version | head -n1
wget --version | head -n1
vim --version | head -n1

# Установка Redis
sudo apt install -y redis-server
sudo systemctl enable redis
sudo systemctl start redis

# Установка Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker vagrant

echo "=== Всё готово! ==="