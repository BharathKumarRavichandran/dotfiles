############################## Node version manager #################################

if [[ "$OSTYPE" == "darwin"* ]]; then
    export NVM_DIR="$HOME/.nvm"
    export NVM_SCRIPT="$(brew --prefix)/opt/nvm/nvm.sh"
    export NVM_COMPLETION="$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export NVM_DIR="$HOME/.nvm"
    export NVM_SCRIPT="$NVM_DIR/nvm.sh"
    export NVM_COMPLETION="$NVM_DIR/bash_completion"
fi

nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_SCRIPT" ] && \. "$NVM_SCRIPT"
  [ -s "$NVM_COMPLETION" ] && \. "$NVM_COMPLETION"
  nvm "$@"
}
node() { unset -f nvm node npm npx; [ -s "$NVM_SCRIPT" ] && \. "$NVM_SCRIPT"; node "$@"; }
npm()  { unset -f nvm node npm npx; [ -s "$NVM_SCRIPT" ] && \. "$NVM_SCRIPT"; npm "$@"; }
npx()  { unset -f nvm node npm npx; [ -s "$NVM_SCRIPT" ] && \. "$NVM_SCRIPT"; npx "$@"; }
