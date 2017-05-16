# BTC-E Bot Trader

This app is working with server maintenance. It is created with applying:

* _JavaScript_;
* _Btce-deal_;
* _Telegram_;
* _Ta-lib_;
* _nodejs_.

## Install

1. Install [node.js](https://nodejs.org/en/) or use hosting ([heroku](https://signup.heroku.com/login), [pivotal](https://account.run.pivotal.io/z/uaa/sign-up), etc.)

2. Copy the repository and install the dependency packages:
```
$ git clone git@github.com:steeply/btce-app-trader.git
$ cd btce-app-trader
$ npm i
```

## Setting

### Telegram. Creating a new bot
[@BotFather](https://core.telegram.org/bots#6-botfather)

Use the **/newbot** command to create a new bot. The BotFather will ask you for a name and username, then generate an authorization token for your new bot.
The name of your bot is displayed in contact details and elsewhere.
The **Username** is a short name, to be used in mentions and telegram.me links. Usernames are 5-32 characters long and are case insensitive, but may only include Latin characters, numbers, and underscores. Your bot's username must end in ‘bot’, e.g. ‘trade_bot’ or ‘TradeBot’.
The **token** is a string along the lines of `110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw` that is required to authorize the bot and send requests to the Bot API.

### Parameters variable environment:

#### Required parameters

 Option | Description
----------------|----------------------
**TELEGRAM_TOKEN**                          | Telegram token
**TELEGRAM_ID**                             | Your User ID Telegram
**NAME_COIN**                               | Trading currency (For example: ltc)
**NAME_COIN_TWO**                           | Trading currency (For example: usd)
EXCHANGE                                    | The choice of the exchange **btc-e** or **poloniex** (default: btc-e)

> TELEGRAM_ID will be given after the first starting of trade script. Send to bot any message to receive it.

##### For exchange BTC-E

 Option | Description
----------------|----------------------
**BTCE_KEY**         | API key
**BTCE_SECRET**      | API secret
BTCE_HOST            | Address exchange Btc-e

##### For exchange POLONIEX

 Option | Description
----------------|----------------------
**POLONIEX_KEY**         | API key
**POLONIEX_SECRET**      | API secret
POLONIEX_FEE             | The Commission for transactions of the exchange POLONIEX (default: 0.25)
POLONIEX_DELAY_API       | The delay of requests to the API in milliseconds (default: 100)


By default, the bot will work at default settings. You can change them using the following options.

#### Possible settings

 Option | Description
----------------|----------------------
TIME_UPDATE_AUTO_SETTINGS           | Update time of auto settings (min) (default: 2)
DEPOSIT_LIMIT_PERCENT               | Deposit consuming percent (default: 100)
DEPOSIT_LIMIT_CURRENCY              | The size of the used part of the Deposit in the currency (default: false)
NOTIFICATION_PAIR                   | Notification pair of rate changing (For example: btc/usd, ltc/usd or **all/all** for all pair)
NOTIFICATION_DEVIATION_PERCENT      | Relation of deviation percentage from current price for notification will work (default: 600)
COUNT_ORDERS                        | Quantity all orders
TIME_CLOSE_ORDERS                   | Closing time of unused orders (min) (default: 5)
TIME_CLOSE_ORDERS_INACTIVITY        | Closing time of undemanded orders (min) (default: 15)
STEP_BREAKEVEN_PERCENT              | Percentage of breakeven (default: 50)
SIZE_ORDERS_MARTINGALE              | The size of the orders for Martingale  (for Exponential - %, Linear - absolute number) (default: false)
MARTINGALE_TYPE                     | Type Martingale (1 - exponential, 2 - linear) (default: 1)


##### Offset orders

The possible indentation of the orders. Select one of the offered.

 Option | Description
----------------|----------------------
OFFSET_ORDERS_POINTS                | Position difference between orders in points (default: 10)
OFFSET_ORDERS_PERCENT               | Position difference between orders in % (default: false)
OFFSET_ORDERS_EXPONENTIAL           | Position difference between orders is exponentially in % (default: false)
RANGE_OFFSET                        | Range offset (default: false)
OFFSET_FIRST_ORDERS_PERCENT         | Position difference of the first order in % (default: false)

> Parameter **OFFSET_FIRST_ORDERS_PERCENT** can be used in conjunction with any of the selected options.


#### Modules AutoConfig

 Option | Description
----------------|----------------------
DANGER_PRICE_STOP                   | Bot stopping according to the price spike (default: true)
DYNAMIC_SETTINGS_TIME               | Dynamic time updating for auto options (default: false)
DYNAMIC_OFFSET_ORDERS               | Dynamic order allocation (default: false)
TREND_DEFINITION                    | Trend determination (Experimentally) (default: false)
ABRUPT_CHANGE_TREND                 | Rapid trend reversal (Experimentally) (default: false)
OFF_MODULES_AUTO_SETTINGS           | Disabling Autotune Modules (default: false)

> The option **OFF_MODULES_AUTO_SETTINGS** controls DANGER_PRICE_STOP, DYNAMIC_SETTINGS_TIME, DYNAMIC_OFFSET_ORDERS, TREND_DEFINITION, ABRUPT_CHANGE_TREND


##### Strategy "Bollinger Bands"

 Option | Description
----------------|----------------------
BBANDS                              | Bollinger Bands (Trend strategy!) (default: false)
BBANDS_DEVIATION                    | Deviation (default: 20)
BBANDS_INTERVAL                     | Time-frame (min) (default: 1)


##### Strategy "One Sell a lot Buy"

 Option | Description
----------------|----------------------
ONE_ORDERS_SELL                     | Strategy: One order to sell, lot purchase (default: false)
ONE_ORDERS_SELL_PERCENT             | Specifies the percentage desired profit (default: 1)
ONE_ORDERS_SELL_OFFSET              | The difference between LastPrice and first BUY order in the stack of orders in % (default: 2)
QUANTITY_ORDERS_IN_BLOCKS           | Quantity orders in blocks (default: false)
INTEGRITY_CONTROL_ORDERS            | Integrity control orders (**soft** or **hard**) (default: soft)

> **When you start the strategy of "Sell One, Buy a lot" the initial state of the balance of the base currency in the pair is ignored!**

> All the strategies are mutually exclusive. If no policy is selected, use the strategy of "Scalper"

#### Additional options
 Option | Description
----------------|----------------------
EMAIL_BUG_REPORT_ADDRESS    | Email for notifications of network incidences and errors
HOST_SMTP                   | Mail server address
EMAIL_AUTH_USER             | Authorization login of the mail server
EMAIL_AUTH_PASS             | Mail server password
TIME_ZONE                   | Time zone (For example: Europe/Moscow) [Database Time Zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
LOG                         | Calculating log output of auto settings (default: false)
LOG_DEBUG                   | The output of the debug log (default: false)
LOG_TRANSPORTS              | Where to write the log (0 - console, 1 - file, 2 console and file) (default: 0)
RESTART_TRADER_TIME         | How many seconds to wait before re-querying the data after network errors (default: 5)
NOTIFICATION_ERROR_COUNT    | The number of errors in 5 minutes for notification (default: false)
TELEGRAM_OFF                | Disable Telegram (default: false)


## Run

```
$ npm start
```

## Donate

```
BTC: 1GGbq5xkk9YUUy4QTqsUhNnc9T1n3sQ9Fo
LTC: LPRESTPTNMUT8rVpdvd8cJxqrnGDW7Va8N
```
