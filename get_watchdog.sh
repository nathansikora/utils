mkdir -p ~/.local/bin && \
curl -o ~/.local/bin/watchdog.sh https://raw.githubusercontent.com/nathansikora/utils/refs/heads/main/watchdog.sh && \
sed -i 's/\r$//' ~/.local/bin/watchdog.sh && \
chmod +x ~/.local/bin/watchdog.sh
