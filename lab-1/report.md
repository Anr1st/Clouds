# Отчет по Лабораторной работе №1

## Что происходит?
Наша цель - настроить веб-сервер Nginx для обслуживания двух пет-проектов с использованием HTTPS, перенаправлением с HTTP на HTTPS, виртуальными хостами и псевдонимами путей (alias). 

## Конфигурация сервера
ОС: Ubuntu  
Версия Nginx: 1.24.0  
Инструмент для сертификатов: mkcert v1.4.4.  
Домены:  
    cooking.test (первый проект).
    photo.test (второй проект).
![полделасделано](https://github.com/Anr1st/Clouds/blob/main/lab-1/images/photo_2025-09-09_18-07-29.jpg)

## Настройки 
Для начала создадим структуру директорий для каждого проекта:  
```
/var/www/cooking/          # Корневая директория для cooking.test
├── index.html             # Главная страница
├── recipes/               # Поддиректория для alias
│   └── index.html         # Страница разделов
└── recipe.txt             # Пример файла

/var/www/photo/            # Корневая директория для photo.test
├── index.html
├── gallery/               # Поддиректория для alias
│   └── index.html
└── bio.txt  
```
Далее созданы конфигурационные файлы в /etc/nginx/sites-available/:  
    cooking.conf: Настройки для cooking.test.  
    photo.conf: Настройки для photo.test.  
  
Ключевые моменты:  
1. Перенаправление с HTTP на HTTPS    
```
server {
    listen 80;
    server_name cooking.test www.cooking.test;
    return 301 https://$server_name$request_uri;  # Редирект на HTTPS
}
```
2. HTTPS  
```
server {
    listen 443 ssl;
    server_name cooking.test www.cooking.test;
    ssl_certificate /etc/ssl/certs/cooking.crt;    # Путь к сертификату
    ssl_certificate_key /etc/ssl/certs/cooking.key; # Путь к ключу
    root /var/www/cooking;                          # Корневая директория
    index index.html;
    # Настройки SSL
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:...;
    ssl_prefer_server_ciphers off;
}
```
3. Alias
```
location /recipes/ {
    alias /var/www/cooking/recipes/;  # Псевдоним пути
    try_files $uri $uri/ =404;
}
```
4. Сертификаты
```
mkcert cooking.test www.cooking.test photo.test www.photo.test
```
5. DNS. Домены добавлены в файл /etc/hosts
```
127.0.0.1 cooking.test www.cooking.test photo.test www.photo.test
```
6. Активация конфигов
```
cooking.conf -> /etc/nginx/sites-available/cooking.conf
photo.conf -> /etc/nginx/sites-available/photo.conf
```
Было ли это тяжело? Да, было  
![глупенькость](https://github.com/Anr1st/Clouds/blob/main/lab-1/images/photo_2025-09-09_18-07-21.jpg)

## САМОЕ СТРАШНОЕ - ТЕСТИРУЕМ
![тест](https://github.com/Anr1st/Clouds/blob/main/lab-1/images/photo_2025-09-09_18-07-27.jpg)



## ВСЁ
![Конец](https://github.com/Anr1st/Clouds/blob/main/lab-1/images/photo_2025-09-09_18-07-23.jpg)
