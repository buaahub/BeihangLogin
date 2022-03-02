#!/bin/bash

COOKIEFILE=`mktemp`
online=$(curl -sS -L -c $COOKIEFILE "https://gw.buaa.edu.cn/cgi-bin/rad_user_info")
rm $COOKIEFILE

grep "not_online_error" <<< $online > /dev/null
if [[ "$?" != "0" ]]; then
        echo online: $(cut -d, -f1 <<< $online)
        exit 1
fi

./login-v2.sh login

