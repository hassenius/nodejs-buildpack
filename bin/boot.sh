export APP_ROOT=$HOME

erb $APP_ROOT/config/nginx.conf.orig > $APP_ROOT/config/nginx.conf

# ------------------------------------------------------------------------------------------------

#mkfifo $APP_ROOT/nginx/logs/access.log
#mkfifo $APP_ROOT/nginx/logs/error.log

#cat < $APP_ROOT/nginx/logs/access.log &
#(>&2 cat) < $APP_ROOT/nginx/logs/error.log &

nginx_bin = $(which nginx)
$nginx_bin -p $APP_ROOT -c $APP_ROOT/config/nginx.conf &
exec npm start

# ------------------------------------------------------------------------------------------------
