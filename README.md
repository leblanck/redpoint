Bust IT - new env set-up for macOS
======

#### Why?
This is target toward UX/WebDevs (myself) mostly. I was fed up with installing the same apps constantly when moving to a new macOS box. 

#### How to use:
1. Clone Repo
2. Change permissions on file to allow exec `sudo chmod +x`
3. run using `./bustIT.sh`

#### What does this do?
1. Setup Logging to: `/Library/Logs/butIT.log`
2. Installs the following apps
* Sketch
* Figma
* Dropbox
* Atom
* Adobe Creative Suite
* Fliqlo
* iTerm2
* Dozer
* Zeplin
* Spectacle
* Clipy
* Github Desktop
* Wireshark
* Slack
* Messenger
* XnViewMP
3. Installs Themes for Atom:
* firewatch-syntax
* halcyon-syntax
* apple-wwdc-2016-syntax
4. Installs Packages for Atom:
* file-icons
* minimap
* pigments
5. Installs Atom CLI Tools
6. Installs PWGen
7. Installs npm
7. Installs Firebase
8. Installs [Trash](https://github.com/sindresorhus/trash)
9. Sets up local zsh shell
10. Sets up local macOS preferences

###### Alternate Download
```bash
curl -L -o bustIT.sh https://raw.githubusercontent.com/leblanck/bustit/master/bustIT.sh
```
OR (may be outdated)

```bash
curl -L -o bustIT.sh https://leblanck.github.io/bustIT.sh
```

[![Stories in Ready](https://badge.waffle.io/leblanck/leblanck.github.io.png?label=ready&title=Ready)](http://waffle.io/leblanck/leblanck.github.io)
