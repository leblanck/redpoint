#!/bin/bash
#    ___  _______  ___  ____  _____  ________
#   / _ \/ __/ _ \/ _ \/ __ \/  _/ |/ /_  __/
#  / , _/ _// // / ___/ /_/ // //    / / /   
# /_/|_/___/____/_/   \____/___/_/|_/ /_/    
#                                           
#################################
# Created by @kyleblanc         #
# -Used to setup new macOS      #
#   environment using homebrew. #
#   Cask WishList is located    #
#   below this description.     #
#                               #
#   Last Update: 02/23/2023     #
#################################
# Cask WishList/To Do           #
#                               #
#                               #
#  Cask list available using:   #
#     brew search --casks       #
#################################

#### VARIABLES ####
loggedInUser=$(stat -f %Su /dev/console)
repoDir=/Users/$loggedInUser/repos
logFile=/Users/$loggedInUser/Library/Logs/redPoint.log
###################

logging() {
    if [[ ! -e $logFile ]]; then
        touch $logFile && exec >> $logFile
        echo "`date` ========== Log File Created =========="
    else
        exec >> $logFile
    fi
}

fonts() {
    #Install Powerline Font pack
    cd $repoDir
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
  
    #Download Cascadia Font
    curl -L -o ~/repos/Cascadia.ttf https://github.com/microsoft/cascadia-code/releases/download/v1910.04/Cascadia.ttf
}

vscodeSetup() {
    declare -a extensions=(
                        "dnicolson.binary-plist"
                        "jdinhlife.gruvbox"
                        "mauve.terraform"
                        "ms-vscode.Go"
                        "PKief.material-icon-theme"
                        "zhouronghui.propertylist"
                        "golang.go"
                        "hashicorp.terraform"
                        "aws-scripting-guy.cform"
                        "redhat.vscode-yaml"
                        "amazonwebservices.aws-toolkit-vscode"
                        )

    if [[ $(command -v code) == "" ]]; then
        echo "============= `date` Either VSCode is not installed or CLI Tools are missing..."
        echo "============= `date` Aborting VSCode Extension Setup!"
    else
        echo "============= `date` VSCode Found; Installing Extensions..."
        for i in ${!extensions[@]};
        do
            code --install-extension ${extensions[$i]}
        done
    fi
}

shellSetup() {
    #Do we have git installed?
    if [[ $(command -v git) == "" ]]; then
        echo "============= `date` Installing git..."
        git
    else
        echo "============= `date` Git is installed; Running version: "
        git --version
    fi
    
    #Install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    #If repos doesn't exist make it 
    if [ -d $repoDir ]; then
        cd $repoDir
    else
        mkdir $repoDir
        cd $repoDir
    fi
    
    #INSTALL ITERM JSON THEME FROM THIS REPO (iterm_profile.json; iTerm2 > Preferences > Profiles > Other Actions > Import JSON Profile)
    #Download Powerlevel10k ZSH Theme
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    echo "============= `date` Installing CLI Trash..."
    npm install --global trash-cli
    sleep 5
}

dotfiles() {
    cd $repoDir
    git clone https://github.com/leblanck/dotfiles.git
    # #Symlink all dotfiles
    echo "============= `date` Linking all dotfiles..."
    ln -sv $repoDir/dotfiles/.gitconfig ~
    ln -sv $repoDir/dotfiles/.gitignore_global ~
    ln -sv $repoDir/dotfiles/.macos ~
    ln -sv $repoDir/dotfiles/.p10k.zsh ~
    ln -sv $repoDir/dotfiles/.vimrc ~
    ln -sv $repoDir/dotfiles/.zprofile ~
    ln -sv $repoDir/dotfiles/.zshrc ~
    ln -sv $repoDir/dotfiles/.zshrcexport ~

    cp -R $repoDir/dotfiles/.config ~/

    git config --global core.excludesfile ~/.gitignore_global
    sleep 1
}

vimSetup() {
    #Install Packer
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.config/nvim/site/pack/packer/start/packer.nvim
    
    #Run :PackerSync
}

localMacOSSetup() {
    source $repoDir/dotfiles/.macos
}

homebrewInstall() {
    if [[ $(command -v brew) == "" ]]; then
        echo "Installing Hombrew"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "Updating Homebrew"
        brew update
    fi

    brew tap homebrew/bundle
    brew bundle --file ./resources/Brewfile
    
    sleep 5
}

echo "============= `date` Setting up logging..."
echo "============= `date` View $logFile for further output..."
logging

echo "============= `date` Please wait; Installing Xcode tools..."
xcode-select --install
sleep 240

echo "============= `date` Installing homebrew and apps..."
homebrewInstall

echo "============= `date` Setting Up shell preferences..."
shellSetup

echo "============= `date` Installing VS Code Extensions"
vscodeSetup

echo "============= `date` Installing fonts..."
fonts

echo "============= `date` Setting Up dotfiles..."
dotfiles

echo "============= `date` Setting Up nvim..."
vimSetup

echo "============= `date` Setting Up macOS local preferences..."
localMacOSSetup

echo "============= `date` Done!"
