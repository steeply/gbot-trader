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
* Dsx
* Binance (Unofficial)  
* Cex (Unofficial) 
* Cryptopia (Unofficial) 
* Kraken (Unofficial) 
* Yobit (Unofficial) 
* Huobi (Unofficial)
* Kucoin (Unofficial) 
* Hitbtc (Unofficial) 
* Okex (Unofficial) 
* Bleutrade (Unofficial)

The module on the exchange Unofficial is purchased separately from third-party developers! Telegram - [@solvento](https://t.me/solvento).

## Full version in Russian documentation

[README RU](readme_ru.md)

## FAQ
Before asking questions, please read the [FAQ RU](faq_ru.md). Most of the answers you will find in it.

## Install

1. Install [node.js](https://nodejs.org/en/) or use hosting ([heroku](https://signup.heroku.com/login), [pivotal](https://account.run.pivotal.io/z/uaa/sign-up), [UltraVDS](https://ultravds.com), [Zomro](http://zomro.com) and etc.)

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

1. Set the parameters API Exchange: `EXCHANGE`, `KEY`, `SECRET` and `TELEGRAM_TOKEN`.
2. Run GBot Trader.
3. Write your Telegram bot (which you created earlier using [@BotFather](https://core.telegram.org/bots#6-botfather)) any message, you will receive your id number.
4. Turn Off GBot Trader.
5. Set the parameters `TELEGRAM_ID`.


### Parameters variable environment:

#### Required parameters

 Option | Description| Type | Default
--------|------------|-----|----------
**KEY**             | API key   | string | -
**SECRET**          | API secret    | string | -
**NAME_COIN**       | Trading currency | string | ltc
**NAME_COIN_TWO**   | Trading currency | string | usd
**EXCHANGE**        | The choice of the exchange <br> **wex** <br> **poloniex** (inverted pairs) <br> **bittrex** (inverted pairs) <br> **exmo** <br> **bitfinex** <br> **liqui** <br> **dsx** | string | -
EXCHANGE_HOST       | Host exchange API. If the primary host is not available. | string | -



#### Parameters for Telegram

 Option | Description| Type | Default
--------|------------|-----|----------
TELEGRAM_TOKEN      | Telegram token    | string | -
TELEGRAM_ID         | Your User ID Telegram | number | -
SOCKS5_HOST         | HOST SOCKS5 | string | -
SOCKS5_PORT         | PORT SOCKS5  | number | 1080
SOCKS5_USERNAME     | Username SOCKS5 | string | -
SOCKS5_PASSWORD     | Password SOCKS5 | string | -
TELEGRAM_OFF        | Disable Telegram | boolean | false

> Option **TELEGRAM_OFF** disables the ability to use Telegram in the bot. All management and all notifications sent via Telegram are the same are disabled!


By default, the bot will work at default settings. You can change them using the following options.

#### Used trade options

 Option | Description| Type | Default
--------|------------|-----|----------
TIME_UPDATE_AUTO_SETTINGS           | Interval update of auto settings (min) | number | 2
DEPOSIT_LIMIT                       | Deposit consuming percent or the absolute number<br><br>If an absolute number is specified: the size of the used part of the Deposit in the currency **NAME_COIN_TWO**. <br>For exchanges with inverted currency in the currency of the parameter **NAME_COIN**  | number or string | 100%
COUNT_ORDERS                        | Quantity all orders.<br> How many will be installed. | number | Calculated based on deposit amount
QUANTITY_ORDERS_IN_BLOCKS           | Quantity orders in blocks<br>How many orders will be simultaneously on the market. | number | 0
HOLD_QUANTITY_ORDERS                | To hold a given number of orders in QUANTITY_ORDERS_IN_BLOCKS <br>(FAQ п.22) | boolean | true
GREEDY_FIRST_ORDER_SIZE             | Size of the "zero" order in the traded currency or percentage<br>Format: 0.1 or 5% | number or string | 0
GREEDY_FIRST_ORDER_SIZE_INSECOND_CURRENCY | Size of the "zero" order in the base currency | number | 0
SIZE_FIRST_ORDERS                   | The size of the first order in the currency being traded or in percent<br>Example: 0.1 or 5% | string | 0
SIZE_FIRST_ORDERS_INSECOND_CURRENCY | The size of the first order in the base currency | number | 0
SIZE_ORDERS_MARTINGALE              | The size of the orders for Martingale  (for Exponential - %, Linear - absolute number)<br>Example: 0.1 or 5% | string or number | 0
CONTINUE_MARTINGALE_GRID            | To continue the grid Martingale when you restart the bot (**saves the order size**) | boolean | false
TRADING_PRICE_RANGE                 | Price range allowed for bidding, absolute numbers or percentages. <br>Example: <br>`3000/5000`<br>`10%/20%`<br>`10%`<br>`1000/10%`<br>If not specified, no restrictions<br> | string | -
IGNORE_ORDERS_AT_START              | Ignore the previously set orders at the start / restart of the bot | boolean | false
DELAY_TIME_CYCLES                   | Delay in seconds before starting a new cycle <br > * for **One orders**: after execution of a profit order <br > * for **Scalper**: after TIME_CLOSE_ORDERS | number | 0
STOP_LOSS_ABS                       | Absolute price value for Stop Loss <br>(FAQ п.53) | number | 0
BUY_STOP_ABS                        | Absolute price value for Buy Stop <br>(FAQ п.53) | number | 0

**Important!**

> The size of the order for `SIZE_FIRST_ORDERS_INSECOND_CURRENCY` will be calculated by the formula **SIZE_FIRST_ORDERS_INSECOND_CURRENCY / price**

> `SIZE_FIRST_ORDERS` or `SIZE_FIRST_ORDERS_INSECOND_CURRENCY` select **only 1 of the parameters**!

> `GREEDY_FIRST_ORDER_SIZE` or `GREEDY_FIRST_ORDER_SIZE_INSECOND_CURRENCY` select **only 1 of the parameters**!

> With the manual size of the first order **RANGE_OFFSET** does not work, and **COUNT_ORDERS** will be calculated automatically.

> The parameter **CONTINUE_MARTINGALE_GRID** does not restore indentation when using **OFFSET_ORDERS_EXPONENTIAL**.

#### Offset orders

The possible indentation of the orders. Select one of the offered.

 Option | Description| Type | Default
--------|------------|-----|----------
OFFSET_FIRST_ORDERS_PERCENT         | Position difference of the first order in % | number | 0
OFFSET_FIRST_ORDERS_POINTS          | Position difference of the first order in points | number | 0
OFFSET_ORDERS_POINTS                | Position difference between orders in points | number | 10
OFFSET_ORDERS_PERCENT               | Position difference between orders in % | number | 0
OFFSET_ORDERS_EXPONENTIAL           | Position difference between orders is exponentially in % | number | 0
RANGE_OFFSET                        | Range offset | number | 0

> Parameter **OFFSET_FIRST_ORDERS_PERCENT** or **OFFSET_FIRST_ORDERS_POINTS** can be used in conjunction with any of the selected options.

> To set the first order in the market, use `OFFSET_FIRST_ORDERS_PERCENT=-1`.


#### Disable orders grid

 Option | Description| Type | Default
--------|------------|-----|----------
DISABLE_GRID_SELL                   | Disable order placement on the grid for Sell orders | boolean | false
DISABLE_GRID_BUY                    | Disable order placement on the grid for Buy orders | boolean | false

#### Modules AutoConfig

 Option | Description| Type | Default
--------|------------|-----|----------
DANGER_PRICE_STOP                   | Bot stopping according to the price spike | boolean | false
DANGER_PRICE_STOP_PERCENT           | The percentage of the price spike for the bot stopping | number | 9
DYNAMIC_SETTINGS_TIME               | Dynamic time updating for auto options | boolean | false
DYNAMIC_OFFSET_ORDERS               | Dynamic order allocation | boolean | false
DYNAMIC_OFFSET_INTERVAL             | The price check interval for the dynamic grid (in minutes) | number | 60
DYNAMIC_OFFSET_PROFIT_DIVISOR       | The divisor of the change of the profitable order | number | 10
DYNAMIC_OFFSET_INDENTION_DIVISOR    | Dividing the grid size | number | COUNT_ORDERS
TREND_DEFINITION                    | Trend determination (Experimentally) | boolean | false
ABRUPT_CHANGE_TREND                 | Rapid trend reversal (Experimentally) | boolean | false
OFF_MODULES_AUTO_SETTINGS           | Disabling all Autotune Modules | boolean | false

> Options **TREND_DEFINITION** **ABRUPT_CHANGE_TREND** only for strategy Scalper.

> The option **OFF_MODULES_AUTO_SETTINGS** controls DANGER_PRICE_STOP, DYNAMIC_SETTINGS_TIME, DYNAMIC_OFFSET_ORDERS, TREND_DEFINITION, ABRUPT_CHANGE_TREND


## Individual parameters strategies
**All the strategies are mutually exclusive. If no strategy is selected, use the strategy of "Scalper"**.

#### Strategy "Scalper" and "Bollinger Bands"

 Option | Description| Type | Default
--------|------------|-----|----------
TIME_CLOSE_ORDERS                   | Closing time of unused orders (min) | number | 5
TIME_CLOSE_ORDERS_INACTIVITY        | Closing time of undemanded orders (min) | number | 15


###  Strategy "Scalper"

 Option | Description|Type | Default
--------|------------|-----|----------
TYPE_SCALPER                        | Scalper type of work. Value: 1 or 2 | number | 1
STEP_BREAKEVEN_PERCENT              | Only for `TYPE_SCALPER=1`<br>Percentage of breakeven | number | 50
TRADING_AMOUNT_RANGE                | Range of random order size<br> Values are specified in the format **start/end** of the range. | string | -

> When using `TRADING_AMOUNT_RANGE`, the parameters `COUNT_ORDERS`, `SIZE_ORDERS_MARTINGALE`, `SIZE_FIRST_ORDERS_*`, etc. do not make sense and will be ignored.


#### Strategy "Bollinger Bands"

 Option | Description| Type | Default
--------|------------|-----|----------
BBANDS                              | Bollinger Bands (Trend strategy!) | boolean | false
BBANDS_DEVIATION                    | Deviation | number | 2
BBANDS_PERIOD                       | Period BBANDS | number | 20
RSI_TYPE                            | rsi or stochrsi | string | rsi
RSI_PERIOD                          | Period RSI | number | 14
RSI_RANGE_SELL                      | RSI range for sell <br> Values are specified in the format **start/end** of the range. | string | 70/100
RSI_RANGE_BUY                       | RSI range for buy | string | 1/30
BBANDS_INTERVAL                     | Time-frame. Interval of interrogation of the prices (minutes) | number | 1
CLOSE_GRID_OPPOSITE                 | Closes the opposite orders grid | boolean | false
SAVE_PRICE_FILE                     | Save price cache to a file  | boolean | false
PRICE_FILE_PATH                     | A custom path to the directory with the file | string | Folder with bot

> If `RSI_PERIOD = 0`, then the indicator is disabled and trading occurs only on the BBANDS indicator!

> If you use the `SAVE_PRICE_FILE` option, you need write access to the directory. Note that if you run the bot and the real **market prices are different from those in the** file, the original orders may get wrong and **sell at a loss!**

> The parameter `SAVE_PRICE_FILE` **will not work** on PaaS platforms (Heroku, Pivotal and any other platforms where container virtualization tools are used)!

#### Strategy "One Orders"
**When you start the strategy of "Sell One, Buy a lot" the initial state of the balance of the base currency in the pair is ignored!**


 Option | Description| Type | Default
--------|------------|-----|----------
ONE_ORDERS_SELL                     | Strategy: "One Sell a lot Buy" | boolean | false
ONE_ORDERS_BUY                      | Strategy: "One Buy a lot Sell" | boolean | false
ONE_ORDERS_OFFSET                   | The difference between LastPrice and first order in the stack of orders in %. <br> Will pull the order, if this value is exceeded. | number | 2
ONE_ORDERS_PROFIT_PERCENT           | Specifies the percentage desired profit | number | 1
INTEGRITY_CONTROL_ORDERS            | Integrity control orders (**soft** or **hard**) | string | soft
TYPE_DATA_USED                      | Where to get information about the used orders: <br>  **active** - active orders <br> **history** - active orders + trading history | string | active
FIRST_LOADING_HISTORY               | Download the history when you start the bot | boolean | false
NUMBER_ROWS_LOAD_HISTORY            | Number of rows to load history | number | 100
LOAD_HISTORY_DAYS                   | The number of days of history<br>While only used for Poloniex | number | 30
CYCLES_AUTO_EXIT                    | How many cycles to make the exit | number | 0
STOP_LOSS_PERCENT                   | Stop Loss percentage | number | 0
TRAILING_STOP_PERCENT               | Trailing stop percentage | number | 0
TRAILING_GRID_PERCENT               | Trailing grid percentage | number | 0
DISABLE_CAPITALIZATION              | Disable capitalization in profit order | boolean | false
CAPITALIZATION_BUY_ORDER            | Includes partial capitalization of Buy orders in DISABLE_CAPITALIZATION | boolean | false
STRATEGY_AUTO_REVERS                | Auto switching strategy to reverse | boolean | false
OFFSET_LAST_ORDER_PERCENT           | The percentage of the price distance from the last order to enable auto-switching of strategy | number | 5
PERMANENT_DEPOSIT                   | Use the total deposit calculation together with the trades history | boolean | false
PRICE_TRADING_TYPE_CHANGE           | Price at which the trade type will change (Absolute value and percentage)<br>Format: `number` or `low/high`<br>Example: <br>`3000`<br>`3000/5000`<br>`10%/20%`<br>`10%`<br>`1000/10%`<br>(FAQ п.58)  | number or string | -

> If the parameter **INTEGRITY_CONTROL_ORDERS** in `hard` mode, then a sell order will be installed only if the volume installed and executed buy orders will be the same.

> If the parameter **FIRST_LOADING_HISTORY** included, will be loaded into the cache the first `NUMBER_ROWS_LOAD_HISTORY` BUY orders before the first SELL order for the selected pair and put a SELL order on the basis of these data.

> Option **DISABLE_CAPITALIZATION=true** activates `INTEGRITY_CONTROL_ORDERS` on **hard**.


#### Additional options

### Notifications

 Option | Description| Type | Default
--------|------------|-----|----------
NOTIFICATION_PAIR                   | Notification pair of rate changing (For example: `btc/usd, ltc/usd` or **all/all** for all pair) | string | -
NOTIFICATION_DEVIATION_PERCENT      | In what percentage should the price spike for the notification to work | number | 5
MONITORING_PAIR                     | Pairs for monitoring. <br> (For example: `btc/usd, ltc/usd`, or just a pair currency, for example: `btc`). <br> If none of that is set, ALL available pairs will be monitored on the exchange. | string | All pairs
NOTIFICATION_ERROR_COUNT            | The number of errors in 5 minutes for notification | number | 0
NOTIFICATION_ORDER_IS_EXECUTED      | Notice of execution of one orders | boolean | false
NOTIFICATION_END_GRID               | Notification of the end of the order grid. Notification will be sent if there are less than 3 orders left | boolean | false


### Email Error Notification

 Option | Description| Type | Default
--------|------------|-----|----------
EMAIL_REPORT_ADDRESS        | Email for notifications of network incidences and errors  | string | -
HOST_SMTP                   | Mail server address   | string | smtp.yandex.ru
EMAIL_AUTH_USER             | Authorization login of the mail server | string | -
EMAIL_AUTH_PASS             | Mail server password | string | -


### Log

 Option | Description|Type | Default
--------|------------|-----|----------
LOG                         | Calculating log output of auto settings | boolean | false
LOG_DEBUG                   | The output of the debug log | boolean | false
LOG_TRANSPORTS              | Where to write the log: <br>  0 - console <br>  1 - file <br>  2 - console and file | number | 0 
LOG_PATH                    | A custom path to the directory with the log | string | Folder with bot
LOG_TREE                    | Save logs by directory year/month/day | boolean | false


### Error processing

 Option | Description|Type | Default
--------|------------|-----|----------
NUMBER_CHECK_DATA           | How many times to check the data. <br> Use the value 2 or more. <br> 0 - off | number | 0
AUTO_RESTART_HANGING        | Auto-restart of the worker in case of his hangup (error message: "Worker does not meet" ) | boolean | true
RESTART_TRADER_TIME         | How many seconds to wait before re-querying the data after network errors | number | 5


### Other parameters

 Option | Description| Type | Default
--------|------------|-----|----------
TIME_ZONE                   | Time zone [Database Time Zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | string | Asia/Yekaterinburg
EXCHANGE_FEE                | The Commission for transactions of the exchange | number | 0.25
DELAY_REQUEST_API           | The delay of requests to the API in milliseconds | number | 200
DELAY_BETWEEN_MODULES       | Then delay in seconds between execution of consecutive modules. | number | 3
TITLE                       | The title of the console window. | string | GBot
LANGUAGE                    | The language of the interface (`ru` or `en`) | string | ru
NODE_ENV                    | Value **production** activate:<br> 1. error notifications by E-mail.<br> 2. prohibits the use of conf-dev.js.<br> 3. disabling colors in logs.<br>4. disables TITLE | string | dev
BOT_TRADE                   | Allow trading | boolean | true
URL_STATISTICS              | URL of the server where the statistics will be sent in post json format | string | -

**Important:**

* If you've changed LANGUAGE send a command `/start` in Telegram bot for a new language initialization in Telegram

## Run

```
$ npm start
```

For **Windows**

Create a **start.bat** file, specify the necessary parameters in it and run this file.
```
SET TELEGRAM_TOKEN=110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw 
SET TELEGRAM_ID=12345678

SET DEPOSIT_LIMIT=80%%

....

npm start
pause
```

**Attention!**

The percentages settings for Windows are specified by a double percent sign (%%)



For **Linux and Mac**

Create a **start.sh** file, specify the necessary parameters in it and run this file.
```
export TELEGRAM_TOKEN=110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw 
export TELEGRAM_ID=12345678

export DEPOSIT_LIMIT=80%

...

node ./build/server
```

For **Heroku**

```
heroku ps:scale web=0
heroku ps:scale worker=1
```

To **launch the control panel** in a Telegram, send a message to:
```
/start
```

#### Additional commands in Telegram:
```
/info               - list of all commands

/version            - The version of the bot
/params             - Parameters which can be changed via Telegram
/params_no_comment
/martin [cache]     - A theoretical calculation of the orders of the martingale (parameters are taken from config)
/ticker coin_name   - Shows a quote of a pair coin_name
/trade              - Switches to the specified trading pair
/stop [codeExit]    - The application shutsdown. codeExit - an optional exit code.
/sell_all           - Sell on the market immediately. (Attention: The sale will be made without confirmation!)
/buy_all            - Buy on the market immediately. (Attention: The buy will be made without confirmation!)
/restart            - Restart GBot Trader
/stats              - Trading statistics
/note [ignore text] - The text in this line will be ignored. It can be used as a comment.
/stoploss           - Displays StopLoss information
/trail              - Displays Trailing Stop information
/getbalance         - Displays the start balance
/setbalance number  - Sets the starting balance
/addbalance number  - Add coins to the starting balance

```

