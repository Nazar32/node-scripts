sudo systemctl stop gear && \
wget https://get.gear.rs/gear-nightly-linux-x86_64.tar.xz && \
sudo tar -xvf gear-nightly-linux-x86_64.tar.xz -C /root && \
rm gear-nightly-linux-x86_64.tar.xz && \
sudo systemctl start gear
