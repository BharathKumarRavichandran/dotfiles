#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [[ -f $1 ]] ; then
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


get_current_datetime()
{
    date +"%Y-%m-%d_%H-%M-%S"
}

killport()
{
    local port=${1:-3000}

    if [[ "$port" != <1-65535> ]]; then
        echo "Usage: killport [port]" >&2
        return 2
    fi

    if [[ "$OSTYPE" == darwin* ]]; then
        local -a pids
        pids=(${(f)"$(lsof -tiTCP:"$port" -sTCP:LISTEN)"})

        if (( ${#pids} == 0 )); then
            echo "No process is listening on port $port"
            return 1
        fi

        kill -- "${pids[@]}"
    elif [[ "$OSTYPE" == linux* ]]; then
        fuser -k "$port/tcp"
    else
        echo "killport is not supported on $OSTYPE" >&2
        return 1
    fi
}

dotfile_backup_dir()
{
    local tool=$1
    local timestamp=${DOTFILES_RUN_TIMESTAMP:-$(get_current_datetime)}
    print -r -- "$DOTDIR_BACKUP/$tool/$timestamp"
}

dotfile_backup_path()
{
    local file=$1
    local backup_dir=$2
    local relative

    if [[ "$file" == "$HOME"/* ]]; then
        relative=${file#"$HOME"/}
    else
        relative=${file:t}
    fi
    print -r -- "$backup_dir/$relative"
}

backup_dotfile()
{
    local file=$1
    local backup_dir=$2
    local destination

    [[ -e "$file" || -L "$file" ]] || return 0
    destination=$(dotfile_backup_path "$file" "$backup_dir") || return 1

    if [[ -e "$destination" || -L "$destination" ]]; then
        echo "Backup destination already exists: $destination" >&2
        return 1
    fi

    echo "Backing up $file to $destination"
    is_dry_run && return 0

    mkdir -p "${destination:h}" || return 1
    mv "$file" "$destination"
}

link_dotfile()
{
    local source=$1
    local destination=$2
    local tool=$3
    local backup_dir backup_path temporary

    if [[ ! -e "$source" ]]; then
        echo "Source does not exist: $source" >&2
        return 1
    fi

    if [[ -L "$destination" && "${destination:A}" == "${source:A}" ]]; then
        echo "Already linked: $destination"
        return 0
    fi

    if [[ "${destination:A}" == "${source:A}" ]]; then
        echo "Source and destination are the same: $source" >&2
        return 1
    fi

    backup_dir=$(dotfile_backup_dir "$tool") || return 1
    if is_dry_run; then
        backup_dotfile "$destination" "$backup_dir" || return 1
        echo "Linking $destination -> $source"
        return
    fi

    mkdir -p "${destination:h}" || return 1
    temporary="${destination:h}/.${destination:t}.dotfiles-link.$$.${RANDOM}"
    ln -s "$source" "$temporary" || return 1

    if ! backup_dotfile "$destination" "$backup_dir"; then
        rm -f "$temporary"
        return 1
    fi

    echo "Linking $destination -> $source"
    if ! mv "$temporary" "$destination"; then
        rm -f "$temporary"
        backup_path=$(dotfile_backup_path "$destination" "$backup_dir")
        if [[ -e "$backup_path" || -L "$backup_path" ]]; then
            mv "$backup_path" "$destination" || \
                echo "Restore failed; backup is at $backup_path" >&2
        fi
        return 1
    fi
}

is_dry_run()
{
    [[ ${DOTFILES_DRY_RUN:-0} == 1 ]]
}
