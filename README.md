
<p align="center"><img width=25% src="https://raw.githubusercontent.com/leblanck/leblanck.github.io/master/img/arrow.png"></p>

<div align="center">

<a href="">![GitHub issues](https://img.shields.io/github/issues-raw/leblanck/redpoint.svg)</a>
<a href="">![Contributions welcome](https://img.shields.io/badge/contributions-welcome-orange.svg)</a>
<a href="">![License](https://img.shields.io/badge/license-MIT-blue.svg)</a>
<a href="">![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)</a>

</div>

#### Why?
tl/dr; The need for setting up a new system using dotfiles and an installation script in minutes.

This repository serves as my way to help me setup and maintain my Mac(s). It takes the effort out of installing everything manually, as well as keep any .dotfiles up-to-date across Macs by just updating the repo locally. As time goes on, this is being tailored to more specifically target Python development and my own personal tastes. Enjoy! 😄

#### Install/Run:
1. Run `mkdir ~/repos && cd ~/repos`
2. Clone Repo: `git clone https://github.com/leblanck/redpoint.git`
3. run `./redPoint.sh`
           
#### What does this do?
1. Setup Logging to: `~/Library/Logs/redPoint.log`
2. Installs Xcode Command Line Tools
3. Sets up homebrew:
 * Installs or Updates brew
 * Installs macOS Apps:
 
| macOS Apps:              |                   |                   |                 |
| :----------------------- | :-------------    | :-----------------| :---------------|
| 1Password                | Adobe CC          | Clipy             |                 |
| Docker                   | Dozer             | Firefox           | Fliqlo          |
| iTerm2                   | Itsycal           | PyCharm CE        |                 | 
| Rectangle                |                   | Sketch            | Slack           | 
| Spotify                  | VS Code           | Wireshark         | Xnviewmp        |
 
 * Installs binaries:
 
| binaries:         |          |        |       
| :---------------- | :------- |:-------|
| pyenv             | poetry   | tree   |
| gotop             | npm      | pwgen  |
| speedtest         | neofetch |        |


4. Installs Extensions for VS Code:

| Extensions:               |                           |
| :------------------------ | :-------------------------|
| dnicolson.binary-plist    | PKief.material-icon-theme |
| jdinhlife.gruvbox         | zhouronghui.propertylist  |
| mauve.terraform           | ms-vscode.Go              |

5. Sets up local shell preferences:
  * Install/update Git
  * Install Oh-My-Zsh
  * Installs PowerLevel10k zsh Theme
  * Symlink all dotiles from [dotfiles](https://github.com/leblanck/dotfiles) to `~`
  * Installs [Trash](https://github.com/sindresorhus/trash) from npm

This is free to use, edit, change, learn from, but if you enjoy this, feel free to [buy me a coffee!](https://www.buymeacoffee.com/kyleblanc)
