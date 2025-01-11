my first time using github, gitbash, vscode, git



notes: 

folders = directories

you can find where a folder or file is by using command "find -name <item you want to find>"
you can use find to find the folder trees

mv can be used to rename and also move things 

you can move folders by staying in the same folder and then use find to find where it is, you copy that and then use that as the first parameter, and then use the directory of where you want to move it as the second parameter. the "./" is needed and is important!

rm can be remove files, but you must use rmdir to remove directories

put path before file name to place it into where you want it to go when using touch when creating a file. example: "touch client/assets/fonts/roboto-bold.woff" this is adding a new font "roboto-bold.woff" into the fonts folder(directory)


rmdik is used to remove directories, but it must be empty, however you can use a -r flag that remove directories and their contents recursively. Using this removes the content inside the directories but the content inside does not go into the trash, it's just gone. must be careful when using -r

you can directly add text to files by "echo <message> >> <file>"

you can use -r flag on copy ("cp") to copy the entire file. "cp -r <what is being copied> <where it is being pasted to>". No need to make a new folder, since cp and mkdir goes together








psql

Database > Schema > Table > Column > Row






you start with "psql --username=freecodecamp --dbname=postgres". this shows what your username is when connecting to databases


commands must end with semi colon;

to make a data base we use CREATE DATABASE 


command to list is " \l "

you can connect to databases by \c

\d can be used to show tables.

you can create tables by using"

CREATE TABLE table_name();

parenthesis are needed. you create a table in the database that youre connected to

table is shown like this:

               List of relations
+--------+-------------+-------+--------------+
| Schema |    Name     | Type  |    Owner     |
+--------+-------------+-------+--------------+
| public | first_table | table | freecodecamp |
+--------+-------------+-------+--------------+
(1 row)

owner is when you log in with "sql --username=freecodecamp --dbname=postgres", the tpe is the a table because we made a table, the name is what you chose.

you can view more information about a table by adding the table name after \d, looks like this: 

           Table "public.second_table"
+--------+------+-----------+----------+---------+
| Column | Type | Collation | Nullable | Default |
+--------+------+-----------+----------+---------+
+--------+------+-----------+----------+---------+

tables need columns to describe the data in them. you can add a column by using the command:
ALTER TABLE table_name ADD COLUMN column_name DATATYPE;

you can add constraits when adding columns by putting it right after the data type, example of constrait is "NOT NULL"


to remove columns, you use command:
ALTER TABLE table_name DROP COLUMN column_name;

a common data type is VARCHAR. it is a short string of characters. you need to give it a maximum length, by doing something like this: VARCHAR(30)

when added, it will show up like "character varying(30)". the 30 means that it can be a max of 30 characters.


to rename a column, you use command:
ALTER TABLE table_name RENAME COLUMN column_name TO new_name;

rows are the actual data in the table. You can add one by using command:
INSERT INTO table_name(column_1, column_2) VALUES(value1, value2);
you must put the values in ' ' if the data type is a VARCHAR. also, it cant be " ". must be ' '.
there can be as many columns or values as possible, not limited to 2.


to view the columns, you use command:
SELECT columns FROM table_name;

to select all columns, you can use *

it looks like this:

second_database=>          
+----+----------+
| id | username |
+----+----------+
|  1 | Samus    |
+----+----------+
(1 row)

to delete a row, you use command:
DELETE FROM table_name WHERE condition;

example of condition can be "username='Luigi'"


you can delete a table by running command:
DROP TABLE table_name;

you can rename databases by running command:
ALTER DATABASE database_name RENAME TO new_database_name;

you can drop databases (disconnecting) by using command:
DROP DATABASE the_database_disconnecting_from;



the data type SERIAL will automatically go up in the columns, very useful for ids.


we can add multiple rows at once, example:
INSERT INTO characters(name, homeland, favorite_color)
VALUES('Mario', 'Mushroom Kingdom', 'Red'),
('Luigi', 'Mushroom Kingdom', 'Green'),
('Peach', 'Mushroom Kingdom', 'Pink');




you can change a value from a column by using command:
UPDATE table_name SET column_name=new_value WHERE condition;


you can use this command to order the columns in a certain way:
SELECT columns FROM table_name ORDER BY column_name;


pimary key is a column that uniquely identifies each row in a table. you can add a primary key by using the command:
ALTER TABLE table_name ADD PRIMARY KEY(column_name);
it looks like this:

Indexes:
    "characters_pkey" PRIMARY KEY, btree (name)

you can remove a drop constraint by using command:
ALTER TABLE table_name DROP CONSTRAINT constraint_name;

primary key is a type of constraint



data type NUMERIC(4, 1) means the total number of digits (before and after the decimal) cannot exceed 4, and only 1 digit is allowed after the decimal point.







ALTER TABLE table_name ADD COLUMN column_name DATATYPE REFERENCES referenced_table_name(referenced_column_name);

What This Does:
Adds a new column to the table_name.
This new column will reference a column (referenced_column_name) in another table (referenced_table_name), establishing a relationship between the two tables.
This foreign key constraint ensures referential integrity, meaning values in the new column must match values in the referenced column, or be NULL.



ALTER TABLE table_name ADD UNIQUE(column_name);
What this Does:
Adds the "UNIQUE" constraint to the column 


ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;
What this does:
Adds the "NOT NULL" constraint 





example of foreign key in play:
The more_info table has a column named character_id, which acts as a foreign key.
This foreign key refers to the character_id in the characters table.

This maintains referential integrity between the two tables, meaning that you can't insert a character_id into more_info unless that character_id already exists in the characters table.



Summary of Relationships:
One-to-one: Each character in the characters table can have one unique corresponding entry in the more_info table (via the character_id).
Foreign Key: more_info.character_id references characters.character_id to ensure data consistency.




                                             Table "public.characters"
+----------------+-----------------------+-----------+----------+--------------------------------------------------+
|     Column     |         Type          | Collation | Nullable |                     Default                      |
+----------------+-----------------------+-----------+----------+--------------------------------------------------+
| character_id   | integer               |           | not null | nextval('characters_character_id_seq'::regclass) |
| name           | character varying(30) |           | not null |                                                  |
| homeland       | character varying(60) |           |          |                                                  |
| favorite_color | character varying(30) |           |          |                                                  |
| more_info_id   | integer               |           | not null | nextval('characters_more_info_id_seq'::regclass) |
+----------------+-----------------------+-----------+----------+--------------------------------------------------+
Indexes:
    "characters_pkey" PRIMARY KEY, btree (character_id)
Referenced by:
    TABLE "more_info" CONSTRAINT "more_info_character_id_fkey" FOREIGN KEY (character_id) REFERENCES characters(character_id)

mario_database=> \d more_info
                                        Table "public.more_info"
+--------------+--------------+-----------+----------+-------------------------------------------------+
|    Column    |     Type     | Collation | Nullable |                     Default                     |
+--------------+--------------+-----------+----------+-------------------------------------------------+
| more_info_id | integer      |           | not null | nextval('more_info_more_info_id_seq'::regclass) |
| birthday     | date         |           |          |                                                 |
| height       | integer      |           |          |                                                 |
| weight       | numeric(4,1) |           |          |                                                 |
| character_id | integer      |           | not null |                                                 |
+--------------+--------------+-----------+----------+-------------------------------------------------+
Indexes:
    "more_info_pkey" PRIMARY KEY, btree (more_info_id)
    "more_info_character_id_key" UNIQUE CONSTRAINT, btree (character_id)
Foreign-key constraints:
    "more_info_character_id_fkey" FOREIGN KEY (character_id) REFERENCES characters(character_id)




you can find specific by setting conditions:
SELECT columns FROM table_name WHERE condition;


you can add columns for a table while creating a table like this:
CREATE TABLE table_name(column_name DATATYPE CONSTRAINTS);








one to many database means that one id can have multiple files or other information.



PostgreSQL
├── Database
│   ├── CREATE DATABASE
│   ├── List Databases: \l
│   ├── Connect to Database: \c
│   ├── Rename Database: ALTER DATABASE database_name RENAME TO new_database_name
│   ├── Drop Database (disconnect): DROP DATABASE database_name
│   └── Show Database Details: sql --username=freecodecamp --dbname=postgres
├── Schema
│   ├── Tables
│   │   ├── CREATE TABLE table_name (columns)
│   │   ├── Show Tables: \d
│   │   ├── Drop Table: DROP TABLE table_name
│   │   └── Rename Table: ALTER TABLE table_name RENAME TO new_table_name
│   ├── Columns
│   │   ├── CREATE COLUMN: ALTER TABLE table_name ADD COLUMN column_name DATATYPE
│   │   ├── Modify Column: ALTER TABLE table_name ALTER COLUMN column_name SET CONSTRAINT
│   │   ├── Rename Column: ALTER TABLE table_name RENAME COLUMN column_name TO new_column_name
│   │   ├── Drop Column: ALTER TABLE table_name DROP COLUMN column_name
│   │   └── Constraints on Columns
│   │       ├── NOT NULL
│   │       ├── UNIQUE
│   │       ├── PRIMARY KEY
│   │       ├── FOREIGN KEY REFERENCES table_name(column_name)
│   │       └── SERIAL
│   ├── Data Types
│   │   ├── VARCHAR(size) (e.g., VARCHAR(30))
│   │   ├── SERIAL (auto-incrementing)
│   │   ├── NUMERIC(precision, scale) (e.g., NUMERIC(4, 1))
│   │   ├── DATE
│   │   └── INTEGER
              BOOLEANS: can be true or false, you can also set default values by saying DEFAULT in front of them
│   ├── Rows
│   │   ├── Insert Data: INSERT INTO table_name (columns) VALUES (values)
│   │   ├── Example: INSERT INTO characters(name, homeland, favorite_color) VALUES('Mario', 'Mushroom Kingdom', 'Red')
│   │   ├── Select Data: SELECT columns FROM table_name
│   │   ├── Select All Data: SELECT * FROM table_name
│   │   ├── Delete Data: DELETE FROM table_name WHERE condition
│   │   │   └── Example: DELETE FROM table_name WHERE username='Luigi'
│   │   ├── Update Data: UPDATE table_name SET column_name = new_value WHERE condition
│   │   └── Order Data: SELECT columns FROM table_name ORDER BY column_name
├── Constraints
│   ├── PRIMARY KEY (unique identifier for rows)
│   ├── FOREIGN KEY (links tables, ensures referential integrity)
│   ├── UNIQUE (ensures no duplicates in a column)
│   ├── NOT NULL (ensures data must be present)
│   └── REFERENCES (establishes foreign key relationships between tables)
├── Indexes
│   ├── PRIMARY KEY Indexes: characters_pkey
│   ├── UNIQUE Indexes: more_info_character_id_key
│   └── Foreign Key Indexes: more_info_character_id_fkey
├── Relationships
│   ├── One-to-One (e.g., each character in "characters" has one entry in "more_info")
│   ├── One-to-Many (e.g., one id can have multiple related rows)
│   └── Foreign Key
│       ├── Ensures referential integrity
│       └── Example: more_info.character_id references characters.character_id
├── Example Tables
│   ├── characters (Primary Table)
│   │   ├── Columns: character_id, name, homeland, favorite_color, more_info_id
│   │   ├── Constraints: character_id (Primary Key), more_info_id (foreign key to more_info)
│   │   └── Data Types: INTEGER, VARCHAR(30), VARCHAR(60)
│   ├── more_info (Related Table)
│   │   ├── Columns: more_info_id, birthday, height, weight, character_id
│   │   ├── Constraints: more_info_id (Primary Key), character_id (foreign key to characters)
│   │   └── Data Types: INTEGER, DATE, NUMERIC(4,1)
└── Special Commands and Tips
    ├── Commands must end with a semicolon
    ├── Use SQL commands to interact with PostgreSQL database
    ├── Default User: freecodecamp (for connecting to databases)
    ├── SERIAL type auto-increments column values (useful for primary keys)
    └── Use the following for altering database structure:
        ├── ALTER TABLE table_name ADD COLUMN column_name DATATYPE
        ├── ALTER TABLE table_name DROP COLUMN column_name
        ├── ALTER TABLE table_name RENAME COLUMN column_name TO new_name
        └── ALTER TABLE table_name ADD CONSTRAINT constraint_name
├── JOIN Command
│   ├── Joins combine rows from multiple tables based on a related column
│   ├── Syntax:
│   │   └── SELECT columns FROM table_1 JOIN table_2 ON table_1.primary_key_column = table_2.foreign_key_column;
│   ├── FULL JOIN (example):
│   │   └── SELECT columns FROM table_1 FULL JOIN table_2 ON table_1.primary_key_column = table_2.foreign_key_column;
│   ├── Many-to-Many Relationship
│   │   ├── Use a junction table to link two tables
│   │   ├── Command: 
│   │   │   └── SELECT columns FROM junction_table FULL JOIN table_1 ON junction_table.foreign_key_column = table_1.primary_key_column FULL JOIN table_2 ON junction_table.foreign_key_column = table_2.primary_key_column;
│   ├── Output Examples:
│   │   └── Character and Info Combined
│   │   └── Character, Action, and Info Combined (Many-to-Many)

"Many-to-many" relationships usually use a junction table to link two tables together, forming two "one-to-many" relationships

junction tables link 2 things


you can set an existing column as a foreign key by doing this:
ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES referenced_table(referenced_column);


Primary Key = Uniquely identifies a row in a table.
Foreign Key = Links a row in one table to a row in another table

every table should have a primary key.

a composite primary key is created from 2 columns.





The JOIN command in SQL is used to combine rows from two or more tables based on a related column between them. It's like bringing together data from multiple tables to make it easier to work with and analyze.

a join command:
SELECT columns FROM table_1 FULL JOIN table_2 ON table_1.primary_key_column = table_2.foreign_key_column;

example output:

+--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
| character_id |  name  |     homeland     | favorite_color | more_info_id |  birthday  | height_in_cm | weight_in_kg | character_id |
+--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+
|            2 | Luigi  | Mushroom Kingdom | Green          |            2 | 1983-07-14 |          175 |         48.8 |            2 |
|            3 | Peach  | Mushroom Kingdom | Pink           |            3 | 1985-10-18 |          173 |         52.2 |            3 |
|            7 | Yoshi  | Dinosaur Land    | Green          |            7 | 1990-04-13 |          162 |         59.1 |            7 |
|            6 | Daisy  | Sarasaland       | Orange         |            6 | 1989-07-31 |              |              |            6 |
|            1 | Mario  | Mushroom Kingdom | Red            |            1 | 1981-07-09 |          155 |         64.5 |            1 |
|            4 | Toad   | Mushroom Kingdom | Blue           |            4 | 1950-01-10 |           66 |         35.6 |            4 |
|            5 | Bowser | Koopa Kingdom    | Yellow         |            5 | 1990-10-29 |          258 |        300.0 |            5 |
+--------------+--------+------------------+----------------+--------------+------------+--------------+--------------+--------------+



many to many relationship by joining 3 tables.

command:

SELECT columns FROM junction_table
FULL JOIN table_1 ON junction_table.foreign_key_column = table_1.primary_key_column
FULL JOIN table_2 ON junction_table.foreign_key_column = table_2.primary_key_column;

example output: 
+--------------+-----------+--------------+--------+------------------+----------------+-----------+--------+
| character_id | action_id | character_id |  name  |     homeland     | favorite_color | action_id | action |
+--------------+-----------+--------------+--------+------------------+----------------+-----------+--------+
|            7 |         1 |            7 | Yoshi  | Dinosaur Land    | Green          |         1 | run    |
|            7 |         2 |            7 | Yoshi  | Dinosaur Land    | Green          |         2 | jump   |
|            7 |         3 |            7 | Yoshi  | Dinosaur Land    | Green          |         3 | duck   |
|            3 |         1 |            3 | Peach  | Mushroom Kingdom | Pink           |         1 | run    |
|            3 |         2 |            3 | Peach  | Mushroom Kingdom | Pink           |         2 | jump   |
|            3 |         3 |            3 | Peach  | Mushroom Kingdom | Pink           |         3 | duck   |
|            6 |         1 |            6 | Daisy  | Sarasaland       | Orange         |         1 | run    |
|            6 |         2 |            6 | Daisy  | Sarasaland       | Orange         |         2 | jump   |
|            6 |         3 |            6 | Daisy  | Sarasaland       | Orange         |         3 | duck   |
|            5 |         1 |            5 | Bowser | Koopa Kingdom    | Yellow         |         1 | run    |
|            5 |         2 |            5 | Bowser | Koopa Kingdom    | Yellow         |         2 | jump   |
|            5 |         3 |            5 | Bowser | Koopa Kingdom    | Yellow         |         3 | duck   |
|            4 |         1 |            4 | Toad   | Mushroom Kingdom | Blue           |         1 | run    |
|            4 |         2 |            4 | Toad   | Mushroom Kingdom | Blue           |         2 | jump   |
|            4 |         3 |            4 | Toad   | Mushroom Kingdom | Blue           |         3 | duck   |
|            2 |         1 |            2 | Luigi  | Mushroom Kingdom | Green          |         1 | run    |
|            2 |         2 |            2 | Luigi  | Mushroom Kingdom | Green          |         2 | jump   |
|            2 |         3 |            2 | Luigi  | Mushroom Kingdom | Green          |         3 | duck   |
|            1 |         1 |            1 | Mario  | Mushroom Kingdom | Red            |         1 | run    |
|            1 |         2 |            1 | Mario  | Mushroom Kingdom | Red            |         2 | jump   |
|            1 |         3 |            1 | Mario  | Mushroom Kingdom | Red            |         3 | duck   |
+--------------+-----------+--------------+--------+------------------+----------------+-----------+--------+
(21 rows)


example of adding primary key to non existing column
ALTER TABLE galaxy ADD COLUMN galaxy_id SERIAL PRIMARY KEY; 





scripting


you can use bash or sh to execute a script depending on which terminal you want them to go through
if you havea default terminal set, you use ./ in front of the file


you can find the absolute path by doing "which bash"
you can set default terminal by adding the absolute path of the terminal at the top of the script file, example like "#!/bin/bash" THIS IS called a "shebang"

-rw-r--r-- these are permissions

r means read, w means write, x means execute

chmod +x questionnaire.sh gives everyone executable permissinos

bash can have variable but there cant be spaces between = sign. also must have "" around values
you must place a $ in front of variables to use them
you can use * to select all variables
you can use the number of the variables to select that one specifically



must make variable first before you can use it. bash runs from top to bottom
you use "read variable_name" to store user input variables. it gets stored inside the variable

man stands for manual. you can use it to find more information about a command.

you can click ctrl+C to close a program if u dont want to input the values.


echo: Prints text to the terminal.
-e: Enables interpretation of backslash-escaped characters like \n for newlines.
"\n~~ Questionnaire ~~\n": The text being printed, with \n adding a blank line before and after "~~ Questionnaire ~~".

you can comment by adding # before script.
note: shebang starts with # but it isnt considered a comment, it is a special characters



example syntax of if statements in bash

if [[ CONDITION ]]
then
  STATEMENTS
else
  STATEMENTS
fi

You can compare integers inside the brackets ([[ ... ]]) of your if with -eq (equal), -ne (not equal), -lt (less than), -le (less than or equal), -gt (greater than), -ge (greater than or equal).

for example, you must use -le instead of <=





example: [[ 4 -ge 5 ]]; echo $?

you must print out the exit status of an expression if youre directly sending it into the terminal.
0= true, 0 means it has 0 errors, making it true
1= false


bash for loop syntax

for (( i = 10; i > 0; i-- ))
do
  echo $i
done

you can make multiline comments like this:

: '
  comment here
  more comment here
'

while loop syntax: 

while [[ CONDITION ]]
do
  STATEMENTS
done






you can use command printenv to view the enviroment variables of the shell


bash syntax for elif

if (( CONDITION ))
then
  STATEMENTS
elif [[ CONDITION ]]
then
  STATEMENTS
fi


this is a good example of the differences between (()) and [[]]:
they're used differently as seen below.


if (( NUMBER <= 15 ))
then
  echo $TEXT B:$NUMBER
elif [[ $NUMBER -le 30 ]]
then
  echo $TEXT I:$NUMBER
elif (( NUMBER < 46 ))
then 
  echo $TEXT N:$NUMBER
elif [[ $NUMBER -lt 61 ]]
then
  echo $TEXT G:$NUMBER
else
  echo $TEXT O:$NUMBER
fi



bash syntax creating function:
FUNCTION_NAME() {
  STATEMENTS
}

no need for $ before function when calling it


bash syntax creating until statement

until [[ CONDITION ]]
do
  STATEMENTS
done









bash syntax for creating case:

case EXPRESSION in
  PATTERN) STATEMENTS ;;
  PATTERN) STATEMENTS ;;
  PATTERN) STATEMENTS ;;
  *) STATEMENTS ;;
esac

example:
case $MAIN_MENU_SELECTION in  
    1) RENT_MENU ;;
    2) RETURN_MENU ;;
    3) EXIT ;; 
    *) MAIN_MENU ;;
  esac














  if [[ $1 ]]
then
  echo -e "\n$1"
fi

this checks if 

If the function is called with an argument, $1 holds the first argument passed.
If $1 exists, it prints the value of $1 with a preceding newline (\n)



















you can view the command's type by running command
type <command>





cat courses.csv | while IFS="," read MAJOR COURSE
do
  echo $MAJOR
done

this is an IFS, internal field seperator. in this case, it seperates two things if theres a comma there.
default IFS is a space.

for the example above, The while loop continues to process lines until the input from cat courses.csv is exhausted (i.e., no more lines to read). 

"|" Pipes content to the next command.



PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
This will allow you to query your database from your script. The important parts are the username, dbname, and the -c flag that is for running a single command and exiting. The rest of the flags are for formatting.

example of using that
INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")





if [[ -z $MAJOR_ID ]]
-z checks if it is empty






TRUNCATE deletes all rows from a table



example of dumping:

pg_dump --clean --create --inserts --username=freecodecamp students > students.sql

dump the database into a students.sql file. It will save all the commands needed to rebuild it. Take a quick look at the file when you are done.







SELECT MIN(<column>) FROM <table>

you can select specifics from table like this

you can even add up a column, or even get AVG (average)
SELECT SUM(major_id) FROM students; 



ROUND(<number_to_round>, <decimals_places>) you can round things to specific decimal places


students=> SELECT COUNT(*) FROM majors;
students=>      
+-------+
| count |
+-------+
|     7 |
+-------+

you can count the amount of rows something have

DISTINCT is a function that will show you only unique values. You can use it like this: DISTINCT(<column>)
GROUP BY can achieve the same results as DISTINCT, Here's an example of how to use GROUP BY: SELECT <column> FROM <table> GROUP BY <column>

but with GROUP BY you can add any of the aggregate functions (MIN, MAX, COUNT, etc) to it to find more information. For instance, if you wanted to see how many students were in each major 
You could use SELECT COUNT(*) FROM students GROUP BY major_id


You can rename a column with AS like this: SELECT <column> AS <new_column_name>



joining 2 tables linked with a foreign key 

SELECT * FROM <table_1> FULL JOIN <table_2> ON <table_1>.<foreign_key_column> = <table_2>.<foreign_key_column>;

The FULL JOIN you used will include all rows from both tables, whether or not they have a row using that foreign key in the other

A LEFT JOIN gets all rows from the left table, but only rows from the right table that are linked to from the left one

there is also a RIGHT JOIN and INNER JOIN


The INNER JOIN only returns rows if they have a value in the foreign key column of the opposite table.



A RIGHT JOIN (also called a RIGHT OUTER JOIN) includes:

All rows from the right table (students in this case).
Matching rows from the left table (majors).
If there is no match in the left table, the result will include NULL values for the columns from the left table.
2. The ON Clause:
The ON clause specifies the condition used to match rows from the two tables:

sql
Copy code
majors.major_id = students.major_id
This means rows from majors and students are joined where their major_id values match.



The SQL query:

sql
Copy code
SELECT * 
FROM majors 
RIGHT JOIN students 
ON majors.major_id = students.major_id;
is performing a RIGHT JOIN between two tables: majors and students, and selecting all columns from the resulting joined table.

Step-by-Step Explanation:
1. What is a RIGHT JOIN?
A RIGHT JOIN (also called a RIGHT OUTER JOIN) includes:

All rows from the right table (students in this case).
Matching rows from the left table (majors).
If there is no match in the left table, the result will include NULL values for the columns from the left table.
2. The ON Clause:
The ON clause specifies the condition used to match rows from the two tables:

sql
Copy code
majors.major_id = students.major_id
This means rows from majors and students are joined where their major_id values match.
3. Selecting *:
The SELECT * part means that all columns from both tables will be included in the result.

Example Scenario:
Table: majors
major_id	major_name
1	Computer Science
2	Mathematics
3	Biology
Table: students
student_id	student_name	major_id
101	Alice	1
102	Bob	2
103	Charlie	4
What Happens in the Query:
For each row in students, the query tries to find a matching row in majors where majors.major_id = students.major_id.

If a match is found, the columns from both tables are included in the result.

If no match is found, columns from the left table (majors) are filled with NULL.




you can use USING()

like this 
SELECT * FROM students FULL JOIN majors USING(major_id);

it's a shortcut way when there's a foreign key, so you dont need to type out the entire thing to join tables
however, 2 of the columns become 1 when using USING()


you can join 3 tables using this method:
SELECT * FROM <table_1> FULL JOIN <table_2> USING(<column>) FULL JOIN <table_3> USING(<column>)

you can join as many tables are you want this way...

















#!/bin/bash
#Info about my computer science students from students database


echo -e "\n~~ My Computer Science Students ~~\n"

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

echo -e "\nFirst name, last name, and GPA of students with a 4.0 GPA:"

echo "$($PSQL "SELECT first_name, last_name, gpa FROM students WHERE gpa = 4.0")"

echo -e "\nAll course names whose first letter is before 'D' in the alphabet:"

echo "$($PSQL "SELECT course FROM courses WHERE course < 'D'")"

echo -e "\nFirst name, last name, and GPA of students whose last name begins with an 'R' or after and have a GPA greater than 3.8 or less than 2.0:"

echo "$($PSQL "SELECT first_name, last_name, gpa FROM students WHERE last_name >= 'R' AND (gpa > 3.8 OR gpa < 2.0)")"

echo -e "\nLast name of students whose last name contains a case insensitive 'sa' or have an 'r' as the second to last letter:"

echo "$($PSQL "SELECT last_name FROM students WHERE last_name ILIKE '%sa%' OR last_name LIKE '%r_'")"

echo -e "\nFirst name, last name, and GPA of students who have not selected a major and either their first name begins with 'D' or they have a GPA greater than 3.0:"

echo "$($PSQL "SELECT first_name, last_name, gpa FROM students WHERE major_id IS NULL AND (first_name LIKE 'D%' OR gpa > 3.0)")"

echo -e "\nCourse name of the first five courses, in reverse alphabetical order, that have an 'e' as the second letter or end with an 's':"

echo "$($PSQL "SELECT course FROM courses WHERE course LIKE '_e%' OR course LIKE '%s' ORDER BY course DESC LIMIT 5")"

echo -e "\nAverage GPA of all students rounded to two decimal places:"

echo "$($PSQL "SELECT ROUND(AVG(gpa), 2) FROM students")"

echo -e "\nMajor ID, total number of students in a column named 'number_of_students', and average GPA rounded to two decimal places in a column name 'average_gpa', for each major ID in the students table having a student count greater than 1:"

echo "$($PSQL "SELECT major_id, COUNT(*) AS number_of_students, ROUND(AVG(gpa), 2) AS average_gpa FROM students GROUP BY major_id HAVING COUNT(*) > 1")"

echo -e "\nList of majors, in alphabetical order, that either no student is taking or has a student whose first name contains a case insensitive 'ma':"

echo "$($PSQL "SELECT major FROM majors FULL JOIN students ON majors.major_id = students.major_id WHERE first_name ILIKE '%ma%' OR student_id IS NULL ORDER BY major")"

echo -e "\nList of unique courses, in reverse alphabetical order, that no student or 'Obie Hilpert' is taking:"

echo "$($PSQL "SELECT DISTINCT course FROM courses FULL JOIN majors_courses USING(course_id) FULL JOIN students USING(major_id) WHERE student_id IS NULL OR first_name = 'Obie' ORDER BY course DESC")"

echo -e "\nList of courses, in alphabetical order, with only one student enrolled:"

echo "$($PSQL "SELECT course FROM courses FULL JOIN majors_courses USING(course_id) FULL JOIN students USING(major_id) GROUP BY course HAVING COUNT(student_id) = 1 ORDER BY course")"

















these are examples of using the commands 











A single > will create or overwrite the file
while >> will make it so you add to the file



camper: /project$ echo Yujun | ./script.sh
Hello Yujun
./script.sh: line 6: bad_command: command not found

camper: /project$ ./script.sh
Yujun
Hello Yujun
./script.sh: line 6: bad_command: command not found

same outputs, the first one doesnt ask for an input



This now redirects the error to a different file
camper: /project$ echo Yujun | ./script.sh 2> stderr.txt
Hello Yujun
camper: /project$ 


This time, it didnt respon with anything, this is because it redirected all the things to different files
camper: /project$ echo Yujun | ./script.sh 2>stderr.txt > stdout.txt
camper: /project$ 


this is giving the input of name.txt to script.sh, which lets script process it
camper: /project$ ./script.sh < name.txt
Hello
./script.sh: line 6: bad_command: command not found




./script.sh < name.txt 2> stderr.txt > stdout.txt
this is giving the input of name.txt to script.sh, which then gives the error to stderr.txt and the result to stdout.txt




wc can be used on a file, it will give the byte count without flags
wc stands for word count

-l flag to only output how many lines are in the file.
-w flag to only output how many words are in the file.
-m flag to only output how many characters are in the file.




echo "~~ kitty_ipsum_1.txt info ~~" > kitty_info.txt

this will put the text "~~ kitty_ipsum_1.txt info ~~" without quotations into the file kitty_info.txt, it will actually overwrite it, meaning it will create a new kitty_info.txt or rewrite the current one


echo -e "\nNumber of lines:" >> kitty_info.txt
or you can use >> which adds the line to the file instead of rewriting the entire file


cat kitty_ipsum_1.txt | wc -l >> kitty_info.txt
this concatates kitty_ipsum_1.txt and pipes it to wc -l, which finds out how many lines are inside it, then adds it to kitty_info.txt



wc -m < kitty_ipsum_1.txt >> kitty_info.txt
cat kitty_ipsum_1.txt | wc -m >> kitty_info.txt
BOTH OF THESE achieve similar results. They're just different ways of doing it. 
the first one is called redirection
the second one is called pipe



grep command is a command to find patterns in text files
grep can use regex (regular expressions)

grep flags:
--color: the pattern text will be colored
-n: shows the line that the pattern is seen on
-c: counts how many lines the pattern shows up
-o: puts each match on their own line


examples:
grep --color 'meow[a-z]*' kitty_ipsum_2.txt
grep <flag> '<pattern>' <filename>




sed can replace text like this:
sed 's/<pattern_to_replace>/<text_to_replace_it_with>/' <filename>
By default, it won't replace the text in the file. It will output it to stdout

it is case sensitive
but you can use regex flags after it 



grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed 's/[0-9]/1/'
you can even use sed to target the line number outputs.



sed flags:
-E: allows you to use extended regex 


grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/'

lists only the row numbers that matches the pattern.





's/([0-9]+).*/\1/'
sed pattern that:


s/.../.../:
The s stands for "substitute."
It follows the format: s/<pattern>/<replacement>/.
It replaces text that matches <pattern> with <replacement>.


([0-9]+):
This is a regular expression capture group (denoted by parentheses ()).
[0-9] matches any digit (0 to 9).
[0-9]+ matches one or more digits (e.g., 123, 4567).


.*:
. matches any single character except a newline.
* means "zero or more" of the preceding character.
Together, .* matches the rest of the line after the digits.


\1:
This refers to the first capture group (the digits matched by ([0-9]+)).
In the replacement part, \1 inserts the value captured in the first group.


What It Does:
Matches a line that starts with digits (e.g., 123abc or 456 something).
Captures only the digits (123 or 456) using ([0-9]+).
Replaces the entire line with just the digits captured by \1.






You can replace many patterns using sed like this: sed 's/<pattern_1>/<replacement_1>/; s/<pattern_2>/<replacement_2>/'
you need the semi-colon between the two replacement patterns and they both need to be wrapped in the quotes





diff is a command to view the difference between two files. You can use it like this: diff <file_1> <file_2>
diff flags:
--color: colors the lines red or green. The red lines are lines that aren't in the second file, and the green lines are what they were replaced with. 


























 now()    can be used in psql as a default value to record down the current time.









































 psql + bash script bike shop project




 #!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=bikes --tuples-only -c"


echo -e "\n~~~~~ Bike Rental Shop ~~~~~\n"


MAIN_MENU() {
  if [[ $1 ]]
then
  echo -e "\n$1"
fi
  echo "How may I help you?"
  echo -e "\n1. Rent a bike\n2. Return a bike\n3. Exit"
  read MAIN_MENU_SELECTION
  case $MAIN_MENU_SELECTION in  
    1) RENT_MENU ;;
    2) RETURN_MENU ;;
    3) EXIT ;; 
    *) MAIN_MENU "Please enter a valid option." ;;
  esac

}

RENT_MENU() {
  #get available bikes
  AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")
  #if no bikes available
  if [[ -z $AVAILABLE_BIKES ]]
  then
    #send to main menu
    MAIN_MENU "Sorry, we don't have any bikes available right now."
  else
    #display available bikes
    echo -e "\nHere are the bikes we have available:"
    echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
    do
      echo "$BIKE_ID) $SIZE\" $TYPE Bike"
    done
    #ask for bike to rent
    echo -e "\nWhich one would you like to rent?"
    read BIKE_ID_TO_RENT
    #if input is not a number
    if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]
    then
      #send to main menu
      MAIN_MENU "That is not a valid bike number."
    else
      #get bike availability
      BIKE_AVAILABILITY=$($PSQL "SELECT available FROM bikes WHERE bike_id = $BIKE_ID_TO_RENT AND available = true")
      #if not available
      if [[ -z $BIKE_AVAILABILITY ]] 
      then 
        #send to main menu
        MAIN_MENU "That bike is not available."
      else
        #get customer info
        echo -e "\nWhat's your phone number?"
        read PHONE_NUMBER
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$PHONE_NUMBER'")
        #if customer doesn't exist
        if [[ -z $CUSTOMER_NAME ]]
        then
          #get new customer name
          echo -e "\nWhat's your name?"
          read CUSTOMER_NAME
          #insert new customer
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$PHONE_NUMBER', '$CUSTOMER_NAME')")
        fi
        #get customer_id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$PHONE_NUMBER'")
        #insert bike rental
        INSERT_RENTAL_RESULT=$($PSQL "INSERT INTO rentals(customer_id, bike_id) VALUES($CUSTOMER_ID, $BIKE_ID_TO_RENT)")
        #set bike availability to false
        SET_TO_FALSE_RESULT=$($PSQL "UPDATE bikes SET available = false WHERE bike_id = $BIKE_ID_TO_RENT")
        #get bike info
        BIKE_INFO=$($PSQL "SELECT size, type FROM bikes WHERE bike_id = $BIKE_ID_TO_RENT")
        BIKE_INFO_FORMATTED=$(echo $BIKE_INFO | sed 's/ |/"/')
        #send to main menu
        MAIN_MENU "I have put you down for the $BIKE_INFO_FORMATTED Bike, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')."
      fi
    fi
  fi

}

RETURN_MENU() {
  #get customer info
  echo -e "\nWhat's your phone number?"
  read PHONE_NUMBER
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$PHONE_NUMBER'")
  #if not found
  if [[ -z $CUSTOMER_ID ]]
  then
    #send to main menu
    MAIN_MENU "I could not find a record for that phone number."
  else
    #get customer's rentals
    CUSTOMER_RENTALS=$($PSQL "SELECT bike_id, type, size FROM bikes INNER JOIN rentals USING(bike_id) INNER JOIN customers USING(customer_id) WHERE phone = '$PHONE_NUMBER' AND date_returned IS NULL ORDER BY bike_id")
    #if no rentals
    if [[ -z $CUSTOMER_RENTALS ]]
    then
      #send to main menu
      MAIN_MENU "You do not have any bikes rented."
    else
      #display rented bikes
      echo -e "\nHere are your rentals:"
      echo "$CUSTOMER_RENTALS" | while read BIKE_ID BAR TYPE BAR SIZE
      do
        echo "$BIKE_ID) $SIZE\" $TYPE Bike"
      done
      #ask for bike to return
      echo -e "\nWhich one would you like to return?"
      read BIKE_ID_TO_RETURN
      #if not a number
      if [[ ! $BIKE_ID_TO_RETURN =~ ^[0-9]+$ ]]
      then
        #send to main menu
        MAIN_MENU "That is not a valid bike number."
      else
        #check if input is rented
        RENTAL_ID=$($PSQL "SELECT rental_id FROM rentals INNER JOIN customers USING(customer_id) WHERE phone = '$PHONE_NUMBER' AND bike_id = $BIKE_ID_TO_RETURN AND date_returned IS NULL")
        #if input not rented
        if [[ -z $RENTAL_ID ]]
        then
          #send to main menu
          MAIN_MENU "You do not have that bike rented."
        else
          #update date_returned
          RETURN_BIKE_RESULT=$($PSQL "UPDATE rentals SET date_returned = NOW() WHERE rental_id = $RENTAL_ID")
          #set bike availability to true
          SET_TO_TRUE_RESULT=$($PSQL "UPDATE bikes SET available = true WHERE bike_id = $BIKE_ID_TO_RETURN")
          #send to main menu
          MAIN_MENU "Thank you for returning your bike."
        fi
      fi
    fi
  fi
}

EXIT() {
  echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU





















SERVICES=$($PSQL "SELECT * FROM services")

echo "$SERVICES" | while read ID BAR SERVICE 
do 
  echo "$ID) $SERVICE"
done


and



SERVICES=$($PSQL "SELECT * FROM services")

echo $SERVICES | while read ID BAR SERVICE 
do 
  echo "$ID) $SERVICE"
done


they have a huge difference, even though one simply has no "" around $SERVICES, it causes everything to change.


the first output is:

camper: /project$ ./salon.sh

~~~~~ MY SALON ~~~~~

Welcome to My Salon, how can I help you?
1) cut 2 | color 3 | dry



while the second output is:

~~~~~ MY SALON ~~~~~

Welcome to My Salon, how can I help you?
1) cut
2) color
3) dry


the "" will print it out on multiple lines.