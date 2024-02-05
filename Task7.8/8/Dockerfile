# Используйте официальный образ Python
FROM python:3.8-slim

# Установка необходимых библиотек
RUN pip install --no-cache-dir requests beautifulsoup4

# Создание непривилегированного пользователя
RUN groupadd -r app && useradd -r -g app app
USER app

# Копирование приложения в контейнер
COPY app.py /app/app.py

# Установка рабочей директории
WORKDIR /app

# Создание каталога для сохранения favicon
RUN mkdir output

# Запуск приложения при старте контейнера
CMD ["python", "app.py"]