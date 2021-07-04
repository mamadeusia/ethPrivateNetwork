#!/bin/bash

# Creation of the genesis block of our ethereum network
geth init eth_common/genesis.json

# Setup the account
./eth_common/setup_account

# Run geth with the good configuration (using environment variables)
# Note: We use the --nodiscover and --maxpeers flags to make sure no one can
# discover our nodes and connect to them (security measure).
# Note 2: If we want to enable "auto discovery" between nodes, we could use the  --bootstrap flag.
# To keep our test network easy to use, we decided to add our nodes as peers manually (following the instructiomns of the README).
#ENV bootnode_env "enode://$(cat keys/enode_arg.key)@$(ifconfig eth0 | grep "inet " | awk '{print $2}'):30303"
echo "here you have to see >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo export bootnode_env=enode://$(cat keys/$enode_arg.key)@$(ifconfig eth0 | grep "inet " | awk '{print $2}'):30303
geth --identity=$identity_env --bootnodes=$bootnode_env --networkid=15 --verbosity=1 --mine --miner.threads=1 --rpc --rpcport=$rpcport_env --rpcaddr 0.0.0.0 --syncmode full console

