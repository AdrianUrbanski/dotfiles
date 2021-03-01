# Dotfiles
Configuration files for programs I use
# Setup guide
Clone the repository

    git clone --bare https://github.com/AdrianUrbanski/dotfiles.git $HOME/.dotfiles
    
Define alias in current shell scope

    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    
Checkout repository content to $HOME

    dotfiles checkout
    
