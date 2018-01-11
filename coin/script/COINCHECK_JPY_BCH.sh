#!/bin/sh

TABLE=COINCHECK_JPY_BCH
PRICE=`curl -s https://coincheck.com/api/rate/bch_jpy | jq -r .rate | awk -F'.' '{print $1}'`

echo "insert into $TABLE(price) values($PRICE);" > sql/$TABLE.sql;
