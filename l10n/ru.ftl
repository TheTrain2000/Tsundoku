## General

page-title = 積ん読
category-general = Главная
page-shows = Отслеживаемые аниме
page-nyaa = Поиск на Nyaa
category-settings = Настройки
page-config = Конфигурация
logout-button = Выход
entry-status-downloading = Скачивается
entry-status-downloaded = Скачано
entry-status-renamed = Переименовано
entry-status-moved = Перемещено
entry-status-completed = Закончено
delete-confirm-text = Вы действительно хотите удалить <b> { $name } </b>?
delete-cancel = Нет, верни меня
-action-edit = Редактировать
-action-delete = Удалить

## Errors

no-rss-parsers = RSS-парсеры не установлены.
no-shows-found = Шоу не найдено, может ошибка с вашими парсерами?

## Index Page

shows-page-title = Показывает
shows-page-subtitle = Отслеживаемые шоу в RSS
status-current = В эфире
status-finished = Готово
status-unreleased = Не выпущено
status-upcoming = Предстоящие
empty-show-container = Здесь нечего смотреть!
empty-show-container-help = Начните с добавления шоу ниже.
click-for-more-shows =
    Нажмите, чтобы увидеть {{ $not_shown }} другие { $not_shown ->
        [one] предмет
       *[other] предметы
    }...
back-to-top-link = Вернуться к началу
add-show-button = Добавить шоу
add-modal-header = Добавить шоу
add-form-name-tt = Название заголовка, как оно отображается в RSS-ленте.
add-form-name-field = Имя
add-form-desired-format-tt = Желаемое имя файла после его переименования.
add-form-desired-format-field = Желаемый формат
add-form-season-tt = Значение, используемое для сезона сериала при переименовании.
add-form-season-field = Сезон
add-form-episode-offset-tt = Положительное или отрицательное значение, на которое можно изменить номер серии, отображаемый в RSS-канале.
add-form-episode-offset-field = Смещение эпизода
add-form-add-button = Добавить шоу
add-form-cancel-button = Отменить
delete-modal-header = Удалить Показать
edit-modal-header = Редактировать шоу
edit-clear-cache = Очистить кеш
edit-fix-match = Исправить совпадение
edit-kitsu-id = Показать идентификатор Kitsu.io
edit-tab-info = Информация
edit-tab-entries = Записи
edit-tab-webhooks = Веб-перехватчики
edit-entries-th-episode = Эпизод
edit-entries-form-episode = Эпизод
edit-entries-form-magnet = URL-адрес магнита
edit-entries-form-exists = Этот выпуск уже отслеживается.
edit-entries-form-add-button = Добавить запись
edit-webhooks-th-downloading = Скачивание
edit-webhooks-th-downloaded = Загружено
edit-webhooks-th-renamed = Переименовано
edit-webhooks-th-moved = Перемещено
edit-webhooks-th-completed = Завершено
edit-form-name-tt = Название заголовка в том виде, в котором оно отображается в RSS-ленте.
edit-form-name-field = Имя
edit-form-desired-format-tt = Желаемое имя файла после его переименования.
edit-form-desired-format-field = Желаемый формат
edit-form-desired-folder-tt = Папка для размещения готового файла.
edit-form-desired-folder-field = Желаемая папка
edit-form-season-tt = Значение, используемое для сезона сериала при переименовании.
edit-form-season-field = Сезон
edit-form-episode-offset-tt = Положительное или отрицательное значение, с помощью которого можно изменить номер эпизода, отображаемый в RSS-канале.
edit-form-episode-offset-field = Смещение эпизода
edit-form-cancel-button = Отменить

## Configuration Page


## Login Page

form-missing-data = Не введен логин или пароль.
invalid-credentials = Неверное имя пользователя или пароль.
username = Логин
password = Пароль
remember-me = Запомнить меня
login-button = Войти

## Register Page


## Logs Page


## Webhooks Page

webhooks-page-title = Webhook
webhooks-page-subtitle = Может использоваться вашими отслеживаемыми шоу
webhook-status-valid = 🟢 Подключено
webhook-status-invalid = 🔴 Ошибка подключения
webhook-edit-link = Редактировать
webhook-delete-link = Удалить
webhook-page-empty = Здесь нечего смотреть!
webhook-page-empty-subtitle = Начните с добавления Webhook'a ниже.
webhook-add-button = Добавить веб-перехватчик
add-webhook-modal-header = Добавить веб-перехватчик
add-webhook-form-name-tt = Имя Webhook, только для отображения.
add-webhook-form-name-field = Имя
add-webhook-form-name-placeholder = Мои Webhook
add-webhook-form-service-tt = Сервис, на который отправляется Webhook.
add-webhook-form-service-field = Сервис
add-webhook-form-url-tt = URL-адрес, на который отправляется Webhook.
add-webhook-form-url-field = URL-адрес
add-webhook-form-content-tt = Формат, в котором будет отправлено содержимое.
add-webhook-form-content-field = Формат содержимого
add-webhook-form-add-button = Добавить Webhook
add-webhook-form-cancel-button = Отменить
delete-webhook-modal-header = Удалить Webhook
delete-confirm-button = Удалить
edit-webhook-modal-header = Редактировать Webhook
edit-form-save-button = Сохранить изменения

## Nyaa Search Page

nyaa-page-title = Поиск Nyaa
nyaa-page-subtitle = Искать выпуски аниме
entry-add-success =
    Выпуск успешно добавлен! Обработка { $count } { $count ->
        [one] новой записи
       *[other] новых записей
    }.
search-empty-results = Здесь ничего нет!
search-start-searching = Начните поиск, чтобы увидеть результаты.
search-th-name = Имя
search-th-size = Размер
search-th-date = Дата
search-th-link = Ссылка на пост
search-item-link = Ссылка
modal-title = Добавить результат поиска
modal-tab-new = Новое шоу
modal-tab-existing = Добавить к существующим
existing-show-tt = Существующее шоу, в которое вы хотите добавить этот выпуск.
existing-show-field = Показать
name-tt = Название заголовка в том виде, в котором оно отображается в RSS-ленте.
name-field = Имя
name-placeholder = Имя
desired-format-tt = Желаемое имя файла после его переименования.
desired-format-field = Желаемый формат
desired-folder-tt = Папка для размещения завершенного файла.
desired-folder-field = Желаемая папка
season-tt = Значение, используемое для сезона сериала при переименовании.
season-field = Сезон
episode-offset-tt = Положительное или отрицательное значение, на которое можно изменить номер эпизода, отображаемый в RSS-канале.
episode-offset-field = Смещение эпизода
add-button = Добавить выпуск
cancel-button = Отменить
