class Player
  POINT_LIMIT = 21

  attr_reader :name
  attr_accessor :bank, :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def show_cards
    res = ''
    cards.each { |card| res += "#{card[:card]} " }
    res
  end

  def count_points
    points = 0
    cards.each do |card|
      if card[:point].is_a?(Array)
        next points += card[:point].max if points <= 10

        points += card[:point].min if points > 10
      else
        points += card[:point]
      end
    end
    points
  end

  def show_back_cards
    res = ''
    cards.each { |_| res += "\u{1F0A0} " }
    res
  end
end
