class User
  attr_reader :name
  attr_accessor :bank, :cards

  def initialize(name)
    @name = name
    @bank = ''
    @cards = []
  end

  def show_cards
    cards
  end
end
