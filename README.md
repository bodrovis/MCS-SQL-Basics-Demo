# Курс "Основы SQL" (Moscow Coding School)

Данное приложение демонстрирует практическое использование запросов SQL в web-приложениях. Обратите внимание, что программный код значительно упрощён и использование его в реальных проектах не рекомендуется! 

Примеры запросов можно увидеть [здесь](https://github.com/bodrovis/MCS-SQL-Basics-Demo/blob/master/app/controllers/users_controller.rb).

## Запуск приложения локально

### Необходимый софт

Система контроля версий Git:

* [https://git-scm.com/downloads](https://git-scm.com/downloads) - есть для всех ОС

[Интерпретатор Ruby](https://www.ruby-lang.org/en/downloads/) не ниже, чем версия 2.5:

* На Linux и Mac выполняются команды в терминале:
  + `sudo xcode-select --install` - для MacOS, если Xcode ещё не установлен (если он установлен, то команда об этом сообщит)
  + `gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`
  + Если на MacOS возвращается ошибка вида `gpg command not found`, то нужно установить gpg: `brew install gnupg gnupg2`
  + `curl -sSL https://get.rvm.io | bash` - установит RVM
  + `curl -sSL https://get.rvm.io | bash -s stable --ruby` - установит свежую версию Ruby
  + После чего `ruby -v` должно вернуть текущую версию Ruby. Подробности можно найти [на сайте RVM](https://rvm.io/rvm/install).
* На Windows:
  + [Скачать Ruby+DevKit](https://rubyinstaller.org/downloads/) (рекомендуемая версия выделена полужирным текстом)
  + Запустить установщик и следовать инструкциям
  + После установки обязательно выбрать опцию "Run MSYS2"
  + В появившемся окне по очереди выбрать каждую опцию (1, 2 и 3)
  + Перезапустить терминал
  + После чего `ruby -v` должно вернуть текущую версию Ruby
  
### Непосредственный запуск

* Открыть терминал
* `git clone https://github.com/bodrovis/MCS-SQL-Basics-Demo.git` (скачиваем себе код приложения)
* `cd MCS-SQL-Basics-Demo` (переходим в директорию приложения)
* `bundle install` (устанавливаем зависимости). Если данная команда не проходит, запустите:
  + `gem update --system`
  + `gem install bundler`
  + Попробуйте запустить `bundle install` ещё раз
* Открываем файл `config/database.yml` в любом текстовом редакторе и [указываем имя базы данных, имя пользователя и пароль для подключения к MySQL](https://github.com/bodrovis/MCS-SQL-Basics-Demo/blob/master/config/database.yml#L9) (опции `database`, `username` и `password` соответственно)
* Сервер MySQL должен быть запущен, а выбранная база данных должна быть пустой (не забудьте её создать!), иначе возможны конфликты между создаваемыми и существующими таблицами
* `rails db:migrate` (создаются нужные таблицы)
* `rails s` (запускается сервер)
* В браузере перейдите по адресу `http://localhost:3000`
* Вы должны увидеть web-приложение

(c) 2019 [Moscow Coding School](https://moscoding.ru), [Ilya Bodrov-Krukowski](http://bodrovis.tech/)