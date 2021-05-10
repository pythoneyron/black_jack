class Deck
  COUNT_CARDS = 52

  def initialize
  end

  def shuffle
    (1..COUNT_CARDS).to_a.shuffle
  end

  def cards(num_card)
    cards_sequence = { 0 => { card: "\u{1F0A0}", value: 0 } }
    points = [[1, 11], 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
    "123456789ABDE".each_char.with_index do |i, index|
      point = points.shift
      "ABCD".each_char.with_index(1) do |j, offset|
        cards_sequence[index * 4 + offset] = { card: ["1f0#{j}#{i}".hex].pack("U"), point: point }
      end
    end
    cards_sequence[num_card]
  end

  def one_random_card
    shuffle_arr = shuffle
    Enumerator::Lazy.new(shuffle_arr) do |yielder, val|
      yielder << cards(val)
    end
  end
end
