HOST="$(cat  tmp.json | jq -r '.host')"
NAME="$(cat  tmp.json | jq -r '.name')"
USER="$(cat  tmp.json | jq -r '.user')"
PASSWORD="$(cat  tmp.json | jq -r '.password')"
sed -i 's/${DB_HOST}/'$HOST'/'  wp-config.php
sed -i 's/${DB_USER}/'$USER'/'  wp-config.php
sed -i 's/${DB_PASSWORD}/'"$PASSWORD"'/'  wp-config.php
sed -i 's/${DB_NAME}/'"$NAME"'/'  wp-config.php
AUTH_KEY="$(pwgen 40 1)"
SECURE_AUTH_KEY="$(pwgen 40 1)"
LOGGED_IN_KEY="$(pwgen 40 1)"
NONCE_KEY="$(pwgen 40 1)"
AUTH_SALT="$(pwgen 40 1)"
SECURE_AUTH_SALT="$(pwgen 40 1)"
LOGGED_IN_SALT="$(pwgen 40 1)"
NONCE_SALT="$(pwgen 40 1)"


sed -i 's/${AUTH_KEY}/'"$AUTH_KEY"'/'  wp-config.php
sed -i 's/${SECURE_AUTH_KEY}/'"$SECURE_AUTH_KEY"'/'  wp-config.php
sed -i 's/${LOGGED_IN_KEY}/'"$LOGGED_IN_KEY"'/'  wp-config.php
sed -i 's/${NONCE_KEY}/'"$NONCE_KEY"'/'  wp-config.php
sed -i 's/${AUTH_SALT}/'"$AUTH_SALT"'/'  wp-config.php
sed -i 's/${SECURE_AUTH_SALT}/'"$SECURE_AUTH_SALT"'/'  wp-config.php
sed -i 's/${LOGGED_IN_SALT}/'"$LOGGED_IN_SALT"'/'  wp-config.php
sed -i 's/${NONCE_SALT}/'"$NONCE_SALT"'/'  wp-config.php

rm tmp.json
