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
4. Много гуглим;
5. Заполняем иерархию.

### Сервисы
Вычислительные: Amazon Elastic Compute Cloud (EC2), AWS Lambda, Amazon EKS, Amazon Lightsail  
Российские аналоги: Яндекс Облако, VK Cloud, СберОблако  
Хранилища: Amazon S3, Amazon EFS, Amazon FSx, Amazon CloudFront   
Российские аналоги: Яндекс Облако, VK Cloud, Selectel  
Базы данных: Amazon RDS, Amazon DynamoDB, Amazon ElastiCache, Amazon DocumentDB  
Российские аналоги: Яндекс Облако, VK Cloud, Selectel  
Сеть: Amazon VPC, Amazon Route 53, AWS Direct Connect  
Российские аналоги: Яндекс Облако, VK Cloud, MTS Cloud  
ИИ и ML: Amazon SageMaker, Amazon Rekognition, Amazon Comprehend, Amazon Lex  
Российские аналоги: Яндекс Облако, Сбер AI  
Безопасность:| AWS KMS, Amazon Inspector, Amazon GuardDuty  
Российские аналоги: Яндекс Облако, UserGate  
Аналитика: Amazon Redshift, Amazon Athena, Amazon Kinesis  
Российские аналоги: Яндекс Облако, VK Cloud  
Инструменты разработки: AWS CodePipeline, AWS CodeBuild, AWS X-Ray  
Российские аналоги: Яндекс Облако  
Менеджмент и мониторинг: Amazon CloudWatch, AWS Backup, AWS Budgets  
Российские аналоги: Яндекс Облако  

## Заключение
Лабораторная работа выполнена. Все предоставленные данные классифицированы, создана сервисная модель, готовая для анализа затрат и проведения финансового анализа использования облачных ресурсов AWS.

![](https://raw.githubusercontent.com/Anr1st/Clouds/main/clouds_lab1/cat2.jpg)
