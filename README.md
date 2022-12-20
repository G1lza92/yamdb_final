[![Django-app workflow](https://github.com/G1lza92/yamdb_final/actions/workflows/yamdb_workflow.yml/badge.svg)](https://github.com/G1lza92/yamdb_final/actions/workflows/yamdb_workflow.yml)

# Групповой роект «API для YaMDb»
## Описание:
Проект YaMDb собирает отзывы пользователей на произведения. Произведения делятся на категории: «Книги», «Фильмы», «Музыка».
Сами произведения в YaMDb не хранятся, здесь нельзя посмотреть фильм или послушать музыку.
В каждой категории есть произведения: книги, фильмы или музыка.
Произведению может быть присвоен жанр из списка предустановленных. Новые жанры может создавать только администратор.
Благодарные или возмущённые пользователи оставляют к произведениям текстовые отзывы и ставят произведению оценку в диапазоне от одного до десяти; из пользовательских оценок формируется усреднённая оценка произведения — рейтинг. На одно произведение пользователь может оставить только один отзыв.
## Установка:
### После клонирования репрозитория:
* В директории infra создайте файл .env с переменными окружения для работы с базой данных (Образец файла .env.sample)
>
* Для запуска проекта выполните из директории с проектом команду
>
```sudo docker-compose up -d```
>
* Затем создайте суперпользователя
>
```sudo docker-compose exec web python manage.py createsuperuser```
>
* Вы можете загрузить данные из дампа в базу, разместив файл fixtures.json в папке с Dockerfile
>
```sudo docker-compose exec web python manage.py loaddata fixtures.json```
>
* Вы также можете создать дамп (резервную копию) базы
>
```sudo docker-compose exec web python manage.py dumpdata > fixtures.json```
>
### Загрузка данных и CSV-файлов (./static/data/*.csv) 
```python manage.py load_data```
### Загрузка дынных без вывода в терминал
```python manage.py load_data -v 0```
>
### Пользовательские роли:
* Аноним — может просматривать описания произведений, читать отзывы и комментарии.
* Аутентифицированный пользователь (user) — может читать всё, как и Аноним, может публиковать отзывы и ставить оценки произведениям (фильмам/книгам/песенкам), может комментировать отзывы; может редактировать и удалять свои отзывы и комментарии, редактировать свои оценки произведений. Эта роль присваивается по умолчанию каждому новому пользователю.
* Модератор (moderator) — те же права, что и у Аутентифицированного пользователя, плюс право удалять и редактировать любые отзывы и комментарии.
* Администратор (admin) — полные права на управление всем контентом проекта. Может создавать и удалять произведения, категории и жанры. Может назначать роли пользователям.
* Суперюзер Django - обладает правами администратора (admin) 
>
### Регистрация нового пользователя:
```(POST) /api/v1/auth/signup/```
#### На email приходит confirmation_code для получения JWT-Token
```
{ 
    "email": "string",
    "username": "string"
}
```
>
### Получение JWT-token:
```(POST) /api/v1/auth/token/```
```
{
    "username": "string",
    "confirmation_code": "string"
}
```
### Более подробная документация со всеми адресами и доступными методами доступны по ссылкам, указанным ниже:
>
### Динамическая документация Swagger - [http://localhost:8000/swagger/](http://localhost:8000/swagger/)
>
### Спецификация ReDoc - [http://localhost:8000/redoc/](http://localhost:8000/redoc/)

## Использованные технологии/пакеты
* [Python 3.7](https://github.com/python)
* [Django 2.2.16](https://github.com/django/django)
* [PyJWT 2.1.0](https://github.com/jpadilla/pyjwt)
* [django-filter 2.4.0](https://github.com/carltongibson/django-filter)
* [djangorestframework 3.12.4](https://github.com/encode/django-rest-framework)
* [djangorestframework-simplejwt 4.7.2](https://github.com/jazzband/djangorestframework-simplejwt)
* [drf-yasg 1.21.3](https://github.com/axnsan12/drf-yasg)
* [requests 2.26.0](https://github.com/psf/requests)
* [PostgreSQL 13.0-alpine](https://github.com/postgres/postgres)
* [Nginx 1.21.3-alpine](https://www.nginx.com/)
* [Gunicorn](https://github.com/benoitc/gunicorn)
* [Docker 20.10.21, build baeda1f](https://github.com/docker)
* [Docker-compose 3.8](https://github.com/docker)

## Групповой проекта выполенен командой №21 коготры №41 курса "Backend developer"
* [Артем  Зимин](https://github.com/G1lza92)
* [Сергей Гриценко (team lead)](https://github.com/GritsenkoSerge/)
* [Марк Британов](https://github.com/M4rk-er)
### под руководством
* Олег Портнихин (наставник)
* Андрей Квичанский (ревьюер)
