
# clone yay:
git clone https://aur.archlinux.org/yay-git.git
# build yay package:
makepkg -si
# that's it, yay can be used now

# intellij:
yay -S intellij-idea-ultimate-edition

# search for available jdk versions
sudo pacman -sS java | grep jre
# install jdk 11
sudo pacman -S jre11-openjdk
