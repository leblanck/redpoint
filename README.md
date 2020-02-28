<p align="center"><img width=25% src="https://raw.githubusercontent.com/leblanck/leblanck.github.io/master/img/arrow.png"></p>
<p align="center"><img width=60% src="https://raw.githubusercontent.com/leblanck/leblanck.github.io/master/img/rplogo.png"></p>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![GitHub issues](https://img.shields.io/github/issues-raw/leblanck/redpoint.svg)
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
1. Setup Logging to: `/Library/Logs/redPoint.log`
2. Installs the following apps


| Installs macOS Apps:     |                   |                   |                 |
| :----------------------- | :-------------    | :-----------------| :---------------|
| 1Password                | Adobe CC          | Atom              | Clipy           |
| Dozer                    | Firefox           | Fliqlo            | iTerm2          |
| Itsycal                  | Messenger         | Notion            | Sketch          |
| Slack                    | Spotify           | VS Code           | Wireshark       |
| Xnviewmp     


3. Installs Themes for Atom:
* firewatch-syntax
* halcyon-syntax
* apple-wwdc-2016-syntax
* gruvbox
4. Installs Packages for Atom:
* file-icons
* minimap
* pigments
5. Installs Atom CLI Tools
6. Installs PWGen
7. Installs npm
8. Installs [Trash](https://github.com/sindresorhus/trash)
9. Installs GoTop
10. Installs neofetch
11. Sets up local zsh shell
12. Sets up local macOS preferences

###### Alternate Download
```bash
curl -L -o bustIT.sh https://raw.githubusercontent.com/leblanck/bustit/master/bustIT.sh
```
OR (may be outdated)

```bash
curl -L -o bustIT.sh https://leblanck.github.io/bustIT.sh
```
