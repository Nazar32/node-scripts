curl -s https://raw.githubusercontent.com/razumv/helpers/main/monitor.sh > monitor.sh && chmod +x monitor.sh && ./monitor.sh && \

wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb && \

sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb && \

bash <(curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/3proxy.sh) && \

curl -s https://raw.githubusercontent.com/razumv/helpers/main/tools/install_docker.sh | bash
