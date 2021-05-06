class Game
  START_MONEY = 100
  NAME_DEALER = 'Наглый крупье'

  @messages = {
    enter_your_name: 'Введите своё имя: ',
    continue_game: 'Для продолжения игры введите 1 или 0 что бы выйти: ',
    warning_continue_game: 'Любое введенное отличное значение от числа расценивается как выход из игры'
  }

  def start
    loop do
      print @messages[:enter_your_name]
      name_user = gets.chomp

      user = User.new(name_user)
      bank_user = Bank.new(START_MONEY)
      user.bank = bank_user
      # user.cards =

      dealer = Dealer.new(NAME_DEALER)
      bank_dealer = Bank.new(START_MONEY)
      dealer.bank = bank_dealer

      puts @messages[:warning_continue_game]
      print @messages[:continue_game]
      break if gets.chomp.to_i.zero?
    end
  end

end
