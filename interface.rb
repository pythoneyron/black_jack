class Interface
  SKIP = 1
  ADD_CARD = 2
  OPEN_CARDS = 3

  class << self
    def enter_your_name
      print 'Введите своё имя: '
    end

    def list(item)
      item.each { |k, v| puts "#{k} - #{v[:title]}" }
    end

    def continue_game
      puts 'Любое введенное отличное значение от числа расценивается как выход из игры'
      print 'Для продолжения игры введите 1 или 0 что бы выйти: '
    end

    def cards_and_count(user)
      puts "Карты у '#{user.name}' - #{user.show_cards}"
      puts "Количество баллов у '#{user.name}' - #{user.count_points}"
    end

    def repeat
      puts 'Если хотить сыграть еще раз, введите 1 или любое значение что бы выйти:'
      again = gets.chomp.to_i
      again == 1
    end

    def back_cards(user)
      puts "Карты у '#{user.name}' - #{user.show_back_cards}"
    end

    def space
      puts "<------->\n\n"
    end

    def action
      puts 'Введите действие : '
    end

    def skip
      puts 'Вы пропустили ход'
    end

    def you_lose
      puts 'Вы проиграли'
    end

    def win
      puts 'Вы выграли'
    end

    def draw
      puts 'Ничья'
    end

    def task(number)
      task = {
        1 => 'Пропустить',
        2 => 'Добавить карту',
        3 => 'Открыть карты'
      }
      task[number]
    end
  end
end
