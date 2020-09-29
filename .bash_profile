if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

export SHELL=`which zsh`
exec $SHELL -l

# # .bash_profile

# # Get the aliases and functions
# if [ -f ~/.bashrc ]; then
# 	. ~/.bashrc
# fi

# # User specific environment and startup programs

# PATH=$PATH:$HOME/.local/bin:$HOME/bin

# export PATH
