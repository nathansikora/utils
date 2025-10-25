sudo apt update && sudo apt install -y flatpak curl && \
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
sudo flatpak install -y flathub com.rustdesk.RustDesk && \
( crontab -l 2>/dev/null | grep -v "watchdog.sh"; echo '* * * * * $HOME/.local/bin/watchdog.sh "flatpak run com.rustdesk.RustDesk" "rustdesk"' ) | crontab -

