sudo systemctl stop nibid && \

cp $HOME/.nibid/data/priv_validator_state.json $HOME/.nibid/priv_validator_state.json.backup && \
nibid tendermint unsafe-reset-all --home $HOME/.nibid --keep-addr-book && \

SNAP_RPC="https://nibiru-testnet.nodejumper.io:443" && \
LATEST_HEIGHT=$(curl -s $SNAP_RPC/block | jq -r .result.block.header.height) && \
BLOCK_HEIGHT=$((LATEST_HEIGHT - 2000)) && \
TRUST_HASH=$(curl -s "$SNAP_RPC/block?height=$BLOCK_HEIGHT" | jq -r .result.block_id.hash) && \

echo $LATEST_HEIGHT $BLOCK_HEIGHT $TRUST_HASH && \

PEERS="a1b96d1437fb82d3d77823ecbd565c6268f06e34@nibiru-testnet.nodejumper.io:27656"
sed -i 's|^persistent_peers *=.*|persistent_peers = "'$PEERS'"|' $HOME/.nibid/config/config.toml && \

sed -i 's|^enable *=.*|enable = true|' $HOME/.nibid/config/config.toml && \
sed -i 's|^rpc_servers *=.*|rpc_servers = "'$SNAP_RPC,$SNAP_RPC'"|' $HOME/.nibid/config/config.toml && \
sed -i 's|^trust_height *=.*|trust_height = '$BLOCK_HEIGHT'|' $HOME/.nibid/config/config.toml && \
sed -i 's|^trust_hash *=.*|trust_hash = "'$TRUST_HASH'"|' $HOME/.nibid/config/config.toml && \

mv $HOME/.nibid/priv_validator_state.json.backup $HOME/.nibid/data/priv_validator_state.json && \

curl -s https://snapshots2-testnet.nodejumper.io/nibiru-testnet/wasm.lz4 | lz4 -dc - | tar -xf - -C $HOME/.nibid/data && \

sudo systemctl restart nibid && \

sudo journalctl -u nibid -f --no-hostname -o cat
