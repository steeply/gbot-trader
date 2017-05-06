# BTC-E Bot Trader

Это приложение работает на стороне сервера и управляется через Telegram. 
Построено с использованием:

* _JavaScript_;
* _Btce-deal_;
* _Telegram_;
* _Ta-lib_;
* _nodejs_.

## Install


1. Установите [node.js](https://nodejs.org/en/) или используйте хостинг ([heroku](https://signup.heroku.com/login), [pivotal](https://account.run.pivotal.io/z/uaa/sign-up), etc.).

2. Склонируйте репозиторий и установите пакеты зависимостей:
```
$ git clone https://github.com/steeply/btce-app-trader.git
$ cd btc-e
$ npm i
```

## Setting

### Telegram. Создание бота.
[@BotFather](https://core.telegram.org/bots#6-botfather)

Напишите команду **/newbot**, чтобы создать нового робота. BotFather спросит у вас имя нового бота и предложит придумать username.
Имя (name) будет отображаться в контактах и чатах.
**Username** — короткое имя на латинице, которое используется для упоминаний бота и в ссылках на профиль в telegram.me. Username должен состоять из букв латинского алфавита, подчёркиваний и цифр и быть длиной от 5 до 32 символов. Также имя пользователя обязательно должно заканчиваться на «bot», например: «trade_bot» или «TradeBot».
Ключ (**токен**) это набор символов вида `110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw`, который нужен, чтобы получать и отправлять сообщения с помощью Bot API.

### Параметры переменного окружения:

#### Обязательные параметры

 Option | Description
----------------|----------------------
**TELEGRAM_TOKEN**                          | Ваш токен для telegram
**TELEGRAM_ID**                             | ID вашего пользователя в telegram
**NAME_COIN**                               | Торговая валюта (Например: ltc)
**NAME_COIN_TWO**                           | Торговая валюта (Например: usd)
EXCHANGE                                    | Выбор биржи **btc-e** или **poloniex** (default: btc-e)

> TELEGRAM_ID будет получен при первом запуске торгового скрипта. Для его получения напишите telegram боту любое сообщение.

##### Для биржи BTC-E

 Option | Description
----------------|----------------------
**BTCE_KEY**         | API key
**BTCE_SECRET**      | API secret

##### Для биржи POLONIEX

 Option | Description
----------------|----------------------
**POLONIEX_KEY**         | API key
**POLONIEX_SECRET**      | API secret
POLONIEX_FEE             | Комиссия на сделки биржи POLONIEX (default: 0.25)
POLONIEX_DELAY_API       | Задержка при выполнении запросов к api в миллисекундах (default: 100)

По умолчанию бот запустится на дефолтных настройках. Вы можете их изменить используя следующие параметры.

#### Используемые настройки

 Option | Description
----------------|----------------------
TIME_UPDATE_AUTO_SETTINGS           | Время обновления авто параметров (в минутах) (default: 2)
DEPOSIT_LIMIT                       | Процент использования депозита (default: 100)
NOTIFICATION_PAIR                   | Пары для уведомления о скачках курса (Например: btc/usd, ltc/usd или **all/all** для всех пар)
NOTIFICATION_DEVIATION_PERCENT      | Насколько процентов должен увеличиться спред чтобы сработало уведомление (default: 600)
COUNT_ORDERS                        | Количество ордеров (default: рассчитывается на основе размера депозита)
TIME_CLOSE_ORDERS                   | Время закрытия неиспользованных ордеров (в минутах) (default: 5)
TIME_CLOSE_ORDERS_INACTIVITY        | Время закрытия ордеров при бездействии (в минутах) (default: 15)
STEP_BREAKEVEN_PERCENT              | Процент отступа от безубытка между bid и ask (default: 50)
SIZE_ORDERS_MARTINGALE              | Размер ордеров по Мартингейл (для Экспоненты - проценты, для Линейного - абсолютное число) (default: false)
MARTINGALE_TYPE                     | Тип Мартингейла (1 - экспоненциальный, 2 - линейный) (default: 1)

##### Смещение ордеров

Варианты возможных отступов ордеров. Выберите один из предложенных.

 Option | Description
----------------|----------------------
OFFSET_ORDERS_POINTS                | Отступ между ордерами в пунктах  (default: 10)
OFFSET_ORDERS_PERCENT               | Отступ между ордерами в процентах (default: false)
OFFSET_ORDERS_EXPONENTIAL           | Отступ между ордерами по экспоненте в % (default: false)
RANGE_OFFSET                        | Диапазон смещения ордеров (default: false)
OFFSET_FIRST_ORDERS_PERCENT         | Отступ первого ордера в процентах (default: false)

> Параметр **OFFSET_FIRST_ORDERS_PERCENT** можно использовать совместно с любым из выбранных вариантов.

#### Модули автоконфигурации

 Option | Description
----------------|----------------------
DANGER_PRICE_STOP                   | Остановка бота при большом скачке цены (default: true)
DYNAMIC_SETTINGS_TIME               | Динамическое время обновления авто параметров (default: false)
DYNAMIC_OFFSET_ORDERS               | Динамическое распределение ордеров (default: false)
TREND_DEFINITION                    | Определение тренда (Эксперементально) (default: false)
ABRUPT_CHANGE_TREND                 | Быстрый разворот тренда (Эксперементально) (default: false)
OFF_MODULES_AUTO_SETTINGS           | Отключение модулей авто настройки (default: false)

> Опция **OFF_MODULES_AUTO_SETTINGS** контролирует DANGER_PRICE_STOP, DYNAMIC_SETTINGS_TIME, DYNAMIC_OFFSET_ORDERS, TREND_DEFINITION, ABRUPT_CHANGE_TREND

##### Стратегия "Линии Боллинджера"

 Option | Description
----------------|----------------------
BBANDS                              | Линии Боллинджера (Трендовая стратегия) (default: false)
BBANDS_DEVIATION                    | Отклонение (default: 20)
BBANDS_INTERVAL                     | Таймфрейм (в минутах) (default: 1)


##### Стратегия "One Sell a lot Buy"

 Option | Description
----------------|----------------------
ONE_ORDERS_SELL                     | Стратегия "Рыбалка" (default: false)
ONE_ORDERS_SELL_PERCENT             | Задает процент желаемой прибыли (default: 1)
ONE_ORDERS_SELL_OFFSET              | Разница между ценой LastPrice и первым ордером buy в стеке ордеров в % (default: 2)
QUANTITY_ORDERS_IN_BLOCKS           | Количество ордеров в блоке (default: false)

> **При запуске Стратегии "One Sell a lot Buy" начальное состояние баланса основной валюты в паре игнорируется!**


> Все стратегии взаимоисключающие. Если ни одна стратегия не выбрана используется стратегия "Скальпер"

#### Дополнительные опции

 Option | Description
----------------|----------------------
EMAIL_BUG_REPORT_ADDRESS    | Email адрес для уведомлениях о падениях и ошибках сети
HOST_SMTP                   | Адрес почтового сервера
EMAIL_AUTH_USER             | Логин авторизации на почтовом сервере
EMAIL_AUTH_PASS             | Пароль почтового сервера
BTCE_HOST                   | Адрес биржи Btc-e
TIME_ZONE                   | Временная зона (Например: Europe/Moscow) [Database Time Zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
LOG                         | Вывод лога расчета авто параметров (default: false)
RESTART_TRADER_TIME         | Через сколько секунд перезапрашивать данные после сетевых ошибок (default: 5)
NOTIFICATION_ERROR_COUNT    | Количество ошибок за 5 минут для уведомления через telegram (default: false)


## Run

```
$ npm start
```
или
```
TELEGRAM_TOKEN=110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw TELEGRAM_ID=12345678 node ./build/server
```

## Donate

```
BTC: 1GGbq5xkk9YUUy4QTqsUhNnc9T1n3sQ9Fo
LTC: LPRESTPTNMUT8rVpdvd8cJxqrnGDW7Va8N
```