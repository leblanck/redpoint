#!/bin/bash
#################################
# Created by @kyleblanc         #
# -Used to setup new macOS      #
#   environment using homebrew. #
#   Cask WishList is located    #
#   below this description.     #
#                               #
#   Last Update: 02/27/2020     #
#################################
# Cask WishList/To Do           #
#                               #
#                               #
#  Cask list available using:   #
#     brew search --casks       #
#################################
###VSCODE Notes: Listed below are used themes/extensions. Would like to script this somehow...
  #VSCODE Theme:     https://marketplace.visualstudio.com/items?itemName=jdinhlife.gruvbox
  #VSCODE Extensions~~~
  #Terraform:       https://marketplace.visualstudio.com/items?itemName=mauve.terraform
  #Go:              https://marketplace.visualstudio.com/items?itemName=ms-vscode.Go
  #Material Icons:  https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme
  #PropertyList:    https://marketplace.visualstudio.com/items?itemName=zhouronghui.propertylist

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

atomExtras() {
  #Install Atom Themes
  echo "`date` Installing Atom themes.."
  apm install apple-wwdc-2016-syntax
  apm install firewatch-syntax
  apm install gruvbox
  apm install halcyon-syntax

  #Install Atom Packages
  echo "`date` Installing Atom packages..."
  apm install file-icons
  apm install minimap
  apm install pigments

  #CLI Tools
  echo "`date` Installing Atom CLI Tools..."
  ln -s /Applications/Atom.app/Contents/Resources/app/atom.sh /usr/local/bin/atom
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

shellSetup() {
    #The following will start the setup for local shell preferences (oh-my-zsh)
    #iTerm2 is installed in the cask list in the caskInstaller function
    
    #Do we have git installed?
    if [[ $(command -v git) == "" ]]; then
        echo "Installing git..."
        git
    else
        echo "Git is installed; Running version: "
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

    #Download iTerm theme
    # Set Theme by iTerm2 > Preferences > Profiles > Colors > Color Presets > Import - Import the halcyon.itermcolors file
        ## Set Font and Non-ASCII font to Hack 12pt Reg (iTerm2 > Preferences > Profiles > Text) 
    git clone https://github.com/leblanck/gruvbox_iterm_theme.git

    #Symlink all dotfiles
    echo "`date` Linking all dotfiles..."
    ln -sv ~/repos/redpoint/resources/dotfiles/.zshrc ~
    ln -sv ~/repos/redpoint/resources/dotfiles/.gitconfig ~
    ln -sv ~/repos/redpoint/resources/dotfiles/.gitignore_global ~
    ln -sv ~/repos/redpoint/resources/agnoster.zsh_theme ~/.oh-my-zsh/themes/
    sleep 1

    echo "`date` Installing CLI Trash..."
    npm install --global trash-cli
    sleep 5
}

localMacOSSetup() {
    source $repoDir/redpoint/resources/dotfiles/.macos
}

spotifyConfig() {
    spicetify backup apply enable-devtool
    cd ~/spicetify_data/Themes
    git clone https://github.com/morpheusthewhite/spicetify-themes.git
    spicetify config current_theme Gruvbox-Gold
    spicetify apply
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

echo "`date` Setting up logging..."
echo "`date` View $logFile for further output..."
logging

echo "`date` Please wait; Installing Xcode tools..."
xcode-select --install
sleep 240

echo "`date` Installing homebrew and apps..."
homebrewInstall

echo "`date` Getting Atom extras..."
atomExtras

echo "`date` Installing fonts..."
fonts

echo "`date` Setting up Spotify..."
spotifyConfig

echo "`date` Setting up shell preferences..."
shellSetup

echo "`date` Setting up macOS local preferences..."
localMacOSSetup

echo "`date` Done!"
