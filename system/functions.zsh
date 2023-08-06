#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# Get the current date and time in the specified format
get_current_datetime() 
{
    date +"%Y-%m-%d_%H-%M-%S"
}


# Backup a dotfile, handling both regular files and symbolic links
backup_dotfile() 
{
    local file=$1
    local backup_dir=$2

    echo "Taking back up of file $1 to $2"
    if [ -e "$file" ]; then
        if [ -L "$file" ]; then
            local target=$(readlink -f "$file")
            cp -L "$target" "$backup_dir/"
        else
            cp "$file" "$backup_dir/"
        fi
    fi
}