#!/bin/bash
#################################
# Created by @kyleblanc         #
# -Used to setup new macOS      #
#   environment using homebrew. #
#   Cask WishList is located    #
#   below this description.     #
#                               #
#   Last Update: 02/24/2020     #
#################################
# Cask WishList/To Do         #
#                             #
#                             #
#  Cask list available using: #
#     brew search --casks     #
###############################

#@@@@@@@@@@@@ MAIN @@@@@@@@@@@@

# LOG ##########################################
LogFile="/Library/Logs/bustIT.log"
if [[ ! -e $LogFile ]]; then
    sudo touch $LogFile && sudo exec >> $LogFile
    echo "`date` ========== Log File Created"
else
    sudo exec >> $LogFile
fi
###############################################

caskInstaller() {
  # This will iterate through cask installs, only stopping when a trigger is hit to execute
  # additional commands for that specific installer.
  # To add additional casks, add them into $casks array.
  declare -a casks=("spectacle" "wireshark" "font-hack" "clipy" "atom" "slack" "github" "iterm2" "zeplin" "dozer" "figma" "messenger" "dropbox" "sketch" "visual-studio-code" "xnviewmp" "fliqlo")
  atomTrigger="atom"
  adobeTrigger="adobe-creative-cloud"

  for i in "${casks[@]}"
  do
    if [ "$i" == "$atomTrigger" ]; then
      #Triggered when current cask = Atom
      echo "`date` Installing" $i"..."
      brew cask install $i
      atomExtras
    elif [ "$i" == "$adobeTrigger" ]; then
      #Triggered when current cask = Adobe CC
      echo "`date ` Installing" $i"..."
      brew cask install $1
      sleep 5
      open -a /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app
    else
      #All other casks
      echo "`date` Installing" $i"..."
      brew cask install $i
    fi
  done
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

shellSetup() {
  #The following will start the setup for local shell preferences (zsh)
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

  #Download iTerm theme
  mkdir ~/iTermSetup
  # Set Theme by iTerm2 > Preferences > Profiles > Colors > Color Presets > Import - Import the halcyon.itermcolors file
  curl -L -o ~/iTermSetup/halcyon.itermcolors  https://raw.githubusercontent.com/bchiang7/halcyon-iterm/master/halcyon.itermcolors
  
  #Download personal iTerm2 Config (Import from Preferences > General > Preferences > Load from custom folder)
  curl -L -o ~/iTermSetup/com.googlecode.iterm2.plist
  #Download personal iTerm2 theme (based on Gruvbox) (Possibly not needed it above plist is imported correctly)
  curl -L -o ~/iTermSetup/kl_gruv.itermcolors

  #Install Powerline Font pack
  mkdir ~/repos
  cd ~/repos
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts
  
  #Download Cascadia Font
  curl -L -o ~/Cascadia.ttf https://github.com/microsoft/cascadia-code/releases/download/v1910.04/Cascadia.ttf
  
  #The following is option/personal preference (to be scripted eventually):
  ## Set Font and Non-ASCII font to Hack 12pt Reg (iTerm2 > Preferences > Profiles > Text)
  ## Add alias's to ~/.zshrc
  ##    alias home="cd ~/"
  ##    alias ls="ls -la"
  ## Add plugins to ~/.zshrc
  ##    plugins=(git extract osx)
  ## Change zsh prompt theme in ~/.zshrc to agnoster (ZSH_THEME="agnoster")
  ## Change agnoster theme prompt context (~/.oh-my-zsh/themes/agnoster.zsh-theme : line 92) to the following:
  ##    prompt_segment black default "%(!.%{%F{yellow}%}.)this ➡"
}

localMacOSSetup() {
  #The following will setup local macOS preferences (Wallpaper, Dock Settings, etc)

  # Set Dark Mode
  osascript -e 'tell application "System Events"
      tell appearance preferences
          set dark mode to true
      end tell
  end tell'

  #Only show open apps in the dock; remove everything else
  defaults write com.apple.dock static-only -bool true

  #Auto-hide dock
  defaults write com.apple.dock autohide -bool true

  #Download new wallpaper
  curl -L -o ~/Pictures/wallpaper.png https://raw.githubusercontent.com/leblanck/bustit/master/wallpaper.png
  #Set new wallpaper
  osascript -e ‘tell application "System Events" to tell every desktop to set picture to "~/Pictures/wallpaper.png"’

  #restart dock process
  killall Dock
}

homebrewInstall() {
  if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "Updating Homebrew"
    brew update
  fi
    sleep 5
    echo "`date` Tapping Cask..."
    brew tap homebrew/cask
    sleep 5
    brew tap homebrew/cask-fonts
    sleep 5
    brew tap cjbassi/gotop
    sleep 5
    echo "`date` Installing Apps..."
    caskInstaller
    sleep 5
    echo "`date` Installing PWGen..."
    brew install pwgen
    sleep 5
    #echo "`date` Installing Hugo..."
    #brew install hugo
    #sleep 5
    echo "`date` Installing GoTop..."
    brew install gotop
    sleep 5
    echo "`date` Installing neofetch..."
    brew install neofetch
    sleep 5
    echo "`date` Installing npm..."
    brew install npm
    sleep 5
    #echo "`date` Installing Firebase..."
    #npm install -g firebase-tools
    #sleep 5
    echo "`date` Setting up shell preferences..."
    shellSetup
    sleep 5
    echo "`date` Installing CLI Trash..."
    npm install --global trash-cli
    sleep 5
    echo "`date` Setting up macOS local preferences..."
    localMacOSSetup
    sleep 5
    echo "`date` Done!"
}

homebrewInstall
