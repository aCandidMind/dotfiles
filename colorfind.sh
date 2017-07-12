dircol=$(tput bold ;tput setaf 4)
coloff=$(tput sgr0)

root="$HOME"       # define path here, not in 'find` arg
root="${root:-.}"  # default to '.'
root="${root%/}/"  # add trailing '/'
#
find "$root" -maxdepth 1 -name '*' -printf "%y %P\n" | 
  while read -r line ;do
    case $line in 
       d   ) printf "%s\n" "$dircol$root$coloff";;  
       d\ *) printf "%s\n" "$dircol$root${line:2}$coloff";;  
       f\ *) l="$root${line:2}"
             d="${l%/*}/"
             f="${l##*/}"
             cd -P "$d" 
             printf "%s" "$dircol$d$coloff"  
             ls --color=always -R1 "$f"
             cd - >/dev/null
             ;; 
          *) printf "ERROR - type not yet catered for\n";;  
    esac
  done
