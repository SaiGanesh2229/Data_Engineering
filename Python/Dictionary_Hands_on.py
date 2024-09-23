#Exercise-1: Create a dictionary
person={
    "Name": "Alice",
    "Age": 25,
    "City": "New York"
}

print(person)

#Exercise-2: Access the elements in the dictionary
# 1.  Access the value of the "Name" key
print(person["Name"])
# 2. Access the value of the "City" key
print(person["City"])

#Exercise-3 Add and Modify Elements
# 1. Add a new key-value pair
person["Email"]="alice@example.com"
# 2. Change the value of the "Age" Key
person["Age"]=26
# 3. Print the modified Dictionary
print("Modified dictionary : ",person)

#Exercise-4: Remove Elements
# 1. Remove the "City" key
person.pop("City")
# 2. Print the dictionary after removing the key
print("Dictionary after removing key: ",person)

#Exercise-5: Check if a key exists
# 1. Check if the "email" key exists
if "Email" in person:
    print("The key 'Email' exists in the dictionary.")
else:
    print("The key 'Email' does not exist in the dictionary.")
# 2. Check if the "phone" key exists
if "phone" in person:
    print("The key 'phone' exists in the dictionary.")
else:
    print("The key 'phone' does not exist in the dictionary.")

#Exercise-6: Loop through a dictionary
# 1. Iterate over the dictionary and print each key-value pair
for key, value in person.items():
    print(f"{key}: {value}")
# 2. Iterate over the keys of the dictionary and print each key
for key in person.keys():
    print(key)
# 3. Iterate over the values of the dictionary and print each value
for value in person.values():
    print(value)

#Exercise-7: Nested dictionaries
# 1. Create the nested dictionary
employees = {
    101: {"name": "Bob", "job": "Engineer"},
    102: {"name": "Sue", "job": "Designer"},
    103: {"name": "Tom", "job": "Manager"}
}
# 2. Print the details of employee with ID 102
print(employees[102])
# 3. Add a new employee with ID 104
employees[104] = {"name": "Linda", "job": "HR"}
# 4. Print the updated dictionary
print("Updated dictionary: ",employees)

#Exercise-8:  Dictionary Comprehension
# 1. Create a dictionary comprehension
squares = {x: x**2 for x in range(1, 6)}
# 2. Print the generated dictionary
print(squares)

#Exercise-9: Merge two dictionaries
# 1. Create the two dictionaries
dict1 = {"a": 1, "b": 2}
dict2 = {"c": 3, "d": 4}
# 2. Merge dict2 into dict1
dict1.update(dict2)
# 3. Print the result
print("Merged dictionary: ",dict1)

#Exercise-10: Default dictionary values
# 1. Create the dictionary
letters_to_numbers = {"a": 1, "b": 2, "c": 3}
# 2. Use the get() method to retrieve the value of key "b"
print(letters_to_numbers.get("b"))
# 3. Use the get() method to retrieve the value of a non-existing key "d"
print(letters_to_numbers.get("d", 0))

#Exercise-11: Dictionary from two lists
# 1. Given two lists
keys=["name","age","city"]
values=["Eve",29,"San Francisco"]
# 2. Create dictionary by pairing two values
resulting_dict=dict(zip(keys,values))
#print the result dictionary
print("Result dictionary: ",resulting_dict)

#Exercise-12: Count occurrences of words
sentence="the quick brown fox jumps over the lazy dog the fox"
#2. Split the sentence into words
words=sentence.split()
#3.Create a dictionary to count occurrences
word_count={}
for word in words:
    if word in word_count:
        word_count[word]+=1
    else:
        word_count[word]=1

# 4. print the dictionary showing word counts
print("word counts: ",word_count)