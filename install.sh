#!/usr/bin/env bash
PLATFORM=uname

SOURCE=./to_txt.sh
BIN_LOCATION="/usr/local/bin/"

progress_bar() {
  local duration=${1}
    already_done() { for ((done=0; done<$elapsed; done++)); do printf ":"; done }
    remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
    percentage() { printf "| %s%%" $(( (($elapsed)*100)/($duration)*100/100 )); }
    clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=$duration; elapsed++ )); do
      already_done; remaining; percentage
      clean_line
  
  done
    clean_line
}

download_and_install_cli() {
  command curl -fsSL ${SOURCE} -o $HOME/cli.sh
  command mv $HOME/cli.sh $BIN_LOCATION
  command chmod +x $BIN_LOCATION/cli.sh
}

main() {
  echo "🚀 download and install cli.sh"
  progress_bar 100
  printf "\n"
  download_and_install_cli
}

main

cat <<EOF
 cli.sh success installed in your computer.
  * For usage, you can see cli.sh --help.
 
 thanks :)
EOF