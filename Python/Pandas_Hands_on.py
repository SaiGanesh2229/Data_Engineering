import pandas as pd
# creating a new dataset
data={
    "Employee_ID": [101, 102, 103, 104, 105, 106],
    "Name": ["Rajesh", "Meena", "Suresh", "Anita", "Vijay", "Neeta"],
    "Department": ["HR", "IT", "Finance", "IT", "Finance", "HR"],
    "Age": [29, 35, 45, 32, 50, 28],
    "Salary": [70000, 85000, 95000, 64000, 120000, 72000],
    "City": ["Delhi", "Mumbai", "Bangalore", "Chennai", "Delhi", "Mumbai"]
}
df=pd.DataFrame(data)
print(df)

# Exercise-1: Rename Columns
# 1. Rename the "Salary" column to "Annual Salary" and "City" to "Location".
df_renamed=df.rename(columns={"Salary":"Annual Salary","City":"Location"})
# 2. Print the updated DataFrame.
print(df_renamed)

# Exercise-2: Drop Columns
# 1. Drop the "Location" column from the dataframe
df_dropped=df_renamed.drop(columns=["Location"])
# 2. print the dataframe after dropping the column
print(df_dropped)

# Exercise-3: Drop Rows
# 1. Drop the row where "Name" is "Suresh".
df_drop_row=df[df["Name"] != "Suresh"]
# 2. Print the updated DataFrame
print(df_drop_row)

# Exercise-4: Handle missing data
# 1. Assign None to the "Salary" of "Meena"
df.loc[df["Name"]=="Meena", "Salary"]=None
print(df)
# 2. Fill the missing "Salary" value with the mean salary of the existing employees.
mean_salary=df["Salary"].mean()
df.fillna({"Salary":mean_salary}, inplace=True)
print(df)

# Exercise-5: Create conditional columns
# 1. Create a new column "Seniority"
# that assigns "Senior" to employees aged 40 or above and "Junior" to employees younger than 40.
df['Seniority']=df['Age'].apply(lambda x: 'Senior' if x>=40 else 'Junior')
print(df)

# Exercise-6: Grouping and Aggregation
# 1.Group the DataFrame by "Department" and calculate the average salary in each department.
grouped_df = df.groupby("Department")["Salary"].mean().reset_index()
grouped_df.rename(columns={"Salary": "Average Salary"})
print(grouped_df)
