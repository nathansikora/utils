echo "$(whoami) ALL=(ALL) NOPASSWD: ALL" | sudo EDITOR='tee -a' visudo && \
sudo apt update -y && \
sudo apt upgrade -y --fix-broken && \
sudo apt autoremove -y && \ 
sudo apt autoclean -y && \
curl https://raw.githubusercontent.com/nathansikora/utils/refs/heads/main/get_watchdog.sh | bash && \
curl https://raw.githubusercontent.com/nathansikora/utils/refs/heads/main/get_flatpak.sh | bash && \
curl https://raw.githubusercontent.com/nathansikora/utils/refs/heads/main/get_midori.sh | bash && \
curl https://raw.githubusercontent.com/nathansikora/utils/refs/heads/main/get_rustdesk.sh | bash
