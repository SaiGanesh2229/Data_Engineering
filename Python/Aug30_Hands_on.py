# Exercise-5: Handling missing values
# 1. Create a dataframe with missing values
import pandas as pd
data={
    "Name": ["Amit","Neha","Raj","Priya"],
    "Age": [28,None, 35,29],
    "City":["Delhi","Mumbai",None,"Chennai"]
}
df=pd.DataFrame(data)
print(df)
# 2. Fill the missing column age with Average age
average_age=df['Age'].mean()
df.fillna({'Age':average_age},inplace=True)
print(df)
#Drop rows where any column has missing data
df_dropped=df.dropna()
print(df_dropped)

# Exercise-6: Adding and Removing columns
# 1. Add a new column 'Salary' with the values
df['Salary']=[50000,60000,70000,65000]
print(df)
# 2. Remove the city column from the dataframe
df.drop('City',axis=1,inplace=True)
print(df)

# Exercise-7: Sorting Data
# 1. Sort the dataframe by "Age" in ascending order
df_sorted_by_age = df.sort_values(by='Age',ascending=True)
print(df_sorted_by_age)
# 2. Sort the dataframe first by "City" and then by "Age" in descending order
df_sorted_by_city=df.sort_values(by="City",ascending=False)
print(df_sorted_by_city)
df_sorted_by_Age=df.sort_values(by="Age",ascending=False)
print(df_sorted_by_Age)

# Exercise-8: Grouping and Aggregation
# 1. Group the DataFrame by "City" and calculate the average "Age" for each city
df_grouped_by_city=df.groupby('City')['Age'].mean()
print(df_grouped_by_city)
# 2. Group the DataFrame by "City" and "Age", and count the number of occurrences for each group
df_grouped_by_city_and_age = df.groupby(['City', 'Age']).size()
print(df_grouped_by_city_and_age)

# Exercise-9: Merging Dataframes
# 1. Create two dataframes
df1 = pd.DataFrame({
    "Name": ["Amit", "Neha", "Raj"],
    "Department": ["HR", "IT", "Finance"]
})
df2 = pd.DataFrame({
    "Name": ["Neha", "Raj", "Priya"],
    "Salary": [60000, 70000, 65000]
})
# 2. Merge df1 and df2 on the 'Name' column using an inner join
df_inner=pd.merge(df1,df2,on="Name",how='inner')
print(df_inner)
# 3. Merge the same Dataframes using a left join
df_left=pd.merge(df1, df2, on='Name', how='left')
print(df_left)