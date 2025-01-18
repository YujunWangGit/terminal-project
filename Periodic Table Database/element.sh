#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"



INPUT=$1

if [[ -z $INPUT ]] 
then
  echo "Please provide an element as an argument."
  exit 
fi



MAINSCRIPT() {
    if [[ $INPUT =~ ^10$|^[1-9]$ ]]
  then
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = '$INPUT'")
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = '$INPUT'")

    if [[ -z $SYMBOL || -z $NAME ]]
      then
        echo "I could not find that element in the database."
      return
    fi

    TYPE=$($PSQL "SELECT type FROM elements FULL JOIN properties ON elements.atomic_number = properties.atomic_number FULL JOIN types ON properties.type_id = types.type_id WHERE elements.atomic_number = $INPUT")
    MASS=$($PSQL "SELECT atomic_mass FROM elements FULL JOIN properties ON elements.atomic_number = properties.atomic_number WHERE elements.atomic_number = $INPUT")
    MELT=$($PSQL "SELECT melting_point_celsius FROM elements FULL JOIN properties ON elements.atomic_number = properties.atomic_number WHERE elements.atomic_number = $INPUT")
    BOIL=$($PSQL "SELECT boiling_point_celsius FROM elements FULL JOIN properties ON elements.atomic_number = properties.atomic_number WHERE elements.atomic_number = $INPUT")

    echo "The element with atomic number $INPUT is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
  else
    NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$INPUT' OR name = '$INPUT'")

    if [[ -z $NUMBER ]]
      then
        echo "I could not find that element in the database."
      return
    fi

    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = '$NUMBER'")
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = '$NUMBER'")

    TYPE=$($PSQL "SELECT type FROM elements FULL JOIN properties ON elements.atomic_number = properties.atomic_number FULL JOIN types ON properties.type_id = types.type_id WHERE elements.atomic_number = $NUMBER")
    MASS=$($PSQL "SELECT atomic_mass FROM elements FULL JOIN properties ON elements.atomic_number = properties.atomic_number WHERE elements.atomic_number = $NUMBER")
    MELT=$($PSQL "SELECT melting_point_celsius FROM elements FULL JOIN properties ON elements.atomic_number = properties.atomic_number WHERE elements.atomic_number = $NUMBER")
    BOIL=$($PSQL "SELECT boiling_point_celsius FROM elements FULL JOIN properties ON elements.atomic_number = properties.atomic_number WHERE elements.atomic_number = $NUMBER")

    echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
  fi
}

MAINSCRIPT


