DB_FILE=~/.addressbook.db
#funcion para pedir los datos de una entrada nueva
function addEntry()
{
   echo "Ingrese los siguientes datos: "
   echo -n "Nombre: "; read nombre
   echo -n "E-mail: "; read email
   echo -n "Direccion: "; read direccion
   echo -n "Teléfono: "; read telefono
   confirmar "$nombre" "$email" "$direccion" "$telefono"
}

function confirmar()
{
   nombre=$1
   email=$2
   dir=$3
   tel=$4
   echo "Nombre $1, email: $2, dir: $3, tel: $4"
   echo -n "Crear entrada ? [y/n]: "; read crear

   case "$crear" in
       [yY]|[yY][eE][sS]) createRecord "$nombre" "$email" "$dir" "$tel" ;;
       [nN]|[nN][oO]) echo "Entrada no creada"; init;;
       *) confirmar "$nombre" "$email" "$dir" "$tel";;
   esac
}

function createRecord()
{
   record=$1:$2:$3:$4
   echo $record >> $DB_FILE
   echo "Entry has been added to the address book."
   init
}

function displayEntries()
{
   oldifs="$IFS"
   IFS=$'\n'
   db=`cat $DB_FILE`

   for entry in $db
   do
       printRecord "$entry"
   done
   IFS="$oldifs"
   init
}

function printRecord()
{
   entry=$1
   name=`echo $entry | cut -d : -f 1`
   email=`echo $entry | cut -d : -f 2`
   direccion=`echo $entry | cut -d : -f 3`
   num_tel=`echo $entry | cut -d : -f 4`
   echo "Nombre: $name"
   echo "Email: $email"
   echo "Direccion: $direccion"
   echo "Teléfono: $num_tel"
   echo ""
}

function searchRecord()
{
   echo -n "Enter your search query or enter exit to go back to the main menu: "
   read query
   stripped_query=`echo $query | sed 's/^ *//; s/ *$//'`
   if [ -n "$stripped_query" ]; then
       if [ $stripped_query = "exit" ]; then
           info
       else
           results=`cat $DB_FILE | egrep -i $query`
           if [ -n "$results" ]; then
               oldifs="$IFS"
               IFS=$'\n'
               for result in $results; do
                   printRecord "$result"
               done
               IFS="$oldifs"
               init
           else
               echo "No entries found for query $query"
               read
               init
           fi
       fi
   else
       sleep 1
       clear
       searchRecord
   fi
}

function init()
{
   echo "Welcome to your address book!"
   echo ""
   echo "1) Display all entries."
   echo "2) Find Entry."
   echo "3) Add Entry."
   echo "4) Exit."
   echo ""
   echo -n "Choose your option: "
   read option
   clear
   case "$option" in
       1) displayEntries;;
       2) searchRecord;;
       3) addEntry;;
       4) echo "Bye bye!"; sleep 1; exit 0;;
   esac

}
clear
init
