export TELEGRAM_TOKEN=FROM@BOTFATHER
export TELEGRAM_ID=
# Get the above ID from here: https://github.com/A3sal0n/FalconGate/wiki/Get-Telegram-Chat-ID
export KEY=
export SECRET=
export EXCHANGE=poloniex
export NAME_COIN=ltc
export NAME_COIN_TWO=btc
export COUNT_ORDERS=20
export QUANTITY_ORDERS_IN_BLOCKS=5
export RANGE_OFFSET=0
export BBANDS=true
export LANGUAGE=en
export MINIMUM_ORDER_SIZE_IN_BTC=0.0001
export AUTO_RESTART_HANGING=true
export NOTIFICATION_ORDER_IS_EXECUTED=true
node ./build/server
npm start

