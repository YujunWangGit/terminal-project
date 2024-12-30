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






you start with "sql --username=freecodecamp --dbname=postgres". this shows what your username is when connecting to databases


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