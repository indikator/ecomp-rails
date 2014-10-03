
# language: ru

Функция: Вход на сайт
  Описываются возможные варианты событий, когда пользователь заходит на сайт,
  например, как гость, простой пользователь, администратор. Проверка роли пользователя
  проводится в другой Функции.
  
  Контекст:
    Допустим я вошел на сайт
  
  Сценарий: Вход как гость
    Если я до этого никогда на этом сайте не был
    То я вижу пустую страничку
    И меню навигации со ссылкой на сайт и кнопкой "Войти"
    
  Сценарий: Редкий вход
    Если я не заходил на этот сайт больше недели
    То я вижу пустую страничку
    И меню навигации со ссылкой на сайт и кнопкой "Войти"

  Сценарий: Вход и последующий выход
    Если я входил на сайт менее недели назад
    И нажал кнопку "Выход"
    То я вижу пустую страничку
    И меню навигации со ссылкой на сайт и кнопкой "Войти"
    
  Сценарий: Вход как обычный пользователь
    Если я менее чем неделю назад заходил на этот сайт как обычный пользователь
    И не нажал кнопку "Выход"
    То меня перенаправляет на страницу "http://0.0.0.0:3000/competences"
    И я вижу страницу с развернутыми группами компетенций
    И меню навигации со ссылкой на сайт,
    И ссылками "Сотрудники", "Проекты", "Компетенции", "Обучение",
    И где ссылка "Компетенции" активна
    И красной кнопкой "Выйти"
    
  Сценарий: Вход как администратор системы
    Если я менее чем неделю назад заходил на этот сайт как администратор
    И не нажал кнопку "Выход"
    То я вижу страницу с развернутыми группами компетенций
    И меню навигации со ссылкой на сайт,
    И ссылками "Сотрудники", "Проекты", "Компетенции", "Обучение", "Администрирование", "Лог",
    И где ссылка "Сотрудники" активна,
    И красной кнопкой "Выйти"
