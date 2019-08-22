#!/bin/sh

# Parameter
# $1 = database username
# $2 = user password
# $3 = database host (ex. localhost)
# $4 = database name

export NETWORK="Nekonium"
export SUBNETWORK="Mainnet"
export NETWORK_ICON="_network_icon.html"
export LOGO="/images/nekonium.svg"
export ETHEREUM_JSONRPC_VARIANT="parity"
export ETHEREUM_JSONRPC_HTTP_URL="localhost:8293"
export ETHEREUM_JSONRPC_TRACE_URL="localhost:8293"
export ETHEREUM_JSONRPC_WS_URL="ws://localhost:8294"
export NETWORK_PATH=""
export SECRET_KEY_BASE=$(cat secret.key)
export CHECK_ORIGIN="false"
export PORT=8080
export COIN="NUKO"
export DATABASE_URL="postgresql://$1:$2@$3/$4"
export POOL_SIZE=20
export ECTO_USE_SSL="true"
export HEART_COMMAND="./run.sh"
export FIRST_BLOCK=0
export COINMARKETCAP_PAGES=19

MIX_ENV=prod mix phx.server
