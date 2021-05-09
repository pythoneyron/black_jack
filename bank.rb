class Bank
  attr_accessor :money, :bets

  def initialize(money)
    @money = money
    @bets = {}
  end

  def bet_in_bank(player, bet)
    @bets[player.__id__] = 0
    @bets[player.__id__] += bet

    player.bank.money -= bet
  end
end
