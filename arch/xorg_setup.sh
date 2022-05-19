
# video driver:
xf86-video-fbdev

# Should install apropriatre hardware drivers for all components on real machines

# big meta package with all x11 things in it
xorg
# used to startx via config file, if you don't setup login manager like light-dm
xorg-xinit

# setting up xorg-xinit:
cp /etc/X11/xinit/xinitrc /home/dt/.xinitrc (should be in home dir)

# to startx automatically:
nano ~/.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1

# remove last 5 lines with twm if you want, since it's not very good window manager

# set wallpaper, also start compositor - picom and finally start dwm
# (normal user should be created to login with, not root):
nitrogen --restore & picom & exec dwm
# wallpaper engine
nitrogen
# compositor:
picom
# terminal emulator is important before starting window manager

# set resolution:
xrandr -s 1680x1050
# enable AUR:
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
pacman -S base-devel
makepkg -si

# distro tube has his own light dm in aur
yay -S dwm-distrotube-git st-distrotube-git dmenu-distrotube-git nerd-fonts-mononoki

# the better approach instead of startx is to install login manager like light dm,
# it allows to run multiple window managers

=============================================================================
# Combined command:
pacman -S xf86-video-fbdev xorg xorg-xinit nitrogen picom

=============================================================================
//REF:
https://www.youtube.com/watch?v=pouX5VvX0_Q
