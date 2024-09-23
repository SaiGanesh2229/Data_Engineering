#Exercise-1: List Operations
# 1.Create the list
numbers=[1,2,3,4,5]
# 2. Append the number 6 to the list
numbers.append(6)
# 3. Remove the number 3 from the list
numbers.remove(3)
# 4. Insert the number 0 at the beginning of the list
numbers.insert(0, 0)
# 5. Print the final list
print("Final List: ",numbers)

#Exercise-2: Tuple Operations
# 1. Create the tuple
coordinates = (10.0, 20.0, 30.0)
# 2. Access and print the second element of the tuple
print("Second element: ",coordinates[1])
# 3. Try to change the third element of the tuple to 40.0
# coordinates[2]=40.0   -- TypeError: Tuple doesn't allow item assignment

#Exercise-3: Set Operations
# 1. Create the set
fruits = {"apple", "banana", "cherry"}
# 2. Add "orange" to the set
fruits.add("orange")
# 3. Remove "banana" from the set
fruits.remove("banana")
# 4. Check if "cherry" is in the set and print a message based on the result
if "cherry" in fruits:
    print("cherry is in the set.")
else:
    print("cherry is not in the set.")
# 5. Create another set called citrus
citrus = {"orange", "lemon", "lime"}
# 6. Perform a union of fruits and citrus
union_set = fruits.union(citrus)
print("Union of fruits and citrus:", union_set)
# 7. Perform an intersection of fruits and citrus
intersection_set = fruits.intersection(citrus)
print("Intersection of fruits and citrus:", intersection_set)

#Exercise-4: Dictionary Operations
# 1. Create the dictionary
person = {"name": "John", "age": 30, "city": "New York"}
# 2. Access and print the "name" key
print(person["name"])
# 3. Update the "age" key to 31
person["age"] = 31
# 4. Add a new key-value pair
person["email"] = "john@example.com"
# 5. Remove the "city" key from the dictionary
person.pop("city")
# 6. Print the final dictionary
print("Final dictionary: ",person)

#Exercise-5: Nested Dictionary
# 1. Create the nested dictionary
school = {
    "Alice": {"Math": 90, "Science": 85},
    "Bob": {"Math": 78, "Science": 92},
    "Charlie": {"Math": 95, "Science": 88}
}
# 2. Print the grade of "Alice" in "Math"
print("Alice Math grade: ", school["Alice"]["Math"])
# 3. Add a new student "David"
school["David"] = {"Math": 80, "Science": 89}
# 4. Update "Bob"'s "Science" grade to 95
school["Bob"]["Science"] = 95
# 5. Print the final school dictionary
print("Final School Dictionary: ",school)

#Exercise-6: List Comprehension
# 1. Given list of numbers
numbers = [1, 2, 3, 4, 5]
# 2. Create a new list with squared numbers using list comprehension
squared_numbers = [x**2 for x in numbers]
# 3. Print the new list
print("New list of Squared numbers are: ",squared_numbers)

#Exercise-7: Set Comprehension
# 1. Create a set comprehension to generate squared numbers
squared_set = {x**2 for x in [1, 2, 3, 4, 5]}
# 2. Print the resulting set
print("Resulting set: ",squared_set)

#Exercise-8: Dictionary comprehension
# 1. Create a dictionary comprehension for cubes
cubes_dict = {x: x**3 for x in range(1, 6)}
# 2. Print the resulting dictionary
print("Result of cubes dictionary: ",cubes_dict)

#Exercise-9: Combining collections
# 1. Create two lists
keys = ["name", "age", "city"]
values = ["Alice", 25, "Paris"]
# 2. Use zip() to combine them into a dictionary
combined_dict = dict(zip(keys, values))
# 3. Print the resulting dictionary
print("Result dictionary: ",combined_dict)

#Exercise-10: Count word occurrences(using a dictionary)
#1. Input sentence
sentence="the quick brown fox jumps over the lazy dog the fox"
# 2. Split sentence into words and count occurrences
word_count = {}
for word in sentence.split():
    word_count[word] = word_count.get(word, 0) + 1
# 3. Print the resulting dictionary with word counts
print("word count result dictionary: ",word_count)

#Exercise-11: Unique Elements in Two Sets
# 1. Create the two sets
set1 = {1, 2, 3, 4, 5}
set2 = {4, 5, 6, 7, 8}
# 2. Find and print the unique elements in both sets combined
unique_elements = set1.union(set2)
print("Unique elements:",unique_elements)
# 3. Find and print the common elements between the two sets
common_elements = set1.intersection(set2)
print("Common elements:",common_elements)
# 4. Find and print the elements only in set1
only_in_set1 = set1.difference(set2)
print("Elements only in set1: ",only_in_set1)

#Exercise-12: Tuple Unpacking
# 1. Create a tuple with three elements
person_tuple = ("Alice", 25, "Paris")
# 2. Unpack the tuple into three variables
name, age, city = person_tuple
# 3. Print the variables to verify the unpacking
print("Name: ",name)
print("Age: ",age)
print("City: ",city)

#Exercise-13: Frequency Counter with Dictionary
# 1. Example string
text = "hello world"
# 2. Count the frequency of each letter
letter_count = {}
for letter in text:
    if letter != " ":  # Ignore spaces
        letter_count[letter] = letter_count.get(letter, 0) + 1
# 3. Print the resulting dictionary with letter frequencies
print("Total letter frequencies: ",letter_count)

#Exercise-14: Sorting a List of Tuples
# 1. Given list of students and their grades
students = [("Alice", 90), ("Bob", 80), ("Charlie", 85)]
# 2. Sort the list by grades in descending order
sorted_students = sorted(students, key=lambda x: x[1], reverse=True)
# 3. Print the sorted list
print("Final sorted list: ",sorted_students)