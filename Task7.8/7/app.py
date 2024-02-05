import csv
from flask import Flask, render_template
import pandas as pd

# Открываем файл
with open('lego_data.csv', mode='r') as file:
    # Создаем объект для чтения CSV
    reader = csv.reader(file)

    # Пропускаем заголовок
    next(reader)

    # Читаем и обрабатываем данные
    for row in reader:
        print(row)
        # Пример обработки данных: выводим название и цену каждого набора
        toy_name = row[0]
        price = row[2]
        print(f"Набор: {toy_name}, Цена: {price}")

# Читаем CSV-файл в DataFrame
df = pd.read_csv('lego_data.csv')

# Выводим первые 5 строк
print(df.head(15))

# Выполняем операции с данными
# Например, фильтруем наборы, у которых цена больше $1000
# filtered_df = df[df['price'] > 1000]
# print(filtered_df)