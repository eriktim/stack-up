#!/bin/sh

set -e

. /etc/stack-up.conf

mountpoint -q $stackMount
if [ "$?" -ne 0 ]; then
    echo "[stack] not mounted" >&2
    exit 1
fi

CMD="rsync -au"

for d in $stackList; do
    if [ -e "$d" ]; then
        dir=$(dirname "$stackMount/$stackPath/$d")
        if [ ! -e "$dir" ]; then
            mkdir -p "$dir"
        fi
        $CMD $d $dir/
    elif [ ! -z "$d" ]; then
        echo "[stack] $d not found" >&2
    fi
done

touch $stackMount/$stackPath/.lastSync
