# Отчет по Лабораторной работе №1

## Значит так. Первое, что делаем - качаем Nginx.
```
    sudo apt update
    sudo apt install nginx
```
## Самое сложное позади, теперь разберемся, что вообще требуется.
Наша цель - настроить веб-сервер Nginx, который будет работать по протоколу HTTPS, перенаправлять с HTTP на HTTPS для безопасности, обслуживать 2 пет проекта на 1 сервере с виртуальными хостами и использовать alias. Начнем пока с этих задач. 
## Упростим алгоритм работы.
1. Ставим Nginx
2. Создаем папки с HTML-файлами (наши пет проекты)
3. Настраиваем конфиги
4. Создаем самоподписанные сертификаты
5. Тестиуем
## Что по пет проектам? 
Допустим, хочется блог о кулинарии (первый пет проект) и блог о фотографиях (второй пет проект).
### Создаем папки для сайтов
Чтобы после всей проделанной работы все файлы улетели на проверку преподавателю, надо организовать структуру проекта в папке, в нашем случае в папке Clouds/lab-1:
```
    # Создаем структуру
    mkdir -p nginx-configs websites/cooking websites/photo scripts
```
Что получилось?  
images # директория для пруфов  
nginx-configs # конфиги для nginx  
report.md # наш отчет  
scripts # скрипты установки  
websites/cooking и websites/photo # коды наших сайтов  
### Начнем с сайта о кулинарии. Создаем файл index.html.
```
    touch websites/cooking/index.html
```
Теперь пишем код:
```
<!DOCTYPE html>
<html>
<head>
    <title>Кулинарные рецепты со всего света</title>
    <style>
        body { 
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #98FB98;
        }
        h1 { color: #800080; }
    </style>
</head>
<body>
    <h1>Рецепты вокруг света</h1>
    <p>Добро пожаловать в мир кулинарии со всех уголков нашей планеты!</p>
    <p>Здесь Вы сможете найти рецепты на любой вкус и цвет.</p>
    <p><a href="/static/recipe.txt">Посмотреть рецепт пиццы</a></p>
</body>
</html>
```
### Теперь создаем файл для alias
```
    touch websites/cooking/recipe.txt
```
Вставляем в файл рецепт с просторов интернета: 
```
Рецепт Кабачковой икры, как в магазине
 
Ингредиенты:
- Кабачок – 1.5 кг
- Морковь – 500 г
- Лук репчатый – 500 г
- Томатная паста – 200 г
- Масло растительное – 200 мл
- Соль – 1 ст.л. , или по вкусу
- Сахар – 50 г , или по вкусу
- Уксус – 2 ст.л. , 9% столовый
- Перец черный – 0.5 ч.л. , или по вкусу

Приготовление:
1. Подготовить ингредиенты: овощи, масло, томатную пасту, уксус и специи.
2. Кабачок очистить.
3. Крупно нарезать кабачок.
4. Нарезать лук.
5. Нарезать морковь.
6. Разогреть масло.
7. Обжарить лук и морковь 10-12 минут.
8. Добавить кабачки и жарить еще 10 минут.
9. Уменьшить огонь и тушить 20-25 минут.
10. Простерилизовать банки и крышки.
11. Измельчить икру блендером.
12. Добавить сахар, соль, перец и томатную пасту. Прогреть еще 8-10 минут.
13. Добавить уксус.
14. Разлить икру по горячим банкам. 
15. Закрыть крышками, перевернуть, укутать и оставить остывать. 
16. Кабачковая икра, как в магазине, готова. На следующий день можно дегустировать. Приятного аппетита!
```
### Настало время конфиг для первого пет проекта
```
    touch nginx-configs/cooking.conf
```
Пишем: 
```
# Блок для HTTP (порт 80)
server {
    listen 80;  # Слушаем порт 80 (HTTP)
    server_name cooking.local;  # Имя нашего сайта
    
    # ПЕРЕНАПРАВЛЯЕМ все HTTP запросы на HTTPS
    return 301 https://$server_name$request_uri;
}

# Блок для HTTPS (порт 443)
server {
    listen 443 ssl;  # Слушаем порт 443 (HTTPS) с SSL
    server_name cooking.local;
    
    # Путь к SSL сертификатам (создадим позже)
    ssl_certificate /etc/ssl/certs/cooking.crt;
    ssl_certificate_key /etc/ssl/private/cooking.key;
    
    # КОРНЕВАЯ ПАПКА САЙТА - откуда брать файлы
    root /var/www/cooking;
    index index.html;  # Главный файл
    
    # Настройки безопасности SSL
    ssl_protocols TLSv1.2 TLSv1.3;
    
    # Логирование
    access_log /var/log/nginx/cooking_access.log;
    error_log /var/log/nginx/cooking_error.log;
    
    # Основное местоположение
    location / {
        try_files $uri $uri/ =404;  # Ищем файл, если нет - ошибка 404
    }
    
    # ALIAS - создаем псевдоним пути 
    location /static/ {
        alias /var/www/cooking/;  # Теперь /static/ ведет к корневой папке
    }
}
```
### Что происходит? 
server - блок настройки для одного сайта  
listen - какой порт слушать  
server_name - для какого домена эти настройки  
root - где лежат файлы сайта  
location /static/ - создаем псевдоним: когда кто-то зайдет на https://cooking.local/static/recipe.txt, nginx покажет файл /var/www/cooking/recipe.txt  
## Теперь создаем скрипт установки
```
  touch scripts/setup-nginx.sh  
```
Пишем код: 
```
#!/bin/bash

echo "Устанавливаем nginx..."
sudo apt update
sudo apt install nginx -y

echo "Создаем папки для сайтов на сервере..."
sudo mkdir -p /var/www/cooking
sudo mkdir -p /var/www/photo

echo "Копируем наши файлы сайтов..."
sudo cp -r websites/* /var/www/

echo "Копируем наши конфиги nginx..."
sudo cp nginx-configs/* /etc/nginx/sites-available/

echo "Включаем наши конфиги..."
sudo ln -sf /etc/nginx/sites-available/cooking.conf /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default

echo "Создаем SSL сертификаты..."
sudo mkdir -p /etc/ssl/private/
sudo mkdir -p /etc/ssl/certs/

# Создаем самоподписанный SSL сертификат для кулинарного сайта
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/cooking.key \
    -out /etc/ssl/certs/cooking.crt \
    -subj "/CN=cooking.local"

echo "Добавляем домены в файл hosts..."
echo "127.0.0.1 cooking.local photo.local" | sudo tee -a /etc/hosts

echo "Проверяем конфигурацию и перезапускаем nginx..."
sudo nginx -t
sudo systemctl restart nginx

echo "ГОТОВО! Теперь можно проверить:"
echo "Открой браузер и перейди по адресу:"
echo "https://cooking.local"
echo ""
echo "Браузер предупредит о самоподписанном сертификате"
echo "Это нормально для теста - просто нажми 'Принять риск'"
```
## Делаем скрипт исполняемым
```
    chmod +x scripts/setup-nginx.sh
```
```
# Блок для HTTP (перенаправление на HTTPS)
server {
    listen 80;
    server_name photo-portfolio.local;
    return 301 https://$server_name$request_uri;
}

# Блок для HTTPS
server {
    listen 443 ssl;
    server_name photo-portfolio.local;
    
    # SSL сертификаты
    ssl_certificate /etc/ssl/certs/photo-portfolio.crt;
    ssl_certificate_key /etc/ssl/private/photo-portfolio.key;
    
    # Корневая папка сайта
    root /var/www/photo-portfolio;
    index index.html;
    
    # Настройки SSL
    ssl_protocols TLSv1.2 TLSv1.3;
    
    # Логи
    access_log /var/log/nginx/photo-portfolio_access.log;
    error_log /var/log/nginx/photo-portfolio_error.log;
    
    # Основное местоположение
    location / {
        try_files $uri $uri/ =404;
    }
    
    # ⭐ ALIAS для API endpoints ⭐
    location /api/ {
        alias /var/www/photo-portfolio/;
    }
    
    # Дополнительный alias для галереи
    location /gallery/ {
        alias /var/www/photo-portfolio/;
    }
}
```
