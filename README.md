# Описание проекта
Данный проект направлен на разработку информационно-социального приложения, позволяющего пользователям получать актуальную информацию из различных источников, формируя свою собственную ленту новостей. Приложение призвано решить проблему однобокости взгляда на новости, предоставляя доступ к информации с точки зрения разных авторов и сообществ.

### Цели
- Развитие навыков участников проекта в области разработки программного обеспечения, включая проектирование, дизайн, программирование, работу с базами данных, сетевое взаимодействие и командную работу.
- Создание удобного и функционального мобильного приложения для просмотра и агрегации новостей из различных источников, с возможностью персонализации ленты и взаимодействия с сообществами.

### Функционал
- Регистрация и авторизация пользователей
- Поиск новостей по названию дате и их вывод в сортированном порядке
- Просмотр новостей из различных источников
- Создание и управление сообществами
- Публикация новостей в сообществах

# Стек используемых технологий
- Trello
- Java
- Figma
- PostgreSQL
- Android Studio
- Flutter

### Организация клиент-серверного взаимодействия
Взаимодействие было реализовано через локальную сеть, поддерживаемая через hamachi/radmin vpn.
В клиентской части имеются функци registerUser и _login реализующее соответствующие функции приложения посредством http запросов (на сервере происходит обработка данных запросов посредством сервлетов). Имеется локализация на 4 языка: русский, английский, китайский, а также японский, реализован поиск и вывод новостей, имеется реализация создания новости, однако функция требует корректировки. Также реализован вывод новости и сделан шаблон для вывода комментариев, однако требует доработки. Присутствует логирование при работе.


# Ссылка на прототипы страниц.
https://www.figma.com/design/TekU1LHLdZ8WZ8tLDXXMHj/Site%E3%80%80phone?node-id=27-2&node-type=canvas&t=B3eVgBU5XN5bqh3E-0

# ссылку на API сервера.
В репозитории backend части проекта имеется описание и само api сервера:
[https://github.com/zhenklchhh/backend-news-app/tree/main](https://github.com/zhenklchhh/server-newsapp)
