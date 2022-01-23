# #!/bin/bash

# echo "This scripts checks the existence of the messages file."
# echo "Checking..."
# if [ -f ./$1 ]
#   then
#     echo "example.log exists."
# fi
# echo
# echo "...done."

#!/bin/bash

print_help() {
  cat <<EOF
  Usage:
    mytools -h 
    mytools <directory file> 
    mytools <directory file> -t json/txt
    mytools <direcotry file> -o <output file> 
  Options:
    -h : see how to usage
    -t : execute conversion file
    -o : execute output file
EOF
}

while getopts ":oth" opt; do
  case $opt in
    o)
      echo "-o was triggered, Parameter: $2" >&2
      ;;
    t)
      tr -sd '\0' '' < example.log > example.txt
      ;;
    h)
      print_help
    ;;
    \?)
      echo "Option not found" >&2
      exit 1
    ;;
    :)
      echo "Option -h for help." >&2
      exit 1
      ;;
  esac
done

