#!/bin/sh

TABLE=COINCHECK_JPY_BTC
PRICE=`curl -s https://coincheck.com/api/rate/btc_jpy | jq -r .rate | awk -F'.' '{print $1}'`

echo "insert into $TABLE(price) values($PRICE);" > sql/$TABLE.sql;
