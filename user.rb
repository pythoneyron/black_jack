class User
  attr_reader :name
  attr_accessor :bank, :cards

  def initialize(name)
    @name = name
    @bank = bank
    @cards = cards
  end
end
