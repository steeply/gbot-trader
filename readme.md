# GBot Trader

[![Dependency Status](https://david-dm.org/steeply/gbot-trader.svg)](https://david-dm.org/steeply/gbot-trader)

This app is working with server maintenance.

## Exchange

* Wex
* Poloniex
* Bittrex
* Exmo
* Bitfinex
* Liqui

## FAQ
Before asking questions, please read the [FAQ](faq.md). Most of the answers you will find in it.

## Install

1. Install [node.js](https://nodejs.org/en/) or use hosting ([heroku](https://signup.heroku.com/login), [pivotal](https://account.run.pivotal.io/z/uaa/sign-up), [UltraVDS](https://ultravds.com), etc.)

2. Copy the repository and install the dependency packages:
```
$ git clone https://github.com/steeply/gbot-trader.git
$ cd gbot-trader
$ npm i
```

## Setting

### Telegram. Creating a new bot

If you use the option **TELEGRAM_OFF**, then this paragraph is not necessary.

[@BotFather](https://core.telegram.org/bots#6-botfather)

Use the **/newbot** command to create a new bot. The BotFather will ask you for a name and username, then generate an authorization token for your new bot.<br />
The name of your bot is displayed in contact details and elsewhere.<br>
The **Username** is a short name, to be used in mentions and telegram.me links. Usernames are 5-32 characters long and are case insensitive, but may only include Latin characters, numbers, and underscores. Your bot's username must end in ‘bot’, e.g. ‘trade_bot’ or ‘TradeBot’.<br />
The **token** is a string along the lines of `110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw` that is required to authorize the bot and send requests to the Bot API.

#### The receipt of Telegram ID

1. Set the parameters API Exchange: `KEY`, `SECRET` and `TELEGRAM_TOKEN`.
2. Run GBot Trader.
3. Write your Telegram bot (which you created earlier using [@BotFather](https://core.telegram.org/bots#6-botfather)) any message, you will receive your id number.
4. Turn Off GBot Trader.
5. Set the parameters `TELEGRAM_ID`.


### Parameters variable environment:

#### Required parameters

 Option | Description
----------------|----------------------
**KEY**             | API key
**SECRET**          | API secret
**NAME_COIN**       | Trading currency (For example: ltc)
**NAME_COIN_TWO**   | Trading currency (For example: usd)
EXCHANGE            | The choice of the exchange (default: wex)<br> **wex** <br> **poloniex** <br> **bittrex** <br> **exmo** <br> **bitfinex** <br> **liqui**
EXCHANGE_HOST       | Host exchange API. If the primary host is not available.
TELEGRAM_TOKEN      | Telegram token
TELEGRAM_ID         | Your User ID Telegram
TELEGRAM_OFF        | Disable Telegram (default: false)

> Option **TELEGRAM_OFF** disables the ability to use Telegram in the bot. All management and all notifications sent via Telegram are the same are disabled!


By default, the bot will work at default settings. You can change them using the following options.

#### Used trade options

 Option | Description
----------------|----------------------
TIME_UPDATE_AUTO_SETTINGS           | Update time of auto settings (min) (default: 2)
DEPOSIT_LIMIT_PERCENT               | Deposit consuming percent (default: 100)
DEPOSIT_LIMIT_CURRENCY              | The size of the used part of the Deposit in the currency **NAME_COIN_TWO** (default: false)
COUNT_ORDERS                        | Quantity all orders.<br> How many will be installed. (default: calculated based on Deposit amount).
QUANTITY_ORDERS_IN_BLOCKS           | Quantity orders in blocks<br>How many orders will be simultaneously on the market. (default: false)
SIZE_FIRST_ORDERS_CURRENCY          | The size of the first order in the currency being traded (default: false)
SIZE_FIRST_ORDERS_INSECOND_CURRENCY | The size of the first order in the base currency (default: false)
SIZE_FIRST_ORDERS_PERCENT           | The size of the first order in percent (default: false)
SIZE_ORDERS_MARTINGALE              | The size of the orders for Martingale  (for Exponential - %, Linear - absolute number) (default: false)
MARTINGALE_TYPE                     | Type Martingale (1 - exponential, 2 - linear) (default: 1)
CONTINUE_MARTINGALE_GRID            | To continue the grid Martingale when you restart the bot (default: false)
NOTIFICATION_PAIR                   | Notification pair of rate changing (For example: `btc/usd, ltc/usd` or **all/all** for all pair)
NOTIFICATION_DEVIATION_PERCENT      | Relation of deviation percentage from current price for notification will work (default: 600)
MONITORING_PAIR                     | Pairs for monitoring. <br> (For example: `btc/usd, ltc/usd`, or just a pair currency, for example: `btc`). <br> If none of that is set, ALL available pairs will be monitored on the exchange. <br> (default: All pairs)

**Important!**

> The size of the order for `SIZE_FIRST_ORDERS_INSECOND_CURRENCY` will be calculated by the formula **SIZE_FIRST_ORDERS_INSECOND_CURRENCY / price**

> `SIZE_FIRST_ORDERS_CURRENCY`, `SIZE_FIRST_ORDERS_INSECOND_CURRENCY` or `SIZE_FIRST_ORDERS_PERCENT` select **only 1 of the parameters**!


#### Offset orders

The possible indentation of the orders. Select one of the offered.

 Option | Description
----------------|----------------------
OFFSET_ORDERS_POINTS                | Position difference between orders in points (default: 10)
OFFSET_ORDERS_PERCENT               | Position difference between orders in % (default: false)
OFFSET_ORDERS_EXPONENTIAL           | Position difference between orders is exponentially in % (default: false)
RANGE_OFFSET                        | Range offset (default: false)
OFFSET_FIRST_ORDERS_PERCENT         | Position difference of the first order in % (default: false)

> Parameter **OFFSET_FIRST_ORDERS_PERCENT** can be used in conjunction with any of the selected options.

> To set the first order in the market, use `OFFSET_FIRST_ORDERS_PERCENT=-1`


#### Modules AutoConfig

 Option | Description
----------------|----------------------
DANGER_PRICE_STOP                   | Bot stopping according to the price spike (default: false)
DANGER_PRICE_STOP_PERCENT           | The percentage of the price spike for the bot stopping (default: 9)
DYNAMIC_SETTINGS_TIME               | Dynamic time updating for auto options (default: false)
DYNAMIC_OFFSET_ORDERS               | Dynamic order allocation (default: false)
TREND_DEFINITION                    | Trend determination (Experimentally) (default: false)
ABRUPT_CHANGE_TREND                 | Rapid trend reversal (Experimentally) (default: false)
OFF_MODULES_AUTO_SETTINGS           | Disabling all Autotune Modules (default: false)

> Options **TREND_DEFINITION** **ABRUPT_CHANGE_TREND** only for strategy Scalper.

> The option **OFF_MODULES_AUTO_SETTINGS** controls DANGER_PRICE_STOP, DYNAMIC_SETTINGS_TIME, DYNAMIC_OFFSET_ORDERS, TREND_DEFINITION, ABRUPT_CHANGE_TREND


## Individual parameters strategies
**All the strategies are mutually exclusive. If no strategy is selected, use the strategy of "Scalper"**.

#### Strategy "Scalper" and "Bollinger Bands"

 Option | Description
----------------|----------------------
TIME_CLOSE_ORDERS                   | Closing time of unused orders (min) (default: 5)
TIME_CLOSE_ORDERS_INACTIVITY        | Closing time of undemanded orders (min) (default: 15)
STEP_BREAKEVEN_PERCENT              | Percentage of breakeven (default: 50)


#### Strategy "Bollinger Bands"

 Option | Description
----------------|----------------------
BBANDS                              | Bollinger Bands (Trend strategy!) (default: false)
BBANDS_DEVIATION                    | Deviation (default: 2)
BBANDS_PERIOD                       | Period BBANDS (default: 20)
RSI_PERIOD                          | Period RSI (default: 14)
RSI_RANGE_SELL                      | RSI range for sell (percentage) (default: 70/99) <br> Values are specified in the format **start/end** of the range.
RSI_RANGE_BUY                       | RSI range for buy (percentage) (default: 1/30)
BBANDS_INTERVAL                     | Time-frame (min) (default: 1)


#### Strategy "One Orders"
**When you start the strategy of "Sell One, Buy a lot" the initial state of the balance of the base currency in the pair is ignored!**


 Option | Description
----------------|----------------------
ONE_ORDERS_SELL                     | Strategy: "One Sell a lot Buy" (default: false)
ONE_ORDERS_BUY                      | Strategy: "One Buy a lot Sell" (default: false)
ONE_ORDERS_OFFSET                   | The difference between LastPrice and first order in the stack of orders in %. <br> Will pull the order, if this value is exceeded. (default: 2)
ONE_ORDERS_PROFIT_PERCENT           | Specifies the percentage desired profit (default: 1)
INTEGRITY_CONTROL_ORDERS            | Integrity control orders (**soft** or **hard**) (default: soft)
TYPE_DATA_USED                      | Where to get information about the used orders (**active** - active orders,  **history** - trading history) (default: active)
FIRST_LOADING_HISTORY               | Download the history when you start the bot (default: false)
CYCLES_AUTO_EXIT                    | How many cycles to make the exit (default: false)
STOP_LOSS_PERCENT                   | Stop Loss percentage (default: false)


> If the parameter **INTEGRITY_CONTROL_ORDERS** in `hard` mode, then a sell order will be installed only if the volume installed and executed buy orders will be the same.

> If the parameter **FIRST_LOADING_HISTORY** included, will be loaded into the cache the first 100 BUY orders before the first SELL order for the selected pair and put a SELL order on the basis of these data.


#### Additional options
 Option | Description
----------------|----------------------
EMAIL_REPORT_ADDRESS        | Email for notifications of network incidences and errors
HOST_SMTP                   | Mail server address
EMAIL_AUTH_USER             | Authorization login of the mail server
EMAIL_AUTH_PASS             | Mail server password
TIME_ZONE                   | Time zone (For example: Europe/Moscow) [Database Time Zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
LOG                         | Calculating log output of auto settings (default: false)
LOG_DEBUG                   | The output of the debug log (default: false)
LOG_TRANSPORTS              | Where to write the log (0 - console, 1 - file, 2 - console and file) (default: 0)
LOG_PATH                    | A custom path to the directory with the log (default: Folder with bot)
LOG_TREE                    | Save logs by directory year/month/day (default: false)
RESTART_TRADER_TIME         | How many seconds to wait before re-querying the data after network errors (default: 5)
NOTIFICATION_ERROR_COUNT    | The number of errors in 5 minutes for notification (default: false)
EXCHANGE_FEE                | The Commission for transactions of the exchange (default: 0.25)
DELAY_REQUEST_API           | The delay of requests to the API in milliseconds (default: 500)
DELAY_BETWEEN_MODULES       | Then delay in seconds between execution of consecutive modules. (default: 3)
TITLE                       | The title of the console window.
LANGUAGE                    | The language of the interface (`ru` or `en`) (default: ru)
NODE_ENV                    | Value **production** activate:<br>  1. notification about the start of a Telegram bot.<br> 2. error notifications by E-mail.<br> 3. prohibits the use of conf-dev.js.<br> 4. disabling colors in logs.<br>5. disables TITLE

**Important:**

* If you've changed LANGUAGE send a command `/start` in Telegram bot for a new language initialization in Telegram

## Run

```
$ npm start
```

For **Windows**

```
SET TELEGRAM_TOKEN=110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw 
SET TELEGRAM_ID=12345678
....
npm start
```

For **Heroku**

```
heroku ps:scale web=0
heroku ps:scale worker=1
```

To launch the control panel in a Telegram, send a message to:
```
/start
```

Additional commands:
```
/info - list of all commands

/version            - The version of the bot
/params             - Parameters which can be changed via Telegram
/config             - Is a possible configuration parameters via a configuration file
/martin [cache]     - A theoretical calculation of the orders of the martingale (parameters are taken from config)
/ticker coin_name   - Shows a quote of a pair coin_name
/stop [codeExit]    - The application shutsdown. codeExit - an optional exit code.
/sell_all           - Sell on the market immediately. (Attention: The sale will be made without confirmation!)
/restart            - Restart GBot Trader
/stats              - Trading statistics
/note [ignore text] - The text in this line will be ignored. It can be used as a comment.
```


## Donate

```
BTC: 1AMmeM2ERD6nd1K1y5Zta2BvfugHt5UjPo
```