### JSON Exercises
# Exercise-1: Reading a JSON file

# 1.Create a JSON file named 'data.json'
import json
data={
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "skills": ["Python", "Machine Learning", "Data Analysis"]
}
with open("C:/Users/sai ganesh/Documents/data.json","w") as file:
    json.dump(data,file)

# 2.Write a Python script to read and print the contents of the JSON file.
import json
with open('C:/Users/sai ganesh/Documents/data.json', 'r') as file:
    data = json.load(file)
print(data)


# Exercise-2: Writing to a JSON file
# 1.Create a Python dictionary representing a person's profile
profile={
    "name":"Jane Smith",
    "age": 28,
    "city": "Los Angeles",
    "hobbies": ["Photography","Travelling","Reading"]
}
# Python script to save this data to a JSON file named profile.json
with open("C:/Users/sai ganesh/Documents/profile.json","w") as file:
    json.dump(data,file)


# Exercise-3: Converting CSV to JSON
# 1. Python script to read 'students.csv' and convert the data to a list of dictionaries
import csv
import json
students=[]
with open("C:/Users/sai ganesh/Documents/students.csv","r") as file:
    reader=csv.DictReader(file)
    for row in reader:
        students.append(row)

# save the list of dictionaries to a JSON file
with open('C:/Users/sai ganesh/Documents/students.csv',"w") as json_file:
    json.dump(students,json_file)


# Exercise-4: Converting JSON to CSV
# 1. Python script to read data.json, convert it to CSV format, and write it to a file named data.csv
import json
import csv
# Read the JSON file
with open('C:/Users/sai ganesh/Documents/data.json', 'r') as json_file:
    data = json.load(json_file)
# Write to CSV file
with open('C:/Users/sai ganesh/Documents/data.csv', 'w') as csv_file:
    writer = csv.writer(csv_file)
    writer.writerow(data.keys())
    writer.writerow(data.values())


# Exercise-5: Nested JSON Parsing
# 1. Create a JSON file named books.json
import json
books_data={
    "books": [
        {"title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "year": 1925},
        {"title": "War and Peace", "author": "Leo Tolstoy", "year": 1869},
        {"title": "The Catcher in the Rye", "author": "J.D. Salinger", "year": 1951}
    ]
}
with open("C:/Users/sai ganesh/Documents/books.json","w") as file:
    json.dump(books_data,file)

# 2. Python script to read the JSON file and print the title of each book
import json
with open('C:/Users/sai ganesh/Documents/books.json', 'r') as file:
    data = json.load(file)
for book in data['books']:
    print(book['title'])