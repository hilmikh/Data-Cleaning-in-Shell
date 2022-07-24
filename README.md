# Data-Cleaning-in-Shell

# Project Purpose
The purpose of this project is to fulfill the 4th assignment for the sql/shell subject in pacmann data analyst bootcamp program

# Task
The task of this assignment is to clean e-commerce traffic data for period October 2019 and November 2019 by using tools namely Bash and csvkit and save the command in .sh file.
The cleaning task is composed as several task including:
1. Merging two csv file (october file and november file) into one.
  - This task performed by using csvstack command:
    csvstack 2019-Oct-sample.csv 2019-Nov-sample.csv > csvstack.csv
    - result:
    ![alt text](https://github.com/hilmikh/Data-Cleaning-in-Shell/blob/main/Screenshot/res_csvstack.png)
2. Filtering relevant column for product analysis purposes:
  - This task performed by using csvcut command:
    - csvcut -c event_time,event_type,product_id,category_id,brand,price,category_code csvstack.csv > csvcut.csv
    - This command will filter the column which relevant for product analysis purposes as seen in the screenshot below, result:
    ![alt text](https://github.com/hilmikh/Data-Cleaning-in-Shell/blob/main/Screenshot/res_csvcut.png)
3. Filtering event_type column to only purchasing activity
  - This task performed by using csvgrep command:
    - csvgrep -c event_type -m purchase csvcut.csv > csvgrep.csv
    - result:
    ![alt text](https://github.com/hilmikh/Data-Cleaning-in-Shell/blob/main/Screenshot/res_csvgrep.png)
4. Performing data/column splitting for category_code column into category and product_code
  - This task performed by using csvsql which able to receive sql command:
    - csvsql --query "SELECT event_time,event_type,product_id,category_id,brand,price, SUBSTR(category_code,1,INSTR(category_code,'.')-1) as category,           SUBSTR(category_code, INSTR(category_code,'.')+1, LENGTH(category_code)) as product_name FROM csvgrep" csvgrep.csv > csvsql1.csv
     - result:
    ![alt text](https://github.com/hilmikh/Data-Cleaning-in-Shell/blob/main/Screenshot/res_csvsql1.png)
    - csvsql --query "SELECT event_time,event_type,product_id,category_id,brand,price,category,         SUBSTR(product_name, INSTR(product_name,'.')+1, LENGTH(product_name)) as product_name FROM csvsql1" csvsql1.csv > csvfinal.csv
     - result:
    ![alt text](https://github.com/hilmikh/Data-Cleaning-in-Shell/blob/main/Screenshot/res_csvsql2.png)
5. Delete unnecessary data
  - As the cleaning finished, the unnecessary datas are deleted using rm command:
  rm csvstack.csv csvcut.csv csvgrep.csv csvsql1.csv
6. Create bash script for command above using editor started with shebang

# How to Run
Open terminal and start the ShellCleaner.sh file via terminal, change the execute permission if necessary using chmod.
*.* Make sure the script are in the same directory as the raw data.



