# Отчет по Облачной Лабораторной работе №1 "Знакомство с IaaS, PaaS, SaaS сервисами в облаке на примере Amazon Web Services (AWS). Создание сервисной модели."

## Цель работы
Знакомство с облачными сервисами. Понимание уровней абстракции над инфраструктурой в облаке. Формирование понимания типов потребления сервисов в сервисной-модели. 

## Алгоритм работы
Сопоставить входящие данные от провайдера с его же документацией. Написать в соответствие колонкам справа значения 5 колонок слева, которые бы однозначно классифицировали тип сервиса.

## Теория
Облачные технологии (облачные вычисления) - это система предоставления вычислительных ресурсов через интернет.  
Преимущества: Гибкость, Масштабируемость, Безопасность, Доступность, Экономичность.  
Три основные модели облачных услуг:  
1. IaaS - инфраструктура как услуга;
2. PaaS - платформа как услуга;
3. SaaS - ПО как услуга.  
(есть также узкоспециализированные)  

![](https://raw.githubusercontent.com/Anr1st/Clouds/main/clouds_lab1/clouds.jpg)  

Что требуется в работе?  
Классифицировать потребляемые ресурсы по:  
1. Уровню абстракции (IaaS/PaaS/SaaS);
2. Функциональной категории - IT Tower и Service Family;
3. Типу потребления - Service Usage Type.  

Для чего?  
1. Создания сервисной модели;
2. Фин. анализа;
3. Управления затратами.

Как это будет работать? На примере строчки из файла "Mapping Rules AWS Example.csv"  

IT Tower | Service Family | Service Type | Service Sub Type | Service Usage Type   
Compute  | Compute        | Amazon EKS   | Fargate          | vCPU hours  
Категория| Подкатегория   | Сервис AWS   | Вариант сервиса  | За что платим     

![](https://raw.githubusercontent.com/Anr1st/Clouds/main/clouds_lab1/cat1.jpg)  

## Практическая часть
1. Скачиваем все файлы из папки "AWS";
2. Работу выполняем в !["LAB1.xlsx"](https://github.com/Anr1st/Clouds/blob/main/clouds_lab1/LAB1.xlsx), каждый отдельный файл открывается на отдельном листе, подписанном номером файла из папки;
3. Классифицируем согласно документации AWS https://docs.aws.amazon.com/

Логика:  
1. Смотрим на Product Code - идем в документацию;
2. Анализируем Usage Type - ищем знакомые слова и паттерны;
3. Используем контекст;
4. Для столбцов IT Tower и Service Family значения выбираем из образца;
5. Много гуглим;
6. Заполняем иерархию.

### Сервисы
Вычислительные: Amazon Elastic Compute Cloud (EC2), AWS Lambda  
Российские аналоги: Yandex Compute Cloud, Yandex Cloud Functions  
Хранилища: Amazon S3, Amazon EFS  
Российские аналоги: VK Object Storage, Yandex Compute Cloud  
Базы данных: Amazon ElastiCache, Amazon DocumentDB  
Российские аналоги: VK Cloud Databases, Yandex Managed Service for MongoDB  
Сеть: Amazon VPC, Amazon Route 53  
Российские аналоги: VK Cloud Networks, Yandex Cloud DNS   
ИИ и ML: Amazon Machine Learning    
Российские аналоги: Cloud․ru ML Space  
Безопасность: Amazon Inspector, Amazon GuardDuty  
Российские аналоги: Yandex Cloud Security: Yandex Smart Web Security, Yandex Cloud Detection and Response, Yandex Security Deck   
Аналитика: Amazon Redshift, Amazon Elasticsearch Service, Amazon Kinesis  
Российские аналоги: Yandex Managed Service for ClickHouse, Yandex Managed Service for Elasticsearch, Yandex Data Streams  
Инструменты разработки: AWS CodePipeline, AWS CodeBuild   
Российские аналоги: Yandex Cloud Toolbox  

### Немного о некоторых из сервисов
Amazon Elastic Compute Cloud (EC2) - сервис виртуальных серверов в AWS с полным контролем над конфигурацией.  
AWS Lambda - бессерверная функция для запуска кода без управления инфраструктурой.  
Amazon Lightsail - виртуальный хостинг с предустановленными шаблонами для быстрого запуска проектов.  
Amazon S3 - объектное хранилище для файлов любого типа и объёма.  
Amazon EFS - управляемый сетевой файловый сервер, автоматически масштабируется при добавлении файлов.  
Amazon DynamoDB - управляемая бессерверная NoSQL БД.  
Amazon DocumentDB - управляемая БД для документов JSON, совместимая с API MongoDB.  
Amazon VPC - виртуальная частная сеть безопасного размещения ресурсов AWS.  
Amazon Route 53 - DNS-сервис для регистрации доменов и маршрутизации трафика.  
Amazon Machine Learning - сервис для создания моделей машинного обучения.  
Amazon Polly - преобразование текста в речь, озвучивание текстов.  
Amazon Translate - автоматический перевод текста.  
Amazon Personalize - Сервис для создания персонализированных рекомендаций.  
Amazon Detective - анализ для расследования инцидентов безопасности.  
Amazon Inspector - автоматическое сканирование рабочих нагрузок AWS на наличие уязвимостей ПО.  
Amazon GuardDuty - служба мониторинга угроз.  
Amazon Redshift - облачное хранилище данных для анализа данных с помощью SQL.  
Amazon Elasticsearch Service - управляемый сервис для развертывания и масштабирования кластеров Elasticsearch.  
Amazon Kinesis - сервис позволяет собирать, обрабатывать и анализировать потоки данных в реальном времени.  
AWS CodePipeline - управляемый сервис CI/CD.  
AWS CodeBuild - управляемый сервис для компиляции исходного кода, запуска тестов.  
AWS X-Ray - сервис позволяет анализировать и отлаживать распределенные приложения.  

## Заключение
Лабораторная работа выполнена. Все предоставленные данные классифицированы, создана сервисная модель, готовая для анализа затрат и проведения финансового анализа использования облачных ресурсов AWS.

![](https://raw.githubusercontent.com/Anr1st/Clouds/main/clouds_lab1/cat2.jpg)
