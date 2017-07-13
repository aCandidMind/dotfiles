pathcol=$(tput bold; tput setaf 4)
coloff=$(tput sgr0)

root="."               # define path here, not in 'find` arg
root="${root%/}/"      # add trailing '/'
name="${1:-*}"

find "$root" -name "$name" -printf "$pathcol------\n\n%p$coloff\n" -exec cat {} \;
