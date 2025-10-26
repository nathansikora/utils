sudo apt update && sudo apt install -y flatpak curl && \
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
sudo flatpak install -y flathub com.rustdesk.RustDesk && \
proc_name="rustdesk"; ( crontab -l 2>/dev/null | grep -v "$proc_name"; echo "* * * * * \$HOME/.local/bin/watchdog.sh \"exec -a $proc_name flatpak run com.rustdesk.RustDesk\" \"$proc_name\"" ) | crontab -


