class Bank
  attr_accessor :money, :bets

  def initialize(money)
    @money = money
    @bets = {}
  end

  def bet(player, bet)
    @bets[player.__id__] = 0
    @bets[player.__id__] += bet

    player.bank.money -= bet
  end

  def transaction(value)
    @money += value.to_i
  end
end
