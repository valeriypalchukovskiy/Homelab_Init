#!/bin/bash

# Обновляем список пакетов
apt-get update

# Устанавливаем веб-сервер nginx
apt-get install -y nginx

# Создаём тестовую страницу
echo "<h1>Всё работает! Ваша первая VM готова.</h1>" > /var/www/html/index.html

# Запускаем nginx
systemctl start nginx
systemctl enable nginx