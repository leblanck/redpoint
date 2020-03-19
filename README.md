<p align="center"><img width=25% src="https://raw.githubusercontent.com/leblanck/leblanck.github.io/master/img/arrow.png"></p>
<p align="center"><img width=60% src="https://raw.githubusercontent.com/leblanck/leblanck.github.io/master/img/rplogo.png"></p>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[![GitHub issues](https://img.shields.io/github/issues-raw/leblanck/redpoint.svg)](https://github.com/leblanck/redpoint/issues)
![Contributions welcome](https://img.shields.io/badge/contributions-welcome-orange.svg)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

#### Why?
tl/dr; The need for setting up a new system using dotfiles and an installation script in minutes.

This repository serves as my way to help me setup and maintain my Mac(s). It takes the effort out of installing everything manually, as well as keep any .dotfiles up-to-date across Macs by just updating the repo locally. Everything needed to install my preferred setup of macOS is detailed in this readme. Enjoy! 😄

#### Install/Run:
1. Run `mkdir ~/repos && cd ~/repos`
2. Clone Repo: `git clone https://github.com/leblanck/redpoint.git`
3. run using `./redPoint.sh`
           
#### What does this do?
1. Setup Logging to: `~/Library/Logs/redPoint.log`
2. Installs Xcode Command Line Tools
3. Sets up homebrew:
 * Installs or Updates brew
 * Installs macOS Apps:
 
| macOS Apps:              |                   |                   |                 |
| :----------------------- | :-------------    | :-----------------| :---------------|
| 1Password                | Adobe CC          | Atom              | Clipy           |
| Docker                   | Dozer             | Firefox           | Fliqlo          |
| iTerm2                   | Itsycal           | Messenger         | Notion          | 
| Sketch                   | Slack             | Spotify           | VS Code         | 
| Wireshark                | Xnviewmp          |                   |                 |  
 
 * Installs binaries:
 
| binaries:         |          |                
| :---------------- | :------- |
| pwgen             | tree     |  
| gotop             | npm      |
| spicetify-cli     | neofetch |

4. Installs Extras for Atom (including CLI Tools):

| Themes:                   | Extensions:      |                
| :------------------------ | :--------------- |
| firewatch-syntax          | file-icons       |  
| halcyon-syntax            | minimap          |
| apple-wwdc-2016-syntax    | pigments         |
| gruvbox                   |

5. Installs Extensions for VS Code:

| Extensions:               |                           |
| :------------------------ | :-------------------------|
| dnicolson.binary-plist    | PKief.material-icon-theme |
| jdinhlife.gruvbox         | zhouronghui.propertylist  |
| mauve.terraform           | ms-vscode.Go              |

11. Sets up local shell preferences
  * Install/update Git
  * Install Oh-My-Zsh
  * Downloads [Gruvbox](https://github.com/leblanck/gruvbox_iterm_theme.git) iTerm theme
  * Symlink all dotiles from `redpoint/resources/dotfiles` to `~`
  * Installs [Trash](https://github.com/sindresorhus/trash) from npm
  
12. Sets up local macOS preferences
