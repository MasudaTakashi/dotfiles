# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

# Load common libray
. "$DOTPATH"/etc/scripts/common.sh

# Ask for the administrator password upfront
#sudo -v

# Keep-alive: update existing `sudo` time stamp
#             until this script has finished
#while true
#do
#    sudo -n true
#    sleep 60;
#    kill -0 "$$" || exit
#done 2>/dev/null &

# shellcheck disable=SC2102
for i in "$DOTPATH"/etc/init/*.sh
do
    if [ -f "$i" ]; then
        log_info "$(e_arrow "$(basename "$i")")"
        if [ "${DEBUG:-}" != 1 ]; then
            bash "$i"
        fi
    else
        continue
    fi
done

log_pass "$0: Finish!!" | sed "s $DOTPATH \$DOTPATH g"
