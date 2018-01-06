# GBot Trader

[![Dependency Status](https://david-dm.org/steeply/gbot-trader.svg)](https://david-dm.org/steeply/gbot-trader)

Это приложение работает на стороне сервера и управляется через Telegram.

## Интегрированные биржи

* Wex
* Poloniex
* Bittrex
* Exmo
* Bitfinex
* Liqui
* Dsx

## FAQ
Перед тем как задавать вопросы, прочитайте, пожалуйста, [FAQ](faq_ru.md). Большинство ответов вы найдете в нем.

## Установка

### Установка для Windows на локальный компьютер или VDS

1. Установите [git](https://git-scm.com/downloads) если у вас он не установлен. Откройте консоль и введите ваш e-mail и никнейм:
    ```
    git config --global user.name "Your Name"
    git config --global user.email "yourname@example.com"
    ```
 
2. Установите [node.js](https://nodejs.org/en/download/current).
3. На своем компьютере создайте любую папку (например `gbot`) и сохраните туда данный репозиторий. Чтобы директория `build` и остальные файлы были в корне директории `gbot`.
4. Перейдите в папку и установите пакеты зависимостей командой `npm i`. <br>
    Установка через **Download ZIP**:
    ```
    cd /D D:\gbot                   (Если папка находится в корне диска D)
    npm i
    ```
    Установка через **git**:

    ```
    cd /D D:\gbot                   (Если папка находится в корне диска D)
    git clone https://github.com/steeply/gbot-trader.git
    cd gbot-trader
    npm i
    ```
    
5. Чтобы **обновить бота** на новую версию:
    a) Если устанавливали через `Download ZIP` скачайте новое приложение с текущего репозитория в свою папку, **где распологается прошлая версия бота** и замените в ней файлы.
    
    б) Если устанавливали через `git clone` перейдите в консоле в папку с ботом и выполните команды:
    ```
    git fetch --all
    git reset --hard origin/master
    ```   
    При необходимости обновите зависимости библиотек командой: `npm i`

6. Дальше приступайте к настройке конфигурации и запускайте бота.

### Установка на Heroku
**Предупреждение!** 

* Если вы не дружите с консолью, git или не знаете ни чего о PaaS платформах, лучше не используйте этот вариант.
* Heroku **раз в сутки** автоматически **перезагружает** ваше приложение. Для стратегии "Линии Боллинджера" это может быть критично.

1. На своем компьютере создайте любую папку (например `gbot`) и сохраните туда данный репозиторий. Чтобы директория `build` и остальные файлы были в корне директории `gbot`.
    ```
    cd /D D:\gbot                   (Если папка находится в корне диска D)
    git clone https://github.com/steeply/gbot-trader.git
    cd gbot-trader
    ```

2. Зарегистрируйтесь на сайте [heroku](https://signup.heroku.com/login).

    Скачайте [heroku CLI](https://devcenter.heroku.com/articles/getting-started-with-nodejs#set-up) и установите его.
    
    Откройте консоль и **перейдите в ней в папку с ботом** и выполняйте следующие команды:
    
    Выполните команду: **heroku login** и введите свой e-mail и пароль, под которым вы зарегистрировались на Heroku (Во время ввода пароля символы не отображаются).
    
    Если вы сохранили репозиторий через кнопку `Download ZIP`, выполните следующие действия (если через git clone, пропустите этот пункт):
    ```
    git init
    git add . 
    git commit -m "first commit"
    ```
    
    Затем создайте новое приложение на heroku:
    ```
    heroku create
    git push heroku master
    heroku ps:scale web=0                   - отключить WEB (Бот это ни сайт, так что этот пункт обязательный)
    ```

3. В приложении на [heroku](https://dashboard.heroku.com/apps) зайдите в Settings -> Reveal Config Vars (вводим параметры приложения из документации (ключи от биржи и телеграма, настройки и стратегию)).
    <br>Или можно сделать через консоль:
    ```
    heroku config:set PARAM=VALUE           - установить параметр
    heroku config:unset PARAM               - удалить параметр
    heroku config                           - показать все установленные параметры
    ```

4. Чтобы включить бота, в разделе Resources -> **WORKER** - Включить. 
    <br>Или консольная команда:
    ```
    heroku ps:scale worker=1                - включить
    heroku ps:scale worker=0                - выключить
    ```

5. Чтобы **обновить бота** на heroku на новую версию:
    
    a) Если устанавливали через `Download ZIP` скачайте новое приложение с текущего репозитория в свою папку, **где распологается прошлая версия бота** и замените в ней файлы.
    
    Дальше выполните команды:
    ```
    git add . 
    git commit -m "update bot"
    git push heroku master
    ```
    
    б) Если устанавливали через git clone выполните команды:
    ```
    git pull origin master
    git push heroku master
    ```
    
    При необходимости обновите параметры конфигурации (см. п. 3)



## Настройка

### Создание бота Telegram.

Если используете опцию **TELEGRAM_OFF**, тогда в этом пункте нет необходимости.

[@BotFather](https://core.telegram.org/bots#6-botfather) - это бот для создания и управления ботами в Telegram

Напишите команду **/newbot**, чтобы создать нового робота. BotFather спросит у вас имя нового бота и предложит придумать username.<br>
Имя (name) будет отображаться в контактах и чатах.<br>
**Username** — короткое имя на латинице, которое используется для упоминаний бота и в ссылках на профиль в telegram.me. Username должен состоять из букв латинского алфавита, подчёркиваний и цифр и быть длиной от 5 до 32 символов. Также имя пользователя обязательно должно заканчиваться на «bot», например: «trade_bot» или «TradeBot».<br>
Ключ (**токен**) это набор символов вида `110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw`, который нужен, чтобы получать и отправлять сообщения с помощью Bot API.

#### Получение Telegram ID

1. Установите параметры API биржи `KEY`, `SECRET` и `TELEGRAM_TOKEN`.
2. Запустите GBot Trader.
3. Напишите вашему Telegram боту (которого вы создали ранее через [@BotFather](https://core.telegram.org/bots#6-botfather)) любое сообщение, в ответе получите ваш id номер.
4. Выключите GBot Trader.
5. Установите `TELEGRAM_ID`.

Или воспользуйтесь ботом в Telegram **@userinfobot**

### Параметры переменного окружения:

#### Обязательные параметры

 Option | Description| Type | Default
--------|------------|-----|----------
**KEY**                 | API key           | string | -
**SECRET**              | API secret| string | -
**NAME_COIN**           | Торговая валюта <br>(FAQ п.49) | string | ltc
**NAME_COIN_TWO**       | Торговая валюта <br>(FAQ п.49)| string | usd
EXCHANGE                | Выбор биржи: <br> **wex** <br> **poloniex** (инвертированные пары) <br> **bittrex** (инвертированные пары) <br> **exmo** <br> **bitfinex** <br> **liqui** <br> **dsx** | string | wex
EXCHANGE_HOST           | Адрес API биржи. Если основной адрес недоступен.<br>Exmo: https://api.exmo.com<br>Wex: wex.nz<br>Dsx: https://dsx.uk  | string | -
TELEGRAM_TOKEN          | Ваш токен для Telegram | string | -
TELEGRAM_ID             | ID вашего пользователя в Telegram | number | -
TELEGRAM_OFF            | Отключить Telegram. | boolean | false

> Опция **TELEGRAM_OFF** отключает возможность использовать Telegram в боте. Всё управление и все уведомления посылаемые через Telegram будут так же отключены!

**Внимание!**
У биржи **Dsx** стоят жесткие ограничения на число знаков в объеме ордера для каждой торговой пары, которые в большинстве случаев равно 2 - 5 знакам. Для все остальных бирж обычно используются 8 знаков. В связи с этим возникает момент когда размер ордера может не быть равным указанной длине, по этому будет происходить обрезание или округление числа в большую или меньшую сторону. А значит в ордер будет установлен больший/меньший объем чем не обходимо, чтобы вписаться в эти ограничения. В связи с этим на балансе должно оставаться достаточное количество средств чтобы компенсировать это округление.<br>У биржи есть ДЕМО аккаунт, где можно протестировать ваши настройки.



#### Торговые параметры

**По умолчанию бот запустится на дефолтных настройках. По этому указывать все известные параметры совсем не обязательно если они совпадают с настройками по умолчанию.**


 Option | Description|Type | Default
--------|------------|-----|----------
TIME_UPDATE_AUTO_SETTINGS           | Время обновления авто параметров (в минутах)<br>(FAQ п.21)  | number | 2
DEPOSIT_LIMIT_PERCENT               | Процент использования депозита<br>(FAQ п.19) | number | 100
DEPOSIT_LIMIT_CURRENCY              | Размер использования депозита в валюте параметра **NAME_COIN_TWO**. <br>Для бирж с инвертированной валютой в валюте параметра **NAME_COIN** | number | 0
COUNT_ORDERS                        | Количество ордеров.<br> Сколько всего будет установлено.<br>(FAQ п.22) | number | рассчитывается на основе размера депозита
QUANTITY_ORDERS_IN_BLOCKS           | Количество ордеров в блоке.<br> Сколько ордеров будет одномоментно на рынке. <br>(FAQ п.22) | number | 0
SIZE_FIRST_ORDERS_CURRENCY          | Размер первого ордера в торгуемой валюте | number | 0
SIZE_FIRST_ORDERS_INSECOND_CURRENCY | Размер первого ордера в базовой валюте | number | 0
SIZE_FIRST_ORDERS_PERCENT           | Размер первого ордера в процентах | number | 0
SIZE_ORDERS_MARTINGALE              | Размер ордеров по Мартингейл<br> (для Экспоненты - проценты, для Линейного - абсолютное число)<br>(FAQ п.43) | number | 0
MARTINGALE_TYPE                     | Тип Мартингейла: <br> 1 - экспоненциальный <br> 2 - линейный<br>(FAQ п.43) | number | 1
CONTINUE_MARTINGALE_GRID            | Продолжать сетку Мартингейл при перезапуске бота (**сохраняет размер ордера**)<br>(FAQ п.43) | boolean | false
TRADING_PRICE_RANGE                 | Диапазон цен разрешенных для торгов (Например: 3000/5000)<br>Если не указано, нет ограничений<br>(FAQ п.51)  | string | -
TRADING_PRICE_RANGE_PERCENT         | Процент для автоматического создания диапазон цен разрешенных для торгов<br>Если не указано, нет ограничений<br>(FAQ п.51)  | number | -

**Важно!**

> Размер ордера при `SIZE_FIRST_ORDERS_INSECOND_CURRENCY` будет рассчитан по формуле **SIZE_FIRST_ORDERS_INSECOND_CURRENCY / price**

> `SIZE_FIRST_ORDERS_CURRENCY`, `SIZE_FIRST_ORDERS_INSECOND_CURRENCY` или `SIZE_FIRST_ORDERS_PERCENT` выбирается **только 1 из параметров**!

> При ручном размере первого ордера **RANGE_OFFSET** не работает, а **COUNT_ORDERS** будет рассчитано автоматически.

> Параметр **CONTINUE_MARTINGALE_GRID** не восстанавливает отступы при использовании **OFFSET_ORDERS_EXPONENTIAL**.


#### Смещение ордеров

Варианты возможных отступов ордеров. Выберите **один** из предложенных.

 Option | Description|Type | Default
--------|------------|-----|----------
OFFSET_FIRST_ORDERS_PERCENT         | Отступ первого ордера в процентах | number | 0
OFFSET_FIRST_ORDERS_POINTS          | Отступ первого ордера в пунктах | number | 0
OFFSET_ORDERS_POINTS                | Отступ между ордерами в пунктах  | number | 10
OFFSET_ORDERS_PERCENT               | Отступ между ордерами в процентах | number | 0
OFFSET_ORDERS_EXPONENTIAL           | Отступ между ордерами по экспоненте в % | number | 0
RANGE_OFFSET                        | Диапазон смещения ордеров (перекрытие сетки) <br>(FAQ п.18) | number | 0

> Параметр **OFFSET_FIRST_ORDERS_PERCENT** или **OFFSET_FIRST_ORDERS_POINTS** можно использовать совместно с любым из выбранных вариантов.

> Чтобы установить первый ордер в стакане цен самым первым, используйте `OFFSET_FIRST_ORDERS_PERCENT=-1` или `OFFSET_FIRST_ORDERS_POINTS=-1`

#### Отключение сетки ордеров
Будет установлен один ордер с максимальным объемом вместо сетки ордеров.

 Option | Description|Type | Default
--------|------------|-----|----------
DISABLE_GRID_SELL                   | Отключить расстановку ордеров по сетке для Sell ордеров | boolean | false
DISABLE_GRID_BUY                    | Отключить расстановку ордеров по сетке для Buy ордеров | boolean | false

#### Модули автоконфигурации
Подробнее FAQ п.41


 Option | Description|Type | Default
--------|------------|-----|----------
DANGER_PRICE_STOP                   | Остановка бота при большом скачке цены | boolean | false
DANGER_PRICE_STOP_PERCENT           | Процент скачка цены для остановки бота | number | 9
DYNAMIC_SETTINGS_TIME               | Динамическое время обновления авто параметров | boolean | false
DYNAMIC_OFFSET_ORDERS               | Динамическое распределение ордеров <br>(FAQ п.37) | boolean | false
DYNAMIC_OFFSET_INTERVAL             | Интервал проверки цены для динамической сетки (в мин) <br>(FAQ п.37) | number | 60
DYNAMIC_OFFSET_PROFIT_DIVISOR       | Делитель изменения профитного ордера <br>(FAQ п.37) | number | 10
DYNAMIC_OFFSET_INDENTION_DIVISOR    | Делитель изменения размера сетки <br>(FAQ п.37) | number | COUNT_ORDERS
TREND_DEFINITION                    | Определение тренда (Экспериментально) | boolean | false
ABRUPT_CHANGE_TREND                 | Быстрый разворот тренда (Экспериментально) | boolean | false
OFF_MODULES_AUTO_SETTINGS           | Отключение всех модулей авто настройки | boolean | false

> Опции **TREND_DEFINITION** и **ABRUPT_CHANGE_TREND** только для стратегии **Scalper**.

> Опция **OFF_MODULES_AUTO_SETTINGS** контролирует DANGER_PRICE_STOP, DYNAMIC_SETTINGS_TIME, DYNAMIC_OFFSET_ORDERS, TREND_DEFINITION, ABRUPT_CHANGE_TREND



## Индивидуальные параметры стратегий

**Все стратегии взаимоисключающие. Если ни одна стратегия не выбрана, используется стратегия "Скальпер".**

### Стратегия "Скальпер" и "Линии Боллинджера"

 Option | Description|Type | Default
--------|------------|-----|----------
TIME_CLOSE_ORDERS                   | Время закрытия неиспользованных ордеров (в минутах)<br>(FAQ п.44) | number | 5
TIME_CLOSE_ORDERS_INACTIVITY        | Время закрытия ордеров при бездействии (в минутах)<br>(FAQ п.44) | number | 15
STEP_BREAKEVEN_PERCENT              | Процент отступа от безубытка между bid и ask (Только для "Скальпер")<br>(FAQ п.20) | number | 50


### Стратегия "Линии Боллинджера"

 Option | Description|Type | Default
--------|------------|-----|----------
BBANDS                              | Линии Боллинджера (Трендовая стратегия) | boolean | false
BBANDS_DEVIATION                    | Отклонение | number | 2
BBANDS_PERIOD                       | Период BBANDS <br> Период - это количество цен (свечей) в массиве. | number | 20
RSI_TYPE                            | Тип **rsi** или **stochrsi** | string | rsi
RSI_PERIOD                          | Период RSI  | number | 14
RSI_RANGE_SELL                      | Диапазон RSI для продажи <br> Значения указываются в формате **начало/конец** диапазона. | string | 70/100
RSI_RANGE_BUY                       | Диапазон RSI для покупки  | string | 1/30
BBANDS_INTERVAL                     | Таймфрейм. Интервал запроса цен (в минутах) | number | 1
SAVE_PRICE_FILE                     | Сохранять кэш цен в файл  | boolean | false
PRICE_FILE_PATH                     | Пользовательский путь до директории с файлом | string | Директория с ботом

> Если `RSI_PERIOD=0` тогда индикатор отключается и торговля происходит только по индикатору BBANDS!

> При использовании параметра `SAVE_PRICE_FILE` необходимы права на запись в директории. Учтите, что если вы запустите бота и реальные **цены рынка отличаются от тех что в файле**, первоначальные ордера могут встать неправильно и **продать в убыток!**

> Параметр `SAVE_PRICE_FILE` **не будет работать** на PaaS платформах (Heroku, Pivotal и любых других платформах где используются средства виртуализации контейнера)!


### Набор стратегий "One Orders"
При запуске Стратегии "One Sell a lot Buy" начальное состояние баланса **основной** валюты в паре **игнорируется**!<br>
При запуске Стратегии "One Buy a lot Sell" начальное состояние баланса **второстепенной** валюты в паре **игнорируется**!

На примере BTC/USD и (`LTC/BTC`) биржа Wex:

* One Sell a lot Buy - накапливаются USD (`BTC`). Баланс BTC (`LTC`) на момент запуска игнорируется.
* One Buy a lot Sell - накапливаются BTC (`LTC`). Баланс USD (`BTC`) на момент запуска игнорируется.

На примере BTC/LTC и (`USDT/BTC`) биржа Poloniex / Bittrex:

* One Sell a lot Buy - накапливаются BTC (`USDT`). Баланс LTC (`BTC`) на момент запуска игнорируется.
* One Buy a lot Sell - накапливаются LTC (`BTC`). Баланс BTC (`USDT`) на момент запуска игнорируется.


 Option | Description|Type | Default
--------|------------|-----|----------
ONE_ORDERS_SELL                     | Стратегия "One Sell a lot Buy" | boolean | false
ONE_ORDERS_BUY                      | Стратегия "One Buy a lot Sell" | boolean | false
ONE_ORDERS_OFFSET                   | Разница между ценой LastPrice и первым ордером в стеке ордеров в %.<br> Будет подтягивать ордера вслед за ценой, если это значение будет превышено. | number | 2
ONE_ORDERS_PROFIT_PERCENT           | Задает процент желаемой прибыли | number | 1
INTEGRITY_CONTROL_ORDERS            | Контроль целостности ордеров: <br> **soft** - Что вернула биржа то и ставим <br> **hard** - Бот считает сам <br>(FAQ п.23) | string | soft
TYPE_DATA_USED                      | Откуда брать информацию об исполненных ордерах: <br> **active** - активные ордера <br> **history** - история сделок | string | active
FIRST_LOADING_HISTORY               | Загрузка истории при старте бота | boolean | false
NUMBER_ROWS_LOAD_HISTORY            | Количество строк для загрузки истории | number | 100
CYCLES_AUTO_EXIT                    | Через сколько циклов совершить автовыход <br>(FAQ п.48) | number | 0
STOP_LOSS_PERCENT                   | Уровень Stop Loss в процентах <br>(FAQ п.53) | number | 0
TRAILING_STOP_PERCENT               | Уровень Trailing stop в процентах <br>(FAQ п.45) | number | 0
DISABLE_CAPITALIZATION              | Отключить капитализацию в profit ордере <br>(FAQ п.47) | boolean | false
CAPITALIZATION_BUY_ORDER            | Включает частичную капитализацию Buy ордера при DISABLE_CAPITALIZATION <br>(FAQ п.47) | boolean | false
STRATEGY_AUTO_REVERS                | Автопереключение стратегии на обратную <br>(FAQ п.52) | boolean | false
OFFSET_LAST_ORDER_PERCENT           | Процент отдаления цены от последнего ордера чтобы сработало автопереключение стратегии <br>(FAQ п.52) | number | 5
DELAY_TIME_CYCLES                   | Задержка в секундах перед началом нового цикла после исполнения профитного ордера  | number | 0

<!-- PERMANENT_DEPOSIT Использовать расчет общего депозита с кэшем (Экспериментально) -->

> Если параметр **INTEGRITY_CONTROL_ORDERS** в режиме `hard`, то ордер будет установлен только, если объемы установленных и исполненных  ордеров будут совпадать (если ни один ордер не потеряется).

> При использовании **TYPE_DATA_USED=history** параметр **INTEGRITY_CONTROL_ORDERS=hard** смысла не имеет, ввиду того что в истории данные могут быть некорректны, из-за того, что биржа исполнила не все ордера, которые были установлены (т.е. часть ордеров просто могли быть отменены).

> Если параметр **FIRST_LOADING_HISTORY** включен, будет загружены в кэш первые `NUMBER_ROWS_LOAD_HISTORY` исполненных ордеров до первого SELL/BUY ордера на выбранной паре и выставится SELL/BUY ордер исходя из этих данных.

> Параметр **ONE_ORDERS_OFFSET** не может быть меньше **OFFSET_FIRST_ORDERS_PERCENT** (или **OFFSET_ORDERS_PERCENT** если OFFSET_FIRST_ORDERS_PERCENT не включен) или его эквивалента в **OFFSET_FIRST_ORDERS_POINTS**.

> Включенный параметр **DISABLE_CAPITALIZATION** переводит `INTEGRITY_CONTROL_ORDERS` в **hard**.

## Дополнительные опции

### Уведомления
Подробнее FAQ п.17

 Option | Description|Type | Default
--------|------------|-----|----------
NOTIFICATION_PAIR                   | Пары для уведомления о скачках курса (Например: `btc/usd, ltc/usd` или **all/all** для всех пар) | string | -
NOTIFICATION_DEVIATION_PERCENT      | Насколько процентов должна скакнуть цена, чтобы сработало уведомление | number | 5
MONITORING_PAIR                     | Пары для мониторинга.<br>(Например: `btc/usd, ltc/usd`. Или только валюта пары, например: `btc` ).<br>Если ничего не задано (**параметр не установлен**) будут мониториться **ВСЕ** доступные пары на бирже.<br> | string | Все пары
NOTIFICATION_ERROR_COUNT            | Количество ошибок за 5 минут для уведомления через telegram | number | 0
NOTIFICATION_ORDER_IS_EXECUTED      | Уведомление об исполнении one orders | boolean | false

### Уведомление об ошибках на Email
Подробнее FAQ п.27

 Option | Description|Type | Default
--------|------------|-----|----------
EMAIL_REPORT_ADDRESS        | Email адрес для уведомлениях о падениях и ошибках сети | string | -
HOST_SMTP                   | Адрес почтового сервера | string | smtp.yandex.ru
EMAIL_AUTH_USER             | Логин авторизации на почтовом сервере | string | -
EMAIL_AUTH_PASS             | Пароль почтового сервера | string | -

### Логирование

 Option | Description|Type | Default
--------|------------|-----|----------
LOG                         | Вывод лога расчета авто-параметров <br>(FAQ п.33) | boolean | false
LOG_DEBUG                   | Вывод дебаг лога (расчет ордеров и остальная матиматика) | boolean | false
LOG_TRANSPORTS              | Куда писать лог: <br>  0 - консоль <br>  1 - файл <br>  2 - консоль и файл | number | 0 
LOG_PATH                    | Пользовательский путь до директории с логом | string | Директория с ботом
LOG_TREE                    | Сохранять логи по директориям год/месяц/день | boolean | false

### Обработка ошибок

 Option | Description|Type | Default
--------|------------|-----|----------
NUMBER_CHECK_DATA           | Сколько раз перепроверять данные.<br>Используется значение 2 и более.<br>0 - выключено <br>(FAQ п.54) | number | 0
AUTO_RESTART_HANGING        | Авто-перезапуск воркера в случае его зависания (сообщение об ошибке "Worker does not meet" )<br> **Это НЕ рестарт всего бота со сбросом всех данных.** | boolean | false
RESTART_TRADER_TIME         | Через сколько секунд перезапрашивать данные после сетевых ошибок <br>(FAQ п.31) | number | 5


### Остальные параметры

 Option | Description|Type | Default
--------|------------|-----|----------
TIME_ZONE                   | Временная зона [Database Time Zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | string | Asia/Yekaterinburg
EXCHANGE_FEE                | Комиссия на сделки биржи <br>(FAQ п.32) | number | 0.25
MINIMUM_ORDER_SIZE_IN_BTC   | Минимально допустимый размер ордера в BTC | number | 0.001
DELAY_REQUEST_API           | Задержка при выполнении запросов к api<br> в миллисекундах <br>(FAQ п.31) | number | 500
DELAY_BETWEEN_MODULES       | Задержка в секундах между выполнением последовательных модулей <br>(FAQ п.31) | number | 3
TITLE                       | Заголовок окна консоли. (Работает не на всех системах). | string | GBot
LANGUAGE                    | Язык интерфейса (`ru` или `en`) | string | ru
NODE_ENV                    | Значение **production** включает:<br>  1. уведомление о старте бота в Telegram.<br> 2. уведомления об ошибках на E-mail.<br> 3. запрещает использовать conf-dev.js.<br> 4. отключает колоризацию в логе. (+ флаг **--no-color**)<br> 5. отключает TITLE | string | dev
URL_STATISTICS              | URL адрес сервера куда будет отправлена статистика в формате post json <br>(FAQ п.46) | string | -

**Важно:**

* Если вы изменили LANGUAGE, отправте команду `/start` в telegram бота для инициализации нового языка в telegram.


## Запуск
 
### На хостинге
Смотрите инструкцию к хостингу как запускать приложения на Node.js.

### На локальном компьютере

```
npm start
```
или
```
node ./build/server
```

### Для Windows

Создайте **start.bat** файл, укажите в нем необходимые параметры и запускайте этот файл.
```
echo off
SET TELEGRAM_TOKEN=110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw 
SET TELEGRAM_ID=12345678

... остальные параметры ...

npm start
pause
```

### Для Linux или Mac
Создайте **start.sh** файл, укажите в нем необходимые параметры и запускайте этот файл.
```
#!/bin/sh
export TELEGRAM_TOKEN=110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw 
export TELEGRAM_ID=12345678

... остальные параметры ...

node ./build/server
```

### Для запуска панели управления в Telegram, отправьте сообщение:
```
/start
```

#### Дополнительные команды в Telegram:
```
/info               - список всех команд

/version            - Версия бота
/params             - Параметры которые можно менять через Telegram
/config             - Возможные параметры конфигурации через конфигурационный файл
/martin [cache]     - Теоретический расчет ордеров Мартингейла (параметры берутся из конфига). 
                      (cache - необязательный параметр, указывающий включить в расчет сетки 
                      данные ордеров из кэша истории)
/ticker coin_name   - Показывает котировку пары coin_name
/trade pair         - Переключает на указанную торговую пару
/stop [codeExit]    - Завершение работы приложения. codeExit - необязательный код выхода.
/sell_all           - Продать по рынку немедленно. (Внимание: Продажа будет без потверждения!)
/restart            - Горячая перезагрузка GBot Trader
/stats              - Статистика торговли
/note [ignore text] - Текст в этой строке будет проигнорирован. Можно использовать как коментарий.
/stoploss           - Отображает информацию о StopLoss
/trail              - Отображает информацию о Trailing Stop
```

