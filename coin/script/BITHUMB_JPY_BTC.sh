#!/bin/sh

TABLE=BITHUMB_JPY_BTC
ORIGINALPRICE=`curl -s https://api.bithumb.com/public/ticker/BTC | jq -r '.data.buy_price'`
RATE=`curl -s http://api.aoikujira.com/kawase/json/krw | jq -r '.JPY'`

PRICE=`echo "scale=0 ; $ORIGINALPRICE * $RATE" | /usr/bin/bc`


echo "insert into $TABLE(price) values(${PRICE%.*});" > sql/$TABLE.sql;
