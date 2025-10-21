#!/bin/bash
python3 << EOF

purchases = [
    {"item": "apple", "category": "fruit", "price": 1.2, "quantity": 10},
    {"item": "banana", "category": "fruit", "price": 0.5, "quantity": 5},
    {"item": "milk", "category": "dairy", "price": 1.5, "quantity": 2},
    {"item": "bread", "category": "bakery", "price": 2.0, "quantity": 3},
]

def total_revenue(x):
    total = 0
    for i in range(len(x)):
        total += x[i]["price"] * x[i]["quantity"]
    return total

def items_by_category(x):
    category_count = {}
    for i in range(len(x)):
        key = x[i]["category"]
        item = x[i]["item"]
        if key not in category_count:
            category_count[key] = set()
        category_count[key].add(item)
    return category_count
 
def min_prices(x):
    min_price = x[0]["price"]
    for i in range(1, len(x)):
        next_price = x[i]["price"]
        if next_price < min_price:
            min_price = next_price
    return min_price

min_price = min_prices(purchases)

def expensive_purchases(x, min_price):
    result = []
    for i in range(len(x)):
        price = x[i]["price"]
        if price > min_price:
            result.append(x[i])
    return result
    
def average_price_by_category(x):
    category_count = {}
    for i in range(len(x)):
        key = x[i]["category"]
        price = x[i]["price"]
        if key not in category_count:
            category_count[key] = []
        category_count[key].append(price)
    for i in category_count:
        price =category_count[i]
        category_count[i] = sum(price) / len(price)
    return category_count

def most_frequent_category(x):
    category_count = {}
    for i in range(len(x)):
        key = x[i]["category"]
        quantity = x[i]["quantity"]
        if key not in category_count:
            category_count[key] = []
        category_count[key].append(quantity)
    for i in category_count:
        quant = category_count[i]
        category_count[i] = sum(quant)
    result = max(category_count, key = category_count.get)
    return result

print(f"Общая выручка: {total_revenue(purchases)}")
print(f"Товары по категориям: {items_by_category(purchases)}")
print(f"Покупки дороже {min_price}: {expensive_purchases(purchases, min_price)}")
print(f"Средняя цена по категориям: {average_price_by_category(purchases)}")
print(f"Категория с наибольшим количеством проданных товаров: {most_frequent_category(purchases)}")
EOF