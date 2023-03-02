git clone https://github.com/ObolNetwork/charon-distributed-validator-node.git && \

chmod o+rw -R $HOME/charon-distributed-validator-node && \

mkdir $HOME/charon-distributed-validator-node/.charon && \

sudo chown -R 1000:1000 $HOME/charon-distributed-validator-node/.charon/ && \

cd $HOME/charon-distributed-validator-node && \

docker run --rm -v "$(pwd):/opt/charon" ghcr.io/obolnetwork/charon:v0.13.0 create enr