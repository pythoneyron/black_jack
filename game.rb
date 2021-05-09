class Game
  START_MONEY = 100
  BET = 10
  NAME_DEALER = 'Наглый крупье'

  def init_player_game(player, deck, central_bank)
    player.bank = Bank.new(START_MONEY)
    player.cards << deck.next # сразу выдаем нужные карты игроку, потом диллеру.
    player.cards << deck.next

    central_bank.bet_in_bank(player, BET)

    player
  end

  def skip

  end

  def start
    interface = Interface.new
    central_bank = Bank.new(0)

    interface.enter_your_name

    name_user = gets.chomp
    user = Player.new(name_user)
    dealer = Player.new(NAME_DEALER)

    loop do
      deck = Deck.new.one_random_card

      user = init_player_game(user, deck, central_bank)
      interface.cards_and_count(user)

      interface.space

      dealer = init_player_game(dealer, deck, central_bank)
      interface.back_cards(dealer)

      interface.space

      interface.options
      option = gets.chomp

      skip if Interface::SKIP == option.to_i

      interface.continue_game
      break if gets.chomp.to_i.zero?
    end
  end

end
