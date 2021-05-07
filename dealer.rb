class Dealer
  attr_reader :name
  attr_accessor :bank, :cards

  def initialize(name)
    @name = name
    @bank = ''
    @cards = []
  end

  def count_cards
    "\u{1F0A0}" * cards.each.count
  end
end
