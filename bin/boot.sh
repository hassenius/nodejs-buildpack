export APP_ROOT=$HOME

erb $APP_ROOT/config/nginx.conf.orig > $APP_ROOT/config/nginx.conf

echo "Current config"
cat $APP_ROOT/config/nginx.conf

echo "Home dir"
dir $APP_ROOT

# ------------------------------------------------------------------------------------------------

mkfifo $APP_ROOT/nginx/logs/access.log
mkfifo $APP_ROOT/nginx/logs/error.log

cat < $APP_ROOT/nginx/logs/access.log &
(>&2 cat) < $APP_ROOT/nginx/logs/error.log &

nginx_bin = $(which nginx)
echo "Found nginx binary: ${nginx_bin}}"

$APP_ROOT/nginx/sbin/nginx -p $APP_ROOT/nginx -c $APP_ROOT/config/nginx.conf &
exec npm start

# ------------------------------------------------------------------------------------------------
