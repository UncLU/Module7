# Используем базовый образ с Python 3
FROM python:3.11-slim

# Устанавливаем необходимые библиотеки
RUN pip install Flask psycopg2-binary

# Копируем код приложения и конфигурационный файл
COPY /srv/app/web.py /app/web.py
COPY /srv/app/conf/web.conf /app/conf/web.conf

# Рабочая директория
WORKDIR /app

# Команда для запуска приложения при старте контейнера
CMD ["python", "web.py"]