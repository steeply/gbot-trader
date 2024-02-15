# GBot Trader

Это приложение работает на стороне сервера и управляется через Telegram.

### GUI Web Panel

Web Panel для GUI бота лежит тут: [GBot Web Panel](https://github.com/steeply/gbot-web-panel)


## Интегрированные биржи

* Poloniex
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
* Stex (Unofficial) 
* Bleutrade (Unofficial)

### Про Unofficial
* Модуль на биржи [Unofficial](https://github.com/unsv/gbotmod) приобретается отдельно у сторонних разработчиков! Модули можно купить у проверенного разработчика написав ему в Telegram - [@solvento](https://t.me/solvento).
* Модули запущенные в режиме DEMO не требуют лицензии.    

## FAQ
Перед тем как задавать вопросы, прочитайте, пожалуйста, [FAQ](faq_ru.md). Большинство ответов вы найдете в нем.

## Установка



### Установка и запуск в качестве бинарного файла.

Скачайте [ZIP архив](https://github.com/steeply/gbot-trader/archive/binary.zip) и разархивируйте его.

Все API модули которых нет в комплекте бота, нужно положить в папку api.

Для запуска создайте .bat (для Windows) или .sh (для *nix) файл с перечисленными конфигурационными параметрами и запустите его.

Примеры .bat и .sh есть в архиве.



### Установка для Windows на локальный компьютер или VDS в качестве Scripts.

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
    cd /D E:\gbot                   (Если папка находится в корне диска E)
    npm i
    ```
    Установка через **git**:

    ```
    cd /D E:\gbot                   (Если папка находится в корне диска E)
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
    cd /D E:\gbot                   (Если папка находится в корне диска E)
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

1. Установите параметры API биржи `EXCHANGE`, `KEY`, `SECRET` и `TELEGRAM_TOKEN`.
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
**EXCHANGE**            | Выбор биржи: <br> **poloniex** (инвертированные пары) <br> **bittrex** (инвертированные пары) <br> **exmo** <br> **bitfinex** <br> **liqui** <br> **dsx** | string | -
EXCHANGE_HOST           | Адрес API биржи. Если основной адрес недоступен.<br>Exmo: https://api.exmo.com<br>Dsx: api.dsxglobal.com/api/2  | string | -

**Внимание!**
У биржи **Dsx** стоят жесткие ограничения на число знаков в объеме ордера для каждой торговой пары, которые в большинстве случаев равно 2 - 5 знакам. Для все остальных бирж обычно используются 8 знаков. В связи с этим возникает момент когда размер ордера может не быть равным указанной длине, по этому будет происходить обрезание или округление числа в большую или меньшую сторону. А значит в ордер будет установлен больший/меньший объем чем не обходимо, чтобы вписаться в эти ограничения. В связи с этим на балансе должно оставаться достаточное количество средств чтобы компенсировать это округление.<br>У биржи есть ДЕМО аккаунт, где можно протестировать ваши настройки.

#### Параметры для Telegram
Эти параметры относятся только к подключению и работе с Telegram

 Option | Description| Type | Default
--------|------------|-----|----------
TELEGRAM_TOKEN          | Ваш токен для Telegram | string | -
TELEGRAM_ID             | ID вашего пользователя в Telegram | number | -
SOCKS5_HOST             | Хост SOCKS5 | string | -
SOCKS5_PORT             | Порт SOCKS5 | number | 1080
SOCKS5_USERNAME         | Username SOCKS5 | string | -
SOCKS5_PASSWORD         | Password SOCKS5 | string | -
TELEGRAM_BASEURL        | URL сервера или прокси | string | -
TELEGRAM_OFF            | Отключить Telegram. | boolean | false

> Опция **TELEGRAM_OFF** отключает возможность использовать Telegram в боте. Всё управление и все уведомления посылаемые через Telegram будут так же отключены!


#### Торговые параметры

**По умолчанию бот запустится на дефолтных настройках. По этому указывать все известные параметры совсем не обязательно если они совпадают с настройками по умолчанию.**


 Option | Description|Type | Default
--------|------------|-----|----------
TIME_UPDATE_AUTO_SETTINGS           | Интервал обновления авто параметров (в минутах)<br>(FAQ п.21)  | number | 2
DEPOSIT_LIMIT                       | Размер использования депозита в процентах или абсолютное число<br><br>Если задано абсолютное число то указывается размер использования депозита в валюте параметра **NAME_COIN_TWO**. <br>Для бирж с инвертированной валютой в валюте параметра **NAME_COIN** <br>(FAQ п.19) | number or string | 100%
DEPOSIT_TYPE                        | Вариант отдачи депозита в баланс бота для профит ордера.<br> _reserve_ - расчетный с резервированием.<br> _straight_ - прямой с биржи <br>(FAQ п.19) | string | reserve 
PERMANENT_DEPOSIT                   | Жесткий контроль ограничения депозита<br>(FAQ п.19) | boolean | false
COUNT_ORDERS                        | Количество ордеров.<br> Сколько всего будет установлено.<br>(FAQ п.22) | number | рассчитывается на основе размера депозита
QUANTITY_ORDERS_IN_CYCLES           | Количество ордеров в цикле. Сколько ордеров будет установлено в одном цикле для One Orders <br>(FAQ п.22) | number | 0
QUANTITY_ORDERS_IN_BLOCKS           | Количество ордеров в блоке.<br> Сколько ордеров будет одномоментно на рынке. <br>(FAQ п.22) | number | 0
HOLD_QUANTITY_ORDERS                | Удерживать заданное число ордеров в QUANTITY_ORDERS_IN_BLOCKS <br>(FAQ п.22) | boolean | true
GREEDY_FIRST_ORDER_SIZE             | Размер "нулевого" ордера в торгуемой валюте или процентах<br>Формат: 0.1 или 5% | number or string | 0
GREEDY_FIRST_ORDER_SIZE_INSECOND_CURRENCY | Размер "нулевого" ордера в базовой валюте | number | 0
SIZE_FIRST_ORDERS                   | Размер первого ордера в торгуемой валюте или в процентах<br>Пример: 0.1 или 5% | string | 0
SIZE_FIRST_ORDERS_INSECOND_CURRENCY | Размер первого ордера в базовой валюте | number | 0
SIZE_ORDERS_FROM_DEPOSIT            | Размер ордера в процентах от оставшегося депозита | number | 0
SIZE_ORDERS_MARTINGALE              | Размер ордеров по Мартингейл<br> (для Экспоненты - проценты, для Линейного - абсолютное число)<br>Формат: 0.1 или 5%<br>(FAQ п.43) | string or number | 0
TYPE_ORDERS_MARTINGALE              | Тип увеличения Матерингейла. **add** - суммирование, **multiply** - умножение, **pow** - возведение в степень <br>(FAQ п.43) | string | add
CONTINUE_MARTINGALE_GRID            | Продолжать сетку Мартингейл при перезапуске бота (**сохраняет размер ордера**)<br>(FAQ п.43) | boolean | false
ENABLE_HARD_GRID                    | Включает **игнорирование** защитной функции от разницы в ценах между Last Price и последним ордеров в истории <br>(FAQ п.43) | boolean | false
TRADING_PRICE_RANGE                 | Диапазон цен разрешенных для торгов, абсолютные числа или проценты. <br>Например: <br>`3000/5000`<br>`10%/20%`<br>`10%`<br>`1000/10%`<br>Если не указано, нет ограничений<br>(FAQ п.51)  | string | -
TRADING_PRICE_RANGE_OTHER           | Диапазон цен, другой валютной пары, разрешенных для торгов, абсолютные числа или проценты. <br>Например: <br>`3000/5000`<br>`10%/20%`<br>`10%`<br>`1000/10%`<br>Если не указано, нет ограничений  | string | -
OTHER_PAIR                          | Валютная пара для мониторинга диапазона цен. Указывается так же как на бирже. <br>Например: `btc/usd` | string | -
IGNORE_ORDERS_AT_START              | Игнорировать ранее установленные ордера при старте/рестарте бота. <br>(FAQ п.55) | boolean | false
DELAY_TIME_CYCLES                   | Задержка в секундах перед началом нового цикла <br>* для **One orders**: после исполнения профитного ордера <br>* для **Скальпера**: после TIME_CLOSE_ORDERS | number | 0
STOP_LOSS_ABS                       | Абсолютное значение цены для срабатывания Stop Loss <br>(FAQ п.53) | number | 0
BUY_STOP_ABS                        | Абсолютное значение цены для срабатывания Buy Stop <br>(FAQ п.53) | number | 0
STOP_LOSS_FLOATING                  | Процент падения цены от High price для срабатывания плавающего Stop Loss <br>(FAQ п.53) | number | 0

**Важно!**

> Размер ордера при `SIZE_FIRST_ORDERS_INSECOND_CURRENCY` будет рассчитан по формуле **SIZE_FIRST_ORDERS_INSECOND_CURRENCY / price**

> `SIZE_FIRST_ORDERS` или `SIZE_FIRST_ORDERS_INSECOND_CURRENCY` выбирается **только 1 из параметров**!

> `GREEDY_FIRST_ORDER_SIZE` или `GREEDY_FIRST_ORDER_SIZE_INSECOND_CURRENCY` выбирается **только 1 из параметров**!

> `SIZE_ORDERS_MARTINGALE` или `SIZE_ORDERS_FROM_DEPOSIT` выбирается **только 1 из параметров**!

> При ручном размере первого ордера **RANGE_OFFSET** не работает, а **COUNT_ORDERS** будет рассчитано автоматически.

> При использовании `QUANTITY_ORDERS_IN_CYCLES` параметр `COUNT_ORDERS` будет переопределен автоматически.

> Если `SIZE_ORDERS_MARTINGALE` задан в процентах, то `TYPE_ORDERS_MARTINGALE` не применяется.

#### Смещение ордеров

Варианты возможных отступов ордеров. Выберите **один** из предложенных.

 Option | Description|Type | Default
--------|------------|-----|----------
FIX_PRICE_FIRST_ORDER               | Фиксированная цена первого ордера | number | 0
OFFSET_FIRST_ORDERS_PERCENT         | Отступ первого ордера в процентах | number | 0
OFFSET_FIRST_ORDERS_POINTS          | Отступ первого ордера в пунктах | number | 0
OFFSET_ORDERS_POINTS                | Отступ между ордерами в пунктах  | number | 10
OFFSET_ORDERS_PERCENT               | Отступ между ордерами в процентах | number | 0
OFFSET_ORDERS_EXPONENTIAL           | Отступ между ордерами по экспоненте в % | number | 0
OFFSET_ORDERS_MULTIPLY              | Отступ для ордеров по множителю | number | 0
OFFSET_ORDERS_BLOCK                 | Отступ между ордерами по блокам в %<br>Например в первом блоке ордера будут с отступом 0.2, во втором блоке 0.4 и т.д. | number | 0
RANGE_OFFSET                        | Диапазон перекрытие сетки ордеров (расстояние от первого до последнего ордера) <br>(FAQ п.18) | number | 0

> Параметр **OFFSET_FIRST_ORDERS_PERCENT** или **OFFSET_FIRST_ORDERS_POINTS** можно использовать совместно с любым из выбранных вариантов.

> Чтобы установить первый ордер в стакане цен самым первым, используйте `OFFSET_FIRST_ORDERS_PERCENT=-1`. <br>Можно использовать любые отрицательные значения, тем самым сдвигая ордера в противоположную сторону.

> Чтобы ограничить максимальный отступ для **OFFSET_ORDERS_EXPONENTIAL** используйте параметр **OFFSET_ORDERS_EXPONENTIAL_MAX**. Важно! OFFSET_ORDERS_EXPONENTIAL_MAX должен быть больше чем OFFSET_ORDERS_EXPONENTIAL.

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

###  Стратегия "Скальпер"

 Option | Description|Type | Default
--------|------------|-----|----------
TYPE_SCALPER                        | Тип работы скальпера. Значение: 1 или 2 <br>(FAQ п.57) | number | 1
STEP_BREAKEVEN_PERCENT              | Только для `TYPE_SCALPER=1`<br>Процент отступа от безубытка между bid и ask<br>(FAQ п.20) | number | 50
TRADING_AMOUNT_RANGE                | Диапазон рандомного размера ордеров<br> Значения указываются в формате **начало/конец** диапазона. | string | -

> При использовании `TRADING_AMOUNT_RANGE` параметры `COUNT_ORDERS`, `SIZE_ORDERS_MARTINGALE`, `SIZE_FIRST_ORDERS_*` и т.д. не имеют смысла и будут проигнорированы. 

### Стратегия "Линии Боллинджера"

 Option | Description|Type | Default
--------|------------|-----|----------
BBANDS                              | Линии Боллинджера (Трендовая стратегия) | boolean | false
BBANDS_DEVIATION                    | Стандартное отклонение Боллинджера | number | 2
BBANDS_PERIOD                       | Период BBANDS <br> Период - это количество цен (свечей) в массиве. | number | 20
RSI_TYPE                            | Тип **rsi** или **stochrsi** | string | rsi
RSI_PERIOD                          | Период RSI  | number | 14
RSI_RANGE_SELL                      | Диапазон RSI для продажи <br> Значения указываются в формате **начало/конец** диапазона. | string | 70/100
RSI_RANGE_BUY                       | Диапазон RSI для покупки  | string | 1/30
TIMEFRAME                           | Таймфрейм. Интервал запроса цен (в минутах). Используйте значения доступные на бирже | number | 1
CLOSE_GRID_OPPOSITE                 | Закрывает противоположную сетку ордеров как только индикаторы изменят тип действия (покупать или продавать) | boolean | false
CLOSE_GRID_IS_TRADING_SIGNAL_CANCELED | Закрывает сетку ордеров при отмене сигнала | boolean | false
SAVE_PRICE_FILE                     | Сохранять кэш цен в файл  | boolean | false
PRICE_FILE_PATH                     | Пользовательский путь до директории с файлом | string | Директория с ботом

> Если `RSI_PERIOD=0` тогда индикатор отключается и торговля происходит только по индикатору BBANDS!

> При использовании параметра `SAVE_PRICE_FILE` необходимы права на запись в директории. Учтите, что если вы запустите бота и реальные **цены рынка отличаются от тех что в файле**, первоначальные ордера могут встать неправильно и **продать в убыток!**

> Параметр `SAVE_PRICE_FILE` **не будет работать** на PaaS платформах (Heroku, Pivotal и любых других платформах где используются средства виртуализации контейнера), так как при перезапуске контейнера все данные очищаются!

> Если использован дефолтный bbands без внешних индикаторов, то ордера ставятся не по bid и ask рынка, а по границам линий bbands, соотвественно отступы первого ордера так же расчитываются от этих значений

### Набор стратегий "One Orders"
При запуске Стратегии "One Sell a lot Buy" начальное состояние баланса **основной** валюты в паре **игнорируется**!<br>
При запуске Стратегии "One Buy a lot Sell" начальное состояние баланса **второстепенной** валюты в паре **игнорируется**!

На примере BTC/USD и (`LTC/BTC`) биржа Exmo:

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
ONE_ORDERS_PROFIT_PERCENT           | Задает процент желаемой прибыли.<br>Может принимать фикс значение, так и диапазон min/max (если 1 исполненный ордер то max, если несколько то min) | string or number | 1
ONE_ORDERS_SPO_PERCENT              | Сквиз-профит-ордер. Задает процент желаемой прибыли при сквизе цены (и задержу перед срабатыванием).<br>(FAQ п.61) | string/number | 0
INTEGRITY_CONTROL_ORDERS            | Контроль целостности ордеров: <br> **soft** - Что вернула биржа то и ставим <br> **hard** - Бот считает сам <br>(FAQ п.23) | string | soft
TYPE_DATA_USED                      | Откуда брать информацию об исполненных ордерах: <br> **active** - активные ордера <br> **history** - активные ордера + история сделок | string | active
FIRST_LOADING_HISTORY               | Загрузка истории с биржи при старте бота | boolean | false
NUMBER_ROWS_LOAD_HISTORY            | Количество строк для загрузки истории | number | 100
LOAD_HISTORY_DAYS                   | Количество дней истории<br>Пока используется только для Poloniex | number | 30
SAVE_HISTORY                        | Сохранять копию истории на компьютер | boolean | false
CYCLES_AUTO_EXIT                    | Через сколько циклов совершить автовыход <br>(FAQ п.48) | number | 0
AUTO_EXIT_PERCENT                   | Процент отдаления цены от последнего профитного ордера для выполнения автовыхода. <br>(FAQ п.62) | number | 0
STOP_LOSS_PERCENT                   | Уровень Stop Loss в процентах <br>(FAQ п.53) | number | 0
STOP_LOSS_DEPOSIT_LIMIT             | Процент остатка депозита для срабатывания Stop Loss | number | 0
BUY_STOP_PERCENT                    | Уровень Buy Stop в процентах <br>(FAQ п.53) | number | 0
TRAILING_STOP_PERCENT               | Уровень Trailing stop в процентах <br>(FAQ п.45) | number | 0
TRAILING_STOP_PROTECTIVE_SPREAD     | Устанавливает процент дополнительного отклонения цены заявки от цены инициировавшей заявку <br>(FAQ п.45) | number | 0
TRAILING_GRID_PERCENT               | Уровень Trailing grid в процентах <br>(FAQ п.56) | number | 0
DISABLE_CAPITALIZATION              | Отключить капитализацию в profit ордере <br>(FAQ п.47) | boolean | false
CAPITALIZATION_BUY_ORDER            | Включает частичную капитализацию Buy ордера при DISABLE_CAPITALIZATION <br>(FAQ п.47) | boolean | false
PARTIALLY_EXECUTED_GRID             | Учитывать частичное исполнение ордеров из сетки<br> Только для DISABLE_CAPITALIZATION=true | boolean | false
SHIFT_GRID_PARTIAL_EXECUTION        | Разрешить сдвигать сетку ордеров, если есть частичное исполнение ордеров из сетки | boolean | false
STRATEGY_AUTO_REVERS                | Автопереключение стратегии на обратную <br>(FAQ п.52) | boolean | false
OFFSET_LAST_ORDER_PERCENT           | Процент отдаления цены от последнего ордера чтобы сработало автопереключение стратегии <br>(FAQ п.52) | number | 5
PRICE_TRADING_TYPE_CHANGE           | Цена при которой изменится тип торговли в абсолютном или процентном значении<br>Формат `number` или `low/high`<br>Например: <br>`3000`<br>`3000/5000`<br>`10%/20%`<br>`10%`<br>`1000/10%`<br>(FAQ п.58) | number or string | -
IND_CHECK                           | Использование индикаторов для сетки<br>Значния: 'rsi', 'bbands', 'rsi,bbands'<br>(FAQ п.59) | string | -
IS_PROFIT_INDICATORS                | Учитывать индикаторы так же для профит ордера | boolean | false

> Если параметр **INTEGRITY_CONTROL_ORDERS** в режиме `hard`, то ордер будет установлен только, если объемы установленных и исполненных  ордеров будут совпадать (если ни один ордер не потеряется).

> Если параметр **FIRST_LOADING_HISTORY** включен, будет загружены в кэш первые `NUMBER_ROWS_LOAD_HISTORY` исполненных ордеров из сетки ордеров до первого SELL/BUY ордера на выбранной паре и выставится профитный SELL/BUY ордер исходя из этих данных.

> Если параметр **ONE_ORDERS_OFFSET** меньше **OFFSET_FIRST_ORDERS_PERCENT** (или **OFFSET_ORDERS_PERCENT** если OFFSET_FIRST_ORDERS_PERCENT не включен) или его эквивалента в **OFFSET_FIRST_ORDERS_POINTS** тогда переставление ордеров **будет в обе стороны**.

> Включенный параметр **DISABLE_CAPITALIZATION** переводит `INTEGRITY_CONTROL_ORDERS` в **hard**.

## Дополнительные опции


### Внешние индикаторы
Подробнее FAQ п.60

 Option | Description|Type | Default
--------|------------|-----|----------
EXTERNAL_INDICATORS     | Включить использования внешних индикаторов | boolean | false
URL_INDICATOR           | URL адрес расположения индикаторов | string | -
STRATEGY_LABEL          | Стратегия работы внешнего индикатора | string | -

> Включение внешних индикаторов отключает внутренние индикаторы бота и бот работает только по этим сигналам.


### Уведомления
Подробнее FAQ п.17

 Option | Description|Type | Default
--------|------------|-----|----------
NOTIFICATION_PAIR                   | Пары для уведомления о скачках курса (Например: `btc/usd, ltc/usd` или **all/all** для всех пар) | string | -
NOTIFICATION_DEVIATION_PERCENT      | Насколько процентов должна скакнуть цена, чтобы сработало уведомление | number | 5
MONITORING_PAIR                     | Пары для мониторинга.<br>(Например: `btc/usd, ltc/usd`. Или только валюта пары, например: `btc` ).<br>Если ничего не задано (**параметр не установлен**) будут мониториться **ВСЕ** доступные пары на бирже.<br> | string | Все пары
NOTIFICATION_ERROR_COUNT            | Количество ошибок за 5 минут для уведомления через telegram | number | 0
NOTIFICATION_ORDER_IS_EXECUTED      | Уведомление об исполнении профитного one orders | boolean | false
NOTIFICATION_END_GRID               | Уведомление об окончании сетки ордеров. Будет выслано уведомление если осталось меньше 3 ордеров | boolean | false


### Логирование

 Option | Description|Type | Default
--------|------------|-----|----------
LOG                         | Вывод лога расчета авто-параметров <br>(FAQ п.33) | boolean | false
LOG_DEBUG                   | Вывод дебаг лога (расчет ордеров и остальная матиматика) | boolean | false
LOG_INDICATORS              | Непосредственный вывод лога индикаторов<br>Внимание! большой поток информации в консоль - включайте только при необходимости. | boolean | false
LOG_STACK                   | Стек вывода ошибки при падении бота. | boolean | false
LOG_TRANSPORTS              | Куда писать лог: <br>  0 - консоль <br>  1 - файл <br>  2 - консоль и файл | number | 0 
LOG_PATH                    | Пользовательский путь до директории с логом | string | Директория с ботом
LOG_TREE                    | Сохранять логи по директориям год/месяц/день | boolean | false

### Обработка ошибок

 Option | Description|Type | Default
--------|------------|-----|----------
NUMBER_CHECK_DATA           | Сколько раз перепроверять данные.<br>Используется значение 2 и более.<br>0 - выключено <br>(FAQ п.54) | number | 0
AUTO_RESTART_HANGING        | Авто-перезапуск воркера в случае его зависания (сообщение об ошибке "Worker does not meet" )<br> **Это НЕ рестарт всего бота со сбросом всех данных.** | boolean | true
RESTART_TRADER_TIME         | Через сколько секунд перезапрашивать данные после сетевых ошибок <br>(FAQ п.31) | number | 5


### Остальные параметры

 Option | Description|Type | Default
--------|------------|-----|----------
TIME_ZONE                   | Временная зона [Database Time Zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | string | Asia/Yekaterinburg
EXCHANGE_FEE                | Комиссия на сделки биржи <br>(FAQ п.32) | number | 0.25
MINIMUM_ORDER_SIZE          | Минимально допустимый размер ордера при **IS_ORDER_CALCULATION_BTC** или **IS_ORDER_CALCULATION_CURRENCY** [Подробней тут.](middleware_exchange_api.md) | number | 0.001
DELAY_REQUEST_API           | Задержка при выполнении запросов к api<br> в миллисекундах<br>(FAQ п.31) | number | 200
DELAY_BETWEEN_MODULES       | Задержка в секундах между выполнением последовательных модулей (опрос баланса, истории, списка ордеров и т.д) <br>(FAQ п.31) | number | 3
TITLE                       | Заголовок окна консоли. (Работает не на всех системах). | string | GBot
LANGUAGE                    | Язык интерфейса (`ru` или `en`) | string | ru
NODE_ENV                    | Значение **production** включает:<br>  1. уведомления об ошибках на E-mail.<br> 2. запрещает использовать conf-dev.js.<br> 3. отключает колоризацию в логе. (+ флаг **--no-color**)<br> 4. отключает TITLE | string | dev
BOT_TRADE                   | Разрешить установку ордеров и торговлю | boolean | true
URL_STATISTICS              | URL адрес сервера куда будет отправлена статистика в формате post json <br>(FAQ п.46) | string | -
REPEAT_COMMAND_ACTION       | Будет несколько раз дублировать команду для установки/переоткрытия ордеров чтобы максимально полно выполнить команды /sell_all, /buy_all, stop_loss и т.д  | boolean | false
SAVE_STATE                  | Сохраняет внутреннее состояние в файл при завершении работы. При перезапуске восстанавливается из файла, игнорируя первую ступень инициализации и пропуская все стартовые расчеты | boolean | false
SAVE_STATE_PATH             | Путь куда сохранять SAVE_STATE | string | Директория с ботом
TIME_SESSION                | Время сессии. Формат startTime/endTime (FAQ п.63) | string | -
HIDE_SECRET_KEY             | Скрывает приватные ключи при передачи в web api | boolean | false

**Важно:**

* Если вы изменили LANGUAGE, отправте команду `/start` в telegram бота для инициализации нового языка в telegram.


### Параметры для DEMO модуля.

Для включения Demo модуля и эмуляции торгов установите параметр `EXCHANGE=demo`.

 Option | Description|Type | Default
--------|------------|-----|----------
DEMO_EXCHANGE       | Выбор биржи для эмуляции | string | -
BALANCE_COIN        | Виртуальный баланс первой монеты | number | -
BALANCE_COIN_TWO    | Виртуальный баланс второй монеты | number | -


### Сигналы
 Signal | Actions
--------|------------
SIGINT  | Shutdown process
SIGHUP  | Shutdown process
SIGTERM | Shutdown process
SIGUSR2 | Cycles Auto Exit = 1


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

SET DEPOSIT_LIMIT=80%%

... остальные параметры ...

cmd /K node ./build/server
```

**Важно!**

Параметры процентов для Windows задаются двойным знаком процента (%%)



### Для Linux или Mac
Создайте **start.sh** файл, укажите в нем необходимые параметры и запускайте этот файл.
```
#!/bin/sh
export TELEGRAM_TOKEN=110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw 
export TELEGRAM_ID=12345678

export DEPOSIT_LIMIT=80%

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
/params_no_comment  - Тоже что /params только без комментариев
/martin [cache]     - Теоретический расчет ордеров Мартингейла (параметры берутся из конфига). 
                      (cache - необязательный параметр, указывающий включить в расчет сетки 
                      данные ордеров из кэша истории)
/ticker coin_name   - Показывает котировку пары coin_name
/trade              - Переключает на указанную торговую пару
/stop [codeExit]    - Завершение работы приложения. codeExit - необязательный код выхода.
/sell_all           - Продать по рынку немедленно. (Внимание: Продажа будет без потверждения!)
/buy_all            - Купить по рынку немедленно. (Внимание: Покупка будет без потверждения!)
/restart            - Горячая перезагрузка GBot Trader
/stats              - Статистика торговли
/note [ignore text] - Текст в этой строке будет проигнорирован. Можно использовать как коментарий.
/stoplossfloating   - Отображает информацию о StopLossFloating (Плавающий StopLoss)
/stoploss           - Отображает информацию о StopLoss
/buystop            - Отображает информацию о BuyStop
/trail              - Отображает информацию о Trailing Stop
/trail_grid         - Отображает информацию о Trailing Grid
/getbalance         - Отображает стартовый баланс
/setbalance number  - Устанавливает стартовый баланс
/addbalance number  - Добавляет монет к стартовому балансу

```
#### Дебаг команды в Telegram:

```
DEBUGGER_ONE_ORDERS=true   - включает вывод дебаг информации для профит ордера (единоразово)
DEBUGGER_ORDERS=true       - включает вывод дебаг информации для ордеров из сетки (единоразово)
DEBUGGER_SYSTEM=true       - включает вывод дебаг информации о расчете баланса и другое. Значение true или 1 - вывод неприрывный, 2 - только при изменении. Для выключения false
```


### Payment
BTC: 1AMmeM2ERD6nd1K1y5Zta2BvfugHt5UjPo

LTC: LTSkBKFN6i1oy8pnBdpAR71xJTt9UU51sH