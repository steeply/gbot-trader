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
$ cd btc-e
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
**TELEGRAM_TOKEN**                  | Telegram token
**TELEGRAM_ID**                     | Your User ID Telegram
**BTCE_KEY**                        | API key
**BTCE_SECRET**                     | API secret
**NAME_COIN**                       | Trading currency (For example: ltc)
**NAME_COIN_TWO**                   | Trading currency (For example: usd)

> TELEGRAM_ID will be given after the first starting of trade script. Send to bot any message to receive it.

By default, the bot will work at default settings. You can change them using the following options.

#### Possible settings

 Option | Description
----------------|----------------------
TIME_UPDATE_AUTO_SETTINGS           | Update time of auto settings (min) (default: 2)
DEPOSIT_LIMIT                       | Deposit consuming procent (default: 100)
NOTIFICATION_PAIR                   | Notification pair of rate changing (For example: btc/usd, ltc/usd)
NOTIFICATION_DEVIATION_PERCENT      | Relation of deviation percentage from current price for notification will work (default: 600)
COUNT_ORDERS                        | Count orders
TIME_CLOSE_ORDERS                   | Closing time of unused orders (min) (default: 5)
TIME_CLOSE_ORDERS_INACTIVITY        | Closing time of undemanded orders (min) (default: 15)
OFFSET_MAX_ONE                      | Position difference between orders (default: 10)
STEP_BREAKEVEN_PERCENT              | Percentage of breakeven (default: 50)

#### Modules AutoConfig

 Option | Description
----------------|----------------------
DANGER_PRICE_STOP                   | Bot stopping according to the price spike (default: true)
DYNAMIC_SETTINGS_TIME               | Dynamic time updating for auto options (default: false)
DYNAMIC_OFFSET_ORDERS               | Dynamic order allocation (default: false)
TREND_DEFINITION                    | Trend determination (Experimentally) (default: false)
ABRUPT_CHANGE_TREND                 | Rapid trend reversal (Experimentally) (default: false)
OFF_MODULES_AUTO_SETTINGS           | Disabling Autotune Modules (default: false)
BBANDS                              | Bollinger Bands (Trend strategy!) (default: false)
BBANDS_DEVIATION                    | Deviation (default: 20)
BBANDS_INTERVAL                     | Time-frame (min) (default: 1)

> The option ***OFF_MODULES_AUTO_SETTINGS*** controls DANGER_PRICE_STOP, DYNAMIC_SETTINGS_TIME, DYNAMIC_OFFSET_ORDERS, TREND_DEFINITION, ABRUPT_CHANGE_TREND

> The modules BBANDS and TREND_DEFINITION, ABRUPT_CHANGE_TREND ***are mutually exclusive***.

#### Additional options
 Option | Description
----------------|----------------------
EMAIL_BUG_REPORT_ADDRESS    | Email for notifications of network incidences and errors
HOST_SMTP                   | Mail server address
EMAIL_AUTH_USER             | Authorization login of the mail server
EMAIL_AUTH_PASS             | Mail server password
BTCE_HOST                   | Address exchange Btc-e
TIME_ZONE                   | Time zone
LOG                         | Calculating log output of auto settings


## Run

```
$ npm start
```

