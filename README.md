# Data-Cleaning-in-Shell

# Project Purpose
The purpose of this project is to fulfill the 4th assignment for the sql/shell subject in pacmann data analyst bootcamp program

# Task
The task of this assignment is to clean e-commerce traffic data for period October 2019 and November 2019 by using tools namely Bash and csvkit and save the command in .sh file.
The cleaning task is composed as several task including:
1. Merging two csv file (october file and november file) into one.
  -This task performed by using csvstack command:
  ![alt text](https://github.com/hilmikh/Data-Cleaning-in-Shell/blob/main/Screenshot/csvstack.png)
2. Filtering relevant column for product analysis purposes:
  -This task performed by using csvcut command:
   ![alt text](https://github.com/hilmikh/Data-Cleaning-in-Shell/blob/main/Screenshot/csvcut.png)
  -This command will filter the column which relevant for product analysis purposes as seen in th screenshot below:
3. Filtering event_type column to only purchasing activity
  -This task performed by using csvgrep command:
  ![alt text](https://github.com/hilmikh/Data-Cleaning-in-Shell/blob/main/Screenshot/csvgrep.png)
4. Performing data/column splitting for category_code column into category and product_code
  -This task performed by using csvsql which able to receive sql command:
  ![alt text](https://github.com/hilmikh/Data-Cleaning-in-Shell/blob/main/Screenshot/csvsql.png)
5. Delete unnecessary data
  -As the cleaning finished, the unnecessary datas are deleted using rm command:
  ![alt text](https://github.com/hilmikh/Data-Cleaning-in-Shell/blob/main/Screenshot/delete.png)
6. Create bash script for command above using editor:

