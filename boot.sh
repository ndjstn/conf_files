
# Chaotic aur
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com 
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu
sudo pacman -Sy && sudo powerpill -Su && paru -Su


# Install packages 
sudo pacman -S --needed aic94xx-firmware ast-firmware gnome-firmware linux-firmware linux-firmware-bnx2x linux-firmware-qcom \ 
  linux-firmware-qlogic linux-firmware-whence wd719x-firmware git wget curl top htop btop gtop \
  sdl2_ttf siji-ttf ttf-0xproto-nerd ttf-3270-nerd ttf-agave-nerd ttf-anonymouspro-nerd \
  ttf-arimo-nerd ttf-bigblueterminal-nerd ttf-bitstream-vera-mono-nerd ttf-cascadia-code-nerd \
  ttf-cascadia-mono-nerd ttf-cousine-nerd ttf-d2coding-nerd ttf-daddytime-mono-nerd ttf-dejavu \
  ttf-dejavu-nerd ttf-envycoder-nerd ttf-fantasque-nerd ttf-firacode-nerd ttf-font-awesome \
  ttf-go-nerd ttf-gohu-nerd ttf-hack ttf-hack-nerd ttf-heavydata-nerd ttf-iawriter-nerd \
  ttf-ibmplex-mono-nerd ttf-inconsolata-go-nerd ttf-inconsolata-lgc-nerd ttf-inconsolata-nerd ttf-intone-nerd \
  ttf-iosevka-nerd ttf-iosevkaterm-nerd ttf-iosevkatermslab-nerd ttf-jetbrains-mono ttf-jetbrains-mono-nerd \
  ttf-joypixels ttf-lekton-nerd ttf-liberation ttf-liberation-mono-nerd ttf-lilex-nerd ttf-martian-mono-nerd \
  ttf-meslo-nerd ttf-monofur-nerd ttf-monoid-nerd ttf-mononoki-nerd ttf-mplus-nerd ttf-nerd-fonts-symbols \
  ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono ttf-noto-nerd ttf-profont-nerd ttf-proggyclean-nerd \
  ttf-recursive-nerd ttf-roboto ttf-roboto-mono-nerd ttf-sharetech-mono-nerd ttf-sourcecodepro-nerd \
  ttf-space-mono-nerd ttf-terminus-nerd ttf-tinos-nerd ttf-ubuntu-mono-nerd ttf-ubuntu-nerd ttf-victor-mono-nerd \
  ttf-zed-mono-nerd  bluedevil blueman blueprint-compiler bluez bluez-libs bluez-qt bluez-utils gnome-bluetooth-3.0 \
  ttf-bigblueterminal-nerd qemu-audio-alsa qemu-audio-dbus qemu-audio-jack qemu-audio-oss qemu-audio-pa qemu-audio-pipewire \
  qemu-audio-sdl qemu-audio-spice qemu-base qemu-block-curl qemu-block-dmg qemu-block-gluster qemu-block-iscsi qemu-block-nfs \
  qemu-block-ssh qemu-chardev-baum qemu-chardev-spice qemu-common qemu-desktop qemu-docs qemu-emulators-full qemu-full \
  qemu-hw-display-qxl qemu-hw-display-virtio-gpu qemu-hw-display-virtio-gpu-gl qemu-hw-display-virtio-gpu-pci \
  qemu-hw-display-virtio-gpu-pci-gl qemu-hw-display-virtio-vga qemu-hw-display-virtio-vga-gl qemu-hw-s390x-virtio-gpu-ccw \
  qemu-hw-usb-host qemu-hw-usb-redirect qemu-hw-usb-smartcard qemu-img qemu-pr-helper qemu-system-aarch64 qemu-system-alpha \
  qemu-system-alpha-firmware qemu-system-arm qemu-system-arm-firmware qemu-system-avr qemu-system-hppa qemu-system-hppa-firmware \
  qemu-system-loongarch64 qemu-system-m68k qemu-system-microblaze qemu-system-microblaze-firmware qemu-system-mips qemu-system-or1k \
  qemu-system-ppc qemu-system-ppc-firmware qemu-system-riscv qemu-system-riscv-firmware qemu-system-rx qemu-system-s390x \
  qemu-system-s390x-firmware qemu-system-sh4 qemu-system-sparc qemu-system-sparc-firmware qemu-system-tricore qemu-system-x86 \
  qemu-system-x86-firmware qemu-system-xtensa qemu-tests qemu-tools qemu-ui-curses qemu-ui-dbus qemu-ui-egl-headless qemu-ui-gtk qemu-ui-opengl \
  qemu-ui-sdl qemu-ui-spice-app qemu-ui-spice-core qemu-user qemu-vhost-user-gpu qemu-vmsr-helper \
  libvirt libvirt-glib libvirt-python python-virtualenv qemu-hw-display-virtio-gpu qemu-hw-display-virtio-gpu-gl 
  qemu-hw-display-virtio-gpu-pci qemu-hw-display-virtio-gpu-pci-gl qemu-hw-display-virtio-vga qemu-hw-display-virtio-vga-gl 
  qemu-hw-s390x-virtio-gpu-ccw qt6-virtualkeyboard virt-install virt-manager virtiofsd libvirt libvirt-glib libvirt-python python-virtualenv virt-install virt-manager virtiofsd \
  gst-python ipython libvirt-python python python-annotated-types python-appdirs python-argcomplete python-asttokens python-attrs python-autocommand python-babel python-bcrypt \
  python-beautifulsoup4 python-black python-blinker python-build python-cachecontrol python-cachetools python-cachy python-cairo python-certifi \
  python-cffi python-cgi python-chardet python-charset-normalizer python-cleo python-click python-colorama python-colour python-contourpy \
  python-coverage python-crashtest python-cryptography python-cssselect python-cycler python-dateutil python-dbus python-debugpy python-decorator \
  python-defusedxml python-distlib python-distro python-docstring-to-markdown python-dulwich python-entrypoints python-executing \
  python-fastjsonschema python-filelock python-findpython python-flask python-flask-babel python-flask-cors python-fonttools \
  python-future python-gevent python-git-versioner python-gnuradio python-gobject python-google-api-core python-google-auth \
  python-googleapis-common-protos python-gpgme python-greenlet python-gtts python-gtts-token python-html5lib python-httplib2 \
  python-idna python-importlib-metadata python-iniconfig python-installer python-ipython-genutils python-itsdangerous python-jaraco.classes \
  python-jaraco.collections python-jaraco.context python-jaraco.functools python-jaraco.text python-jedi python-jeepney python-jinja \
  python-jsonschema python-jsonschema-specifications python-keyring python-kiwisolver python-langdetect python-lark-parser python-legacy-cgi \
  python-libtmux python-lockfile python-lsp-black python-lsp-jsonrpc python-lsp-server python-lxml python-mako python-markdown python-markdown-it-py \
  python-markupsafe python-matplotlib python-matplotlib-inline python-mccabe python-mdurl python-more-itertools python-msgpack python-mypy_extensions \
  python-networkx python-numpy python-oauth2client python-orjson python-packaging python-pandas python-paramiko python-parso python-pathspec \
  python-pbs-installer python-pexpect python-pillow python-pip python-pip-system-certs python-pipx python-pkginfo python-platformdirs python-playwright \
  python-pluggy python-poetry python-poetry-core python-poetry-plugin-export python-pooch python-prompt_toolkit python-protobuf python-psutil \
  python-ptyprocess python-pure-eval python-pyasn1 python-pyasn1-modules python-pyaudio python-pycodestyle python-pycparser python-pycups \
  python-pydantic python-pydantic-core python-pyee python-pyflakes python-pygccxml python-pygdbmi python-pygments python-pynacl python-pyparsing \
  python-pyperclip python-pyproject-hooks python-pyqt5 python-pyqt5-sip python-pyqt5-webengine python-pyqt6 python-pyqt6-sip python-pyqt6-webengine \
  python-pyqtgraph python-pyserial python-pysocks python-pytest python-pytz python-pyxdg python-pyzmq python-rapidfuzz python-referencing python-requests \
  python-requests-toolbelt python-resolvelib python-rich python-rpds-py python-rsa python-scipy python-secretstorage python-send2trash python-sentry_sdk \
  python-setproctitle python-setuptools python-shellingham python-six python-skia-pathops python-soupsieve python-srt python-stack-data python-thrift \
  python-tomlkit python-tqdm python-traitlets python-trove-classifiers python-typing_extensions python-uc-micro-py python-ujson python-urllib3 python-userpath \
  python-virtualenv python-waitress python-watchdog python-wcwidth python-webencodings python-websockets python-werkzeug python-wheel python-wrapt python-xmltodict \
  python-yaml python-zipp python-zope-event python-zope-interface python-zstandard python2 python2-debug python312 python312-debug uwsgi-plugin-python\
  cups cups-filters cups-pk-helper libcups libcupsfilters obsidian polybar i3 bspwm kitty alacritty ghostty wezterm glow ghostwriter networkmanager \ 
  firefox vivaldi vscodium ostree tree tree-sitter tree-sitter-c tree-sitter-lua tree-sitter-markdown tree-sitter-query tree-sitter-vim tree-sitter-vimdoc \
  gnuradio-osmosdr rtl-sdr soapysd cheese zoom ticktick task xorg-fonts-encodings xorg-server xorg-server-common xorg-server-xephyr xorg-server-xvfb \
  xorg-setxkbmap xorg-xauth xorg-xdpyinfo xorg-xinit xorg-xkbcomp xorg-xmessage xorg-xmodmap xorg-xprop xorg-xrandr xorg-xrdb xorg-xset xorg-xsetroot \
  xorg-xwayland xorgproto xsel clipcat python-pyperclip wl-clipboard xclip clamav clamtk clamav-unofficial-sigs metaspoliot kernalshark termshark wireshark-cli wireshark-qt \
  bettercap bettercap-caplets ettercap ettercap-gtk  soapyrtlsdr r rstudio-desktop obs-studio reminna teams-for-linux python-openai-whisper \
  alacritty base-devel bat brightnessctl bspwm clipcat dunst eza feh gvfs-mtp firefox geany git imagemagick jq jgmenu kitty libwebp maim \
  mpc mpd mpv neovim ncmpcpp npm pamixer pacman-contrib papirus-icon-theme picom playerctl polybar polkit-gnome python-gobject redshift rofi rustup \
  sxhkd tmux xclip xdg-user-dirs xdo xdotool xsettingsd xorg-xdpyinfo xorg-xkill xorg-xprop xorg-xrandr xorg-xsetroot xorg-xwininfo yazi zsh \
  zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting ttf-inconsolata ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-terminus-nerd \ 
  ttf-ubuntu-mono-nerd ueberzugpp webp-pixbuf-loader paru tdrop eww-git i3lock-color simple-mtpfs gh0stzk-gtk-themes gh0stzk-cursor-qogirr \ 
  gh0stzk-icons-beautyline gh0stzk-icons-candy gh0stzk-icons-catppuccin-mocha gh0stzk-icons-dracula gh0stzk-icons-glassy gh0stzk-icons-gruvbox-plus-dark \ 
  gh0stzk-icons-hack gh0stzk-icons-luv gh0stzk-icons-sweet-rainbow gh0stzk-icons-tokyo-night gh0stzk-icons-vimix-white gh0stzk-icons-zafiro gh0stzk-icons-zafiro-purple --nonconfirm
  
# Install yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf /yay
sudo pacman -Syu


yay -S --noconfirm librewolf opera mpd ncmpcpp paru yazi dunst zsh-auto-dunstify 

# Install ollama 
curl -fsSL https://ollama.com/install.sh | sh

for model in nomic-embed-text deepscaler deepseek-r1:1.5b llama3.2 qwen2.5 qwen2.5-coder phi3 granite3.2:2b; do echo "ollama pull $model"; done

curl -LO https://raw.githubusercontent.com/gh0stzk/dotfiles/master/RiceInstaller

chmod +x RiceInstaller

./RiceInstaller

