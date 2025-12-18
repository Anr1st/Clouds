# Отчет по Облачной Лабораторной работе №2 "Сравнение сервисов Amazon Web Services и Microsoft Azure. Создание единой кросс-провайдерной сервисной модели."

## Цель работы
Получение навыков аналитики и понимания спектра публичных облачных сервисов без привязки к вендору. Формирование у студентов комплексного видения Облака.

## Алгоритм работы
Сопоставить входящие данные от провайдера с его же документацией. Написать в соответствие колонкам справа значения 5 колонок слева, которые бы однозначно классифицировали тип сервиса.

## Теория
В ходе работы были использованы результаты Лабораторной работы №1, где была создана сервисная модель для классификации сервисов Amazon Web Services (AWS). Задача Лабораторной работы №2: Применить ту же самую логическую модель и принципы классификации к данным от второго провайдера - Microsoft Azure. Ключевым требованием было обеспечить согласованность: если сервис AWS был отнесен к определенному типу, то аналогичный сервис Azure должен быть классифицирован в те же категории. Основной фокус был направлен не на изучение особенностей Azure, а на сопоставление функции сервиса с уже созданной моделью.  

![](https://raw.githubusercontent.com/Anr1st/Clouds/main/clouds_lab1/cat3.jpg)

## Практическая часть
1. Скачиваем все файлы из папки "Azure";
2. Работу выполняем в !["LAB2.xlsx"](https://github.com/Anr1st/Clouds/blob/main/clouds_lab1/LAB2.xlsx), каждый отдельный файл открывается на отдельном листе, подписанном номером файла из папки;
3. Классифицируем согласно документации Azure learn.microsoft.com

Логика:  
1. Смотрим на Consumed Service и Meter Category - идем в документацию;
2. Анализируем Meter Name - ищем знакомые слова и паттерны;
3. Используем контекст;
4. Для столбцов IT Tower и Service Family значения выбираем из образца;
5. Много гуглим;
6. Заполняем иерархию.

### Сервисы
Вычислительные: Azure Virtual Machines, Azure App Service, Azure Container Instances, Azure Functions, Azure Batch  
Российские аналоги: Яндекс Облако, VK Cloud, СберОблако  
Хранилища: Azure Blob Storage, Azure Files, Azure Disk Storage, Azure Data Lake Storage  
Российские аналоги: Яндекс Облако, VK Cloud, Selectel  
Базы данных: Azure SQL Database, Azure Cosmos DB, Azure Database for PostgreSQL/MySQL, Azure Cache for Redis  
Российские аналоги: Яндекс Облако, VK Cloud, Selectel  
Сеть: Azure Virtual Network, Azure Load Balancer, Azure Application Gateway, Azure DNS, Azure Traffic Manager, Azure VPN Gateway, Azure Bastion  
Российские аналоги: Яндекс Облако, VK Cloud, MTS Cloud  
ИИ и ML: Azure Machine Learning, Azure Cognitive Services, Azure Bot Service  
Российские аналоги: Сбер AI  
Безопасность: Azure Sentinel, Azure Key Vault, Azure Firewall  
Российские аналоги: Яндекс Облако, UserGate  
Аналитика: Azure Databricks, Azure HDInsight, Azure Stream Analytics, Azure Data Factory, Azure Analysis Services  
Российские аналоги: Яндекс Облако, VK Cloud  
Инструменты разработки: Azure DevTest Labs, Azure Container Registry  
Российские аналоги: Яндекс Облако  

### Немного о некоторых из сервисов
Azure Virtual Machines - предоставляет виртуальные серверы.  
Azure App Service - управляемая платформа для создания и хостинга.  
Azure Functions - бессерверная среда выполнения для запуска кода.  
Azure Container Instancesи- способ запуска контейнеров в Azure без необходимости управления виртуальными машинами.  
Azure Blob Storage - объектное хранилище.  
Azure Files - управляемые файловые ресурсы в облаке.  
Azure SQL Database - управляемая реляционная база данных.  
Azure Cosmos DB - база данных NoSQL.  
Azure Virtual Network - логическая изоляция для ресурсов Azure.  
Azure Load Balancer - распределяет входящий трафик.  
Azure Machine Learning - облачная среда для обучения, развертывания, автоматизации и управления моделями машинного обучения.  
Azure Cognitive Services - набор предварительно обученных моделей ИИ.  
Microsoft Defender for Cloud - единая система управления безопасностью инфраструктуры и защитой от угроз.  
Azure Key Vault - служба для безопасного хранения секретов, ключей шифрования и сертификатов.  
Azure Synapse Analytics - неограниченная аналитика, объединяющая хранилище данных, аналитику больших данных и интеграцию данных.  
Azure Databricks - платформа аналитики на основе Apache Spark, оптимизированная для облака Azure.  
Azure DevOps - набор облачных-сервисов для совместной работы над кодом, планированием, сборкой и развертыванием.  

## Заключение
Лабораторная работа выполнена. Все предоставленные данные классифицированы, создана сервисная модель, готовая для сравнения затрат, управления мультиоблачной средой, обоснование стратегических решений.

![](https://raw.githubusercontent.com/Anr1st/Clouds/main/clouds_lab1/cat4.jpg)
