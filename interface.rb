class Interface
  SKIP = 1
  ADD_CARD = 2
  OPEN_CARDS = 3

  def self.messages(value)
    @messages[value]
  end

  @messages = {
    enter_your_name: 'Введите своё имя: ',
    continue_game: 'Для продолжения игры введите 1 или 0 что бы выйти: ',
    warning_continue_game: 'Любое введенное отличное значение от числа расценивается как выход из игры',

    your_cards: 'Ваши карты - ',
    count_cards: 'Количество баллов - ',
    back_cards: 'Карты дилера - ',

    select_option: 'Выбирите нужный вариант',
    skip: '1 - Пропустить',
    add_card: '2 - Добавить карту',
    open_card: '3 - Открыть карты',
    your_option: 'Ваш вариант: '
  }

  def enter_your_name
    print self.class.messages(:enter_your_name)
  end

  def continue_game
    puts self.class.messages(:warning_continue_game)
    print self.class.messages(:continue_game)
  end

  def cards_and_count(user)
    puts self.class.messages(:your_cards) + user.show_cards.to_s
    puts self.class.messages(:count_cards) + user.count_points.to_s
  end

  def back_cards(user)
    puts self.class.messages(:back_cards) + user.show_back_cards.to_s
  end

  def space
    puts "\n<------->\n\n"
  end

  def options
    puts self.class.messages(:select_option)
    puts self.class.messages(:skip)
    puts self.class.messages(:add_card)
    puts self.class.messages(:open_card)
    print self.class.messages(:your_option)
  end

end
