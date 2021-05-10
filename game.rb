class Game
  START_MONEY = 100
  BET = 10
  MAX_POINTS = 21
  NAME_DEALER = 'Наглый крупье'.freeze

  PLAYER = 'player'.freeze
  DEALER = 'dealer'.freeze

  attr_reader :user, :dealer, :deck, :bank

  def initialize
    @command_list = {
      1 => { title: Interface.task(1), command: proc { Interface.say(:skip) } },
      2 => { title: Interface.task(2), command: proc { |i| add_card i } },
      3 => { title: Interface.task(3), command: proc { Interface.say(:open_cards) } }
    }
  end

  def init_player_game(player, deck, bank)
    player.cards = [] unless player.cards.empty?
    player.cards << deck.next # сразу выдаем нужные карты игроку, потом диллеру.
    player.cards << deck.next

    bank.bet(player, BET)

    player
  end

  def dealer_action
    if dealer.count_points >= 17
      pass
    else
      add_card dealer
    end
  end

  def user_actions
    show_tasks
    option = gets.chomp.to_i
    @command_list[option][:command].call(user)
    option
  end

  def show_tasks
    Interface.say(:action)
    Interface.list @command_list
  end

  def pass
    true
  end

  def start
    bank = Bank.new(0)

    Interface.enter_your_name

    name_user = gets.chomp
    user = Player.new(name_user, PLAYER)
    user.bank = Bank.new(START_MONEY)

    dealer = Player.new(NAME_DEALER, DEALER)
    dealer.bank = Bank.new(START_MONEY)

    loop do
      @deck = Deck.new.one_random_card

      @user = init_player_game(user, deck, bank)
      Interface.cards_and_count(user)

      Interface.say(:space)

      @dealer = init_player_game(dealer, deck, bank)
      Interface.back_cards(dealer)

      Interface.say(:space)

      loop do
        break if user.cards.length == 3 && dealer.cards.length == 3
        break if user_actions == 3

        dealer_action
      end

      calculate_result
      break unless Interface.repeat
    end
  end

  def add_card(player)
    if player.cards.length < 3
      card = deck.next
      player.cards << card if player.cards.length < 3
      Interface.added_card(card[:card]) if player.type == PLAYER
    else
      Interface.say(:impossible_add)
    end
  end

  def open_cards
    Interface.cards_and_count user
    Interface.say(:space)
    Interface.cards_and_count dealer
    [user.count_points, dealer.count_points]
  end

  def calculate_result
    user_count, dealer_count = open_cards
    if user_count > MAX_POINTS
      Interface.say(:you_lose)
      dealer.bank.transaction(20)
    elsif user_count == dealer_count
      Interface.say(:draw)
      user.bank.transaction(10)
      dealer.bank.transaction(10)
    elsif (user_count > dealer_count) || (dealer_count > MAX_POINTS)
      Interface.say(:win)
      user.bank.transaction(20)
    else
      Interface.say(:you_lose)
      dealer.bank.transaction(20)
    end
    Interface.balance(user)
  end

end
