if [ ! $SHELL = '/usr/local/bin/zsh' ]; then
  ECHO 'INSTALL ZSH'
  brew install zsh
  # set zsh defaul shell
  echo $SHELL
  sudo sh -c "echo $(which zsh) >> /etc/shells" 
  chsh -s $(which zsh) # set zsh as default
fi

if [ ! -d ~/.oh-my-zsh ]; then
  ECHO 'INSTALL OH MY ZSH'
  echo "" > ~/.zshrc
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo " RESET .ZSHRC "
  echo "export ZSH=\"/Users/fu/.oh-my-zsh\"
  ZSH_THEME=\"robbyrussell\"
  # export UPDATE_ZSH_DAYS=13
  plugins=(git)" > ~/.zshrc
fi

source ~/.zshrc

####################
ECHO 'INSTALL PLUGINS'
brew install autojump
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git open
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open

#########################################################
ECHO 'INSTALL POWERLINE FONTS'
# clone
git clone https://github.com/powerline/fonts.git
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

#########################################################
ECHO 'INSTALL powerlevel9k'
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# modify theme to powerlevel9k
sed -i '' "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel9k\/powerlevel9k\"/g" ~/.zshrc
#########################################################

# modify plugins
sed -i '' "s/plugins=(git)/plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting git-open)/g" ~/.zshrc

# modify update days
sed -i '' "s/# export UPDATE_ZSH_DAYS=13/export UPDATE_ZSH_DAYS=30/g" ~/.zshrc

# add all setups
echo "\n#########################
source $ZSH/oh-my-zsh.sh

# ssh
export SSH_KEY_PATH=\"~/.ssh/rsa_id\"


# THEME
# DO NOW SHOW USER
# User=\$(echo \$(whoami) | sed \"s/-/ /g\")
# DEFAULT_USER=\`whoami\`

#POWERLEVEL9K_MODE='nerdfont-complete'

# SHOW USER NAME
#POWERLEVEL9K_ALWAYS_SHOW_USER=true

# REPLACE WITH 
DEFAULT_USER=\`whoami\`

# User Custom
custom_user() {
  if [[ \$DEFAULT_USER = 'fu' ]]; then
    echo -n \"❤\"
  else 
    echo -n \"%n\"
  fi
}

POWERLEVEL9K_CUSTOM_USER=\"custom_user\"

# command line 左邊想顯示的內容
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_user context dir vcs)
# command line 右邊想顯示的內容
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status load background_jobs command_execution_time time)

if [[ \"\$USER\" != \"\$DEFAULT_USER\" || -n \"\$SSH_CLIENT\" ]]; then
  POWERLEVEL9K_CONTEXT_TEMPLATE=\"%n\"
else
  POWERLEVEL9K_CONTEXT_TEMPLATE=\"❤\"
fi

# PLUGIN
bindkey ',' autosuggest-accept
# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# -----------------------------------------------
# Environment Variables
# -----------------------------------------------
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export HISTCONTROL=ignoredups
export SAVEHIST=10000
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.bash_profile ]; then
   source ~/.bash_profile
fi
"  >> ~/.zshrc

# install bat
brew install bat

# reload zsh
source ~/.zshrc

zsh





