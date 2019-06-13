#!/bin/sh

# Please update apps/explorer/config/dev.secret.exs
# And apps/block_scout_web/config/dev.secret.exs
# Before running this script!
# See https://forum.poa.network/t/manual-blockscout-deployment/2458

echo "Removing front end built files..."
remove -r apps/block_scout_web/priv/static

# Compile
echo "Compiling..."
mix do deps.get, local.rebar --force, deps.compile, compile

# Database drop
echo "Dropping databases..."
mix do ecto.drop

# Database create
echo "Creating database..."
mix do ecto.create, ecto.migrate

# Installing and compiling web backend dependency
echo "Installing nodejs dependency for backend and frontend..."
cd apps/block_scout_web/assets; npm install && node_modules/webpack/bin/webpack.js --mode production; cd -
cd apps/explorer && npm install; cd -

SECRET_KEY=$(mix phx.gen.secret)

echo "*** THIS MIGHT BE IMPORTANT!!! STORED phx.gen.secret=>secret.key"
echo $SECRET_KEY > secret.key

MIX_ENV=prod mix release --env=prod
