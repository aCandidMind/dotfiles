pathcol=$(tput bold ;tput setaf 4)
coloff=$(tput sgr0)

root="."               # define path here, not in 'find` arg
root="${root%/}/"      # add trailing '/'
name="${$1:-*}"

find "$root" -print -exec cat {} \; -name "$name" | 
  while read -r line ;do
    if [[ "$line" =~ \.\/.+\.[:alphanum:] ]]; then
      printf "\n\n%s\n" "$pathcol$line$coloff"
    else
      echo $line
    fi
  done
