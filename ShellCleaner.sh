#!/bin/bash

csvstack 2019-Oct-sample.csv 2019-Nov-sample.csv > csvstack.csv

csvcut -c event_time,event_type,product_id,category_id,brand,price,category_code csvstack.csv > csvcut.csv

csvgrep -c event_type -m purchase csvcut.csv > csvgrep.csv

csvsql --query "SELECT event_time,event_type,product_id,category_id,brand,price,SUBSTR(category_code,1,INSTR(category_code,'.')-1) as category, SUBSTR(category_code, INSTR(category_code,'.')+1, LENGTH(category_code)) as product_name FROM csvgrep" csvgrep.csv > csvsql1.csv
csvsql --query "SELECT event_time,event_type,product_id,category_id,brand,price,category, SUBSTR(product_name, INSTR(product_name,'.')+1, LENGTH(product_name)) as product_name FROM csvsql1" csvsql1.csv > data_clean.csv

rm csvstack.csv csvcut.csv csvgrep.csv csvsql1.csv
