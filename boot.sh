sh#!/usr/bin/env bash
set -euo pipefail

# Error handler
error_exit() {
  echo "Error on line $1. Exiting."
  exit 1
}
trap 'error_exit $LINENO' ERR

echo "=== Starting installation process ==="

# -----------------------------------------------------------------------------
# Chaotic-AUR setup
# -----------------------------------------------------------------------------
echo "-> Importing Chaotic-AUR key..."
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

echo "-> Installing Chaotic-AUR keyring and mirrorlist..."
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Append Chaotic-AUR repo config if it doesn't already exist
if ! grep -q "^\[chaotic-aur\]" /etc/pacman.conf; then
  echo "-> Adding [chaotic-aur] repository to /etc/pacman.conf..."
  echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
fi

echo "-> Updating system packages..."
sudo pacman -Syu --noconfirm
sudo pacman -Sy --noconfirm && sudo powerpill -Su --noconfirm && paru -Su --noconfirm

# -----------------------------------------------------------------------------
# Install AUR helper (yay)
# -----------------------------------------------------------------------------
echo "-> Installing AUR helper (yay)..."
if ! command -v yay &>/dev/null; then
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
else
  echo "yay is already installed."
fi

# -----------------------------------------------------------------------------
# Install packages via pacman
# -----------------------------------------------------------------------------
echo "-> Installing main packages..."
sudo pacman -S --needed --noconfirm \
  aic94xx-firmware ast-firmware gnome-firmware linux-firmware linux-firmware-bnx2x linux-firmware-qcom \
  linux-firmware-qlogic linux-firmware-whence wd719x-firmware git wget curl htop btop gtop \
  sdl2_ttf  ttf-0xproto-nerd ttf-3270-nerd ttf-agave-nerd ttf-anonymouspro-nerd \
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
  ttf-zed-mono-nerd bluedevil blueman blueprint-compiler bluez bluez-libs bluez-qt bluez-utils gnome-bluetooth-3.0 \
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
  libvirt libvirt-glib libvirt-python python-virtualenv qemu-hw-display-virtio-gpu qemu-hw-display-virtio-gpu-gl \
  qemu-hw-display-virtio-gpu-pci qemu-hw-display-virtio-gpu-pci-gl qemu-hw-display-virtio-vga qemu-hw-display-virtio-vga-gl \
  qemu-hw-s390x-virtio-gpu-ccw qt6-virtualkeyboard virt-install virt-manager virtiofsd libvirt libvirt-glib libvirt-python python-virtualenv virt-install virt-manager virtiofsd \
  gst-python ipython libvirt-python python python-annotated-types python-appdirs python-argcomplete python-asttokens python-attrs python-autocommand python-babel python-bcrypt \
  python-beautifulsoup4 python-black python-blinker python-build python-cachecontrol python-cachetools python-cachy python-cairo python-certifi \
  python-cffi python-cgi python-chardet python-charset-normalizer python-cleo python-click python-colorama python-colour python-contourpy \
  python-coverage python-crashtest python-cryptography python-cssselect python-cycler python-dateutil python-dbus python-debugpy python-decorator \
  python-defusedxml python-distlib python-distro python-docstring-to-markdown python-dulwich python-entrypoints python-executing \
  python-fastjsonschema python-filelock python-findpython python-flask python-flask-babel python-flask-cors python-fonttools \
 python-gevent python-gnuradio python-gobject python-google-api-core python-google-auth \
  python-googleapis-common-protos python-gpgme python-greenlet python-gtts  python-html5lib python-httplib2 \
  python-idna python-importlib-metadata python-iniconfig python-installer python-ipython-genutils python-itsdangerous python-jaraco.classes \
  python-jaraco.collections python-jaraco.context python-jaraco.functools python-jaraco.text python-jedi python-jeepney python-jinja \
  python-jsonschema python-jsonschema-specifications python-keyring python-kiwisolver python-lark-parser python-legacy-cgi \
  python-libtmux python-lockfile python-lsp-black python-lsp-jsonrpc python-lsp-server python-lxml python-mako python-markdown python-markdown-it-py \
  python-markupsafe python-matplotlib python-matplotlib-inline python-mccabe python-mdurl python-more-itertools python-msgpack python-mypy_extensions \
  python-networkx python-numpy python-oauth2client python-packaging python-pandas python-paramiko python-parso python-pathspec \
  python-pbs-installer python-pexpect python-pillow python-pip  python-pipx python-pkginfo python-platformdirs python-playwright \
  python-pluggy python-poetry python-poetry-core python-poetry-plugin-export python-pooch python-prompt_toolkit python-protobuf python-psutil \
  python-pure-eval python-pyasn1 python-pyasn1-modules python-pyaudio python-pycodestyle python-pycparser python-pycups \
  python-pydantic python-pydantic-core python-pyee python-pyflakes python-pygccxml python-pygdbmi python-pygments python-pynacl python-pyparsing \
  python-pyperclip python-pyproject-hooks python-pyqt5 python-pyqt5-sip python-pyqt5-webengine python-pyqt6 python-pyqt6-sip python-pyqt6-webengine \
  python-pyqtgraph python-pyserial python-pysocks python-pytest python-pytz python-pyxdg python-pyzmq python-rapidfuzz python-referencing python-requests \
  python-requests-toolbelt python-resolvelib python-rich python-rpds-py python-rsa python-scipy python-secretstorage python-send2trash python-sentry_sdk \
  python-setproctitle python-setuptools python-shellingham python-six python-skia-pathops python-soupsieve python-srt python-stack-data python-thrift \
  python-tomlkit python-tqdm python-traitlets python-trove-classifiers python-typing_extensions python-uc-micro-py python-ujson python-urllib3 python-userpath \
  python-virtualenv python-waitress python-watchdog python-wcwidth python-webencodings python-websockets python-werkzeug python-wheel python-wrapt python-xmltodict \
  python-yaml python-zipp python-zope-event python-zope-interface python-zstandard uwsgi-plugin-python\
  cups cups-filters cups-pk-helper libcups libcupsfilters obsidian polybar i3 bspwm kitty alacritty ghostty wezterm glow ghostwriter networkmanager \
  firefox vivaldi vscodium ostree tree tree-sitter tree-sitter-c tree-sitter-lua tree-sitter-markdown tree-sitter-query tree-sitter-vim tree-sitter-vimdoc \
  gnuradio-osmosdr rtl-sdr  cheese zoom task xorg-fonts-encodings xorg-server xorg-server-common xorg-server-xephyr xorg-server-xvfb \
  xorg-setxkbmap xorg-xauth xorg-xdpyinfo xorg-xinit xorg-xkbcomp xorg-xmessage xorg-xmodmap xorg-xprop xorg-xrandr xorg-xrdb xorg-xset xorg-xsetroot \
  xorg-xwayland xorgproto xsel clipcat python-pyperclip wl-clipboard xclip clamav clamtk clamav-unofficial-sigs  \
  bettercap bettercap-caplets ettercap ettercap-gtk  soapyrtlsdr r rstudio-desktop obs-studio teams-for-linux python-openai-whisper \
  alacritty base-devel bat brightnessctl bspwm clipcat dunst eza feh gvfs-mtp firefox geany git imagemagick jq jgmenu kitty libwebp maim \
  mpc mpd mpv neovim ncmpcpp npm pamixer pacman-contrib papirus-icon-theme picom playerctl polybar polkit-gnome python-gobject redshift rofi rustup \
  sxhkd tmux xclip xdg-user-dirs xdo xdotool xsettingsd xorg-xdpyinfo xorg-xkill xorg-xprop xorg-xrandr xorg-xsetroot xorg-xwininfo yazi zsh \
  zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting ttf-inconsolata ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-terminus-nerd \
  ttf-ubuntu-mono-nerd ueberzugpp webp-pixbuf-loader paru tdrop eww-git i3lock-color simple-mtpfs openssh rsync openmpi slurm nfs-utils base-devel gcc ntp \
  fail2ban rkhunter chkrootkit lynis apparmor audit scala ruby go zig jdk-openjkd mpich torque corosync pacemaker etcd haproxy ansible salt sdh pdsh cssh \
  wireshark john hydra sqlmap wifite netcat-openbsd nikto burpsuite hashcat tcpdump gobuster recon-ng openvas masscan wpscan commix \
  firewalld lynis tripwire ossec-hids snort suricata zeek modsecurity logwatch aide openscap osquery syslog-ng tlp powertop \ 
  cpupower thermald laptop-mode-tools preload tuned i7z earlyoom clang cmake subversion mercurial emacs fldigi wsjt-x direwolf hamlib \
  gpredict gqrx cubicsdr qssttv xastir multimon-ng chrip-next quisk cqrlog minimodoem welle.io wsprdaemon soapy-sdr sdrangel rigctld \
  gnuradio gpredict satnogs-client gr-osmosdr soapy-sdr kalibrateee-rtl python-epphem pyorbital gnss-sdr gr-satellites satnogs-tools \
  wsprdaemon pysat satpy skyfiled gis grass marble osm2pgsql viking gnome-maps apertium omegat poedit virtaal espeak-ng festival \
  mbrola flite rhvoice pico2wave tesseract ocropus cuneiform gimagereader texlive-most texmaker kile pandoc sigil fbreader zathura libreoffice-fresh \ 
  gedit abiwork lyx joplin inkscape gimp ghostwriter ghostscript evince xournalpp librecad krita geany emacas scribus calibre-web pdrarranger jabref zim \
  darktable rawtherapee digikam shotwell imagemagick exiftool geeqie nomacs kdenlive shotcut handbrake handbrake-cli avidemux krita blender synfig xviewer \
  android-tools scrcpy libmtp gvfs-mtp mtpfs libimobiledevice ifuse ideviceinstaller usbmuxd idevicebackup idevicediagnostics \ 
  libplist gvfs-afc gnome-shell-extension-gsconnect openmtp obexftp obexpushd gnome-bluetooth qutebrowser dillow netsurf lync elinks midori surf \
  python-scrapy python-lxml python-requests nodejs-cheerio python-selenium proxychains-ng privoxy openvpn openconnect wireguard-tools \
  keepassxc python-mechanize bitcoin bitcoin-qqt electrum litcoin monero zcash dash dogecoin solidity truffle substrate \
  gnuhealth openemr openmrs librehealth-dhr orthanc dcm4che 3d-slicer invesalius medinria oscar postgressql msysql python-numy r-base jitsi nextcloud \ 
  pidgin element-desktop weechat irssi hexchat linphone ekiga asterisk freeswtich twinkle qtox signal-cli mattermost-desktop mumble \
  zulip-desktop poezio psi gajim aircrack-ng reaver wifite kismet hcxdumptool tcpdump airgeddon fluxion bully pixiewps pyrit scapy \
  iw mdk3 mdk4 dsniff cheese guvcview v4l-utils motion gnucash kmymoney thunderbird evolution zotero nextcloud ganttproject \
  scribus ledger-cli redmine zim batman-adv batctl olsrd olsrd-plugins babeld cjdns frr hostapd iw wpa_supplicant netctl \
  wireguard-tools tinc zerotier-one nodewatcher gnunet serf iproute2 gnome-online-accounts evolution thunderbird gnome-calendar \
  gnome-contacts nextcloud-client owncloud-client kio-gdrive rclone davmail icloudpd keepassxc gnome-todo korganizer google-drive-ocamlfuse kmail \
  octave sagemath maxima gnuplot python-sympy python-scipy qgis grass freecad librecad goegebra scilab openfoam paraview gmsh jmol avogadro \
  kicad qcad fritzing salome elmerfem openfoam code-aster su2 calculix scilab gephi weka sqlitebrowser julia python-nltk \
  python-nltk python-gensim python-textblob python-scikit-learn python-stanza python-transformers mallet tika-app \
  python-enchant python-chardet python-rouge python-sumy python-corextopic python-sentence-transformers python-wordcloud python-flair \
  python-bert-extractive-summarizer freemind freeplane vyms docear labryinth compendium plantuml dia umbrello argouml modelio papyrus umlet bouml \
  drawio libreoffice-draw inkscape pencil-project yakindu-statechart-tools eclipse-uml2-tools graphviz violet-uml-editor mermaid-cli openmodelsphere \
  uml-designer umlgraph ganttproject taskjuggler kanboard openproject libreplan collabtive dotproject tuleap odoo trac phabricator \ 
  leantime wekan zentao taskcoach planner gitea gitlab mattermost rocket-chat zulip etherpad-lit jenkins code-server tmate \
  tagspaces tmsu tracker recoll dolphin thunar pcmanfm double-commander ranger nnn mc kursader fslint file-roller mucommander spacefm xfe caja pcmanfm-qt \
  simplescreenrecorder vokoscreenNG  kazam recordmydesktop screenkey key-mon streamlink gromit-mpx xosd kooha shotcut byzanz \
  transmission-gt qbittorrent deluge rtorrent ctorrent aria2 ipfs retroshare amule mldonkey onionshare tribler webtorrent-cli peerflix \
  libgen-cli scihub-py frostwire gnunet lbry-app telegram torbrowser-launcher torsocks nyx obfs4proxy meek onionbalance  \ 
  tor-geoipdb onioncat privoxy ricochet onionshare torify tor-resolve torsocks-ng torbrowser-data tortray tor-monitor torgraph torconf \ 
  



# -----------------------------------------------------------------------------
# Install X11/Wayland packages
# -----------------------------------------------------------------------------
echo "-> Installing X11 packages..."
sudo pacman -S --needed --noconfirm xorg-server xorg-server-common xorg-xinit xorg-xrandr xorg-xwayland

echo "-> Installing additional Wayland packages..."
sudo pacman -S --needed --noconfirm wayland weston



# -----------------------------------------------------------------------------
# Install additional AUR packages
# -----------------------------------------------------------------------------
echo "-> Installing additional AUR packages..."
yay -S --noconfirm librewolf opera mpd ncmpcpp paru yazi dunst zsh-auto-dunstify

# -----------------------------------------------------------------------------
# Install Ollama
# -----------------------------------------------------------------------------
echo "-> Installing ollama..."
curl -fsSL https://ollama.com/install.sh | sh

echo "-> Pulling ollama models..."
for model in nomic-embed-text deepscaler deepseek-r1:1.5b llama3.2 qwen2.5 qwen2.5-coder phi3 granite3.2:2b; do
  echo "Pulling model: $model"
  if ! ollama pull "$model"; then
    echo "Warning: Failed to pull model: $model"
  fi
done

# -----------------------------------------------------------------------------
# Download and run RiceInstaller
# -----------------------------------------------------------------------------
echo "-> Downloading RiceInstaller..."
curl -LO https://raw.githubusercontent.com/gh0stzk/dotfiles/master/RiceInstaller
chmod +x RiceInstaller

echo "-> Running RiceInstaller..."
./RiceInstaller

echo "=== Installation process completed successfully ==="
