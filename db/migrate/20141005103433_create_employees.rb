class CreateEmployees < ActiveRecord::Migration
  def up
    create_table :employees do |t|
      t.string :fio
      t.string :login
      t.string :password
      t.references :director, index: true
      t.boolean :fired

      t.timestamps
    end

    Employee.create([
      { fio: "Сумкин Федор", login: "f_sumkin", password: "srDYelDhhlc+nvTL", director_id: 39, fired: false },
      { fio: "Сноу Джон", login: "d_snou", password: "myWoJp5igKyPvJez", director_id: 19, fired: false },
      { fio: "Пулман Филипп", login: "f_pulman", password: "RBOGo5cVQoVDEp5u", director_id: 19, fired: false },
      { fio: "Уизли Перси", login: "p_uizli", password: "5dctV2sQY5N2El63", director_id: 21, fired: false },
      { fio: "Чан Джеки", login: "d_chan", password: "5dqdo4a4OiVmIwCY", director_id: 21, fired: true },
      { fio: "Черный Саша", login: "s_cherniy", password: "CK6546iHJHcZD7GK", director_id: 42, fired: false },
      { fio: "Старк Нед", login: "n_stark", password: "fpNnrnhDV99w18fy", director_id: nil, fired: false },
      { fio: "Тургулайнен Арсений", login: "a_turgulaynen", password: "+R7XzR4qEP7kedFP", director_id: 9, fired: false },
      { fio: "Незабудкин Максимилиан", login: "m_nezabudkin", password: "ilfYK8YCGQBBrjpT", director_id: 39, fired: false },
      { fio: "Федоров Игорь", login: "i_fedorov", password: "bpz7Jr4lIj4JTpCx", director_id: 9, fired: false },
      { fio: "Горбунков Семен", login: "s_gorbunkov", password: "2AheoH/TUEfJwBs8", director_id: 27, fired: false },
      { fio: "Горький Сергей", login: "s_gorkiy", password: "aNvzcFwKiS33zyGy", director_id: 27, fired: false },
      { fio: "Савенков Станислав", login: "s_savenkov", password: "lTTggpJYywlEEcaz", director_id: 27, fired: false },
      { fio: "Иноземцев Аркадий", login: "a_inozemtsev", password: "royOAeSDB6TY5WbF", director_id: 39, fired: false },
      { fio: "Голубев Дмитрий", login: "d_golubev", password: "LayxMxSpgkVbDxy+", director_id: 39, fired: false },
      { fio: "Байрон Один", login: "o_bayron", password: "U+pTjRCIm4xptPV5", director_id: 39, fired: false },
      { fio: "Паутинкин Константин", login: "k_pautinkin", password: "PKW2xSXMlDIGuaO7", director_id: 27, fired: false },
      { fio: "Красков Илья", login: "i_kraskov", password: "f9Rzxx65o2gHLlbs", director_id: 39, fired: false },
      { fio: "Карпов Андрей", login: "a_karpov", password: "TliL1PePM7PEFLdl", director_id: 21, fired: false },
      { fio: "Страхов Кирилл", login: "k_strakhov", password: "nkF5MORfS7I9R5J1", director_id: 9, fired: false },
      { fio: "Купер Шелдон", login: "sh_kuper", password: "KnV/LXibCFSPK3Jb", director_id: 7, fired: false },
      { fio: "Романенко Глеб", login: "g_romanenko", password: "39hakw/OAB27FyiJ", director_id: 9, fired: false },
      { fio: "Задунайская Гермиона", login: "g_zadunayskaya", password: "NnkZxnbYfALw7frW", director_id: 21, fired: true },
      { fio: "Покровская Ирина", login: "i_pokrovskaya", password: "pPN49h5wsRImZ7K7", director_id: 19, fired: false },
      { fio: "Фурсенко Татьяна", login: "t_fursenko", password: "v9BHP89Xl74Z8ECW", director_id: 21, fired: false },
      { fio: "Цветкова Симона", login: "s_tsvetkova", password: "azughV+748qGTLc0", director_id: 42, fired: false },
      { fio: "Подковырова Виктория", login: "v_podkovirova", password: "Yl3obaPz5JuL2c1m", director_id: 31, fired: false },
      { fio: "Ивлева Светлана", login: "s_ivleva", password: "W7cyHoiv06GXndon", director_id: 31, fired: false },
      { fio: "Толстая Аглая", login: "a_tolstaya", password: "jqv8Vd7YV4ec0Cpj", director_id: 19, fired: false },
      { fio: "Киселева Галина", login: "g_kiseleva", password: "OVwINkHDU8x1mDa6", director_id: 19, fired: false },
      { fio: "Светлая Дарья", login: "d_svetlaya", password: "JFibRoJgddQqJHyl", director_id: 7, fired: false },
      { fio: "Фирсова Оксана", login: "o_firsova", password: "N5vaNIRCjgmjN7VC", director_id: 27, fired: false },
      { fio: "Степфорд Сара", login: "s_stepford", password: "nqjYJoxt3cJzUbHt", director_id: 39, fired: false },
      { fio: "Зингер Эмма", login: "e_zinger", password: "9IT4psWSZK0D+I2i", director_id: 31, fired: true },
      { fio: "Арнова Ксения", login: "k_arnova", password: "fvJsK8LiEANF+rh5", director_id: 9, fired: false },
      { fio: "Синицына Глафира", login: "g_sinitsina", password: "DyrZojqRRZTBhR2x", director_id: 27, fired: false },
      { fio: "Львова Елена", login: "e_lvova", password: "B3evLFhpD0RX97L6", director_id: 42, fired: false },
      { fio: "Мамонтова Екатерина", login: "e_mamontova", password: "yISXJ7CAae8J36aU", director_id: 9, fired: false },
      { fio: "Рассветова Любовь", login: "l_rassvetova", password: "uKohOBZvt5Hp5TgG", director_id: 7, fired: false },
      { fio: "Шанц Тина", login: "t_shants", password: "UVXNXLaRGtLoNMB3", director_id: 31, fired: false },
      { fio: "Азимова Ольга", login: "o_azimova", password: "yLzFRVqtpkm5BiPi", director_id: 19, fired: false },
      { fio: "Брянцева Юлия", login: "yu_bryantseva", password: "LypDHebNqNpUIKqe", director_id: 31, fired: false },
      { fio: "Стулова Вера", login: "v_stulova", password: "VXNFB3He30SgBugO", director_id: 42, fired: false },
      { fio: "Сомова Наталья", login: "n_somova", password: "G6GXU5BgE/7WFO0r", director_id: 42, fired: false },
      { fio: "Перепелкина Прасковья", login: "p_perepelkina", password: "wt2DiOyaEMkyV/SM", director_id: 42, fired: false }
    ])

  end

  def down
    drop_table :employees
  end
end
