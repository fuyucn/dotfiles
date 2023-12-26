
############################ Oh_MY_ZSH configurations ############################
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
export ZSH="$HOME/.oh-my-zsh"
HIST_STAMPS="mm/dd/yyyy"
# THEME
# ZSH_THEME="agnoster"
# === install ===
# git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
# ===============
ZSH_THEME="spaceship"

# PLUGIN
# brew install autojump
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
plugins=(git macos autojump zsh-autosuggestions zsh-syntax-highlighting)

### PLUGIN SETTINGS 
# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# bindkey ',' autosuggest-accept
###################################################################################

############################### User configurations ###############################

### NVM ###
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export AWS_REGION=us-east-1

###################################################################################


###############################        ALIAS        ###############################

alias ni='npm i'
alias nr='npm run'
alias yi='yarn install'
alias yr='yarn run'
alias lintf='lint . --fix'
alias gf='git fetch'
alias gp='git pull'
###################################################################################
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=/usr/local/bin:$PATH
# pnpm
export PNPM_HOME="/Users/yufu/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export PATH="/usr/local/opt/openjdk/bin:$PATH"
