#!/bin/bash

echo "🐣 Устанавливаем nginx..."
sudo apt update
sudo apt install nginx -y

echo "📁 Создаем папки для сайтов..."
sudo mkdir -p /var/www/cooking
sudo mkdir -p /var/www/photo

echo "📦 Копируем файлы сайтов..."
sudo cp -r websites/* /var/www/

echo "⚙️ Копируем конфиги nginx..."
sudo cp nginx-configs/* /etc/nginx/sites-available/

echo "🔗 Активируем конфиги..."
sudo ln -sf /etc/nginx/sites-available/cooking.conf /etc/nginx/sites-enabled/
sudo ln -sf /etc/nginx/sites-available/photo.conf /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default

echo "🔐 Создаем SSL сертификаты..."
sudo mkdir -p /etc/ssl/certs/
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/certs/cooking.key \
    -out /etc/ssl/certs/cooking.crt \
    -subj "/CN=cooking.local"

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/certs/photo.key \
    -out /etc/ssl/certs/photo.crt \
    -subj "/CN=photo.local"

echo "🏠 Добавляем домены в hosts..."
echo "127.0.0.1 cooking.local photo.local" | sudo tee -a /etc/hosts

echo "🔄 Проверяем конфигурацию..."
sudo nginx -t

echo "🔁 Перезапускаем nginx..."
sudo systemctl restart nginx

echo "✅ Готово!"
echo "Сайты доступны по:"
echo "https://cooking.local"
echo "https://photo.local"
