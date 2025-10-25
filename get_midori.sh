flatpak install -y flathub org.midori_browser.Midori && \
echo -e '#!/bin/bash\nflatpak run org.midori_browser.Midori' > ~/Desktop/midori.sh && \
chmod +x ~/Desktop/midori.sh && \
echo '✅ Midori installed. Run it anytime with ~/Desktop/midori.sh'
