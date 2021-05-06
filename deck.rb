class Deck
  COUNT_CARDS = 52

  def initialize
  end

  def shuffle
    random_array = []

    loop do
      rand_num = Random.rand(1..COUNT_CARDS)
      random_array << rand_num unless random_array.include?(rand_num)
      break if random_array.length == COUNT_CARDS
    end

    random_array
  end

  def cards
    cards = {
      0 => { card: "\u{1F0A0}", value: 0 }, # рубашка
      1 => { card: "\u{1F0A1}", value: [1, 11] }, 2 => { card: "\u{1F0B1}", value: [1, 11] }, # туз
      3 => { card: "\u{1F0C1}", value: [1, 11] }, 4 => { card: "\u{1F0D1}", value: [1, 11] }, # туз
      5 => { card: "\u{1F0A2}", value: 2 }, 6 => { card: "\u{1F0B2}", value: 2 }, # 2
      7 => { card: "\u{1F0C2}", value: 2 }, 8 => { card: "\u{1F0D2}", value: 2 }, # 2
      9 => { card: "\u{1F0A3}", value: 3 }, 10 => { card: "\u{1F0B3}", value: 3 }, # 3
      11 => { card: "\u{1F0C3}", value: 3 }, 12 => { card: "\u{1F0D3}", value: 3 }, # 3
      13 => { card: "\u{1F0A4}", value: 4 }, 14 => { card: "\u{1F0B4}", value: 4 }, # 4
      15 => { card: "\u{1F0C4}", value: 4 }, 16 => { card: "\u{1F0D4}", value: 4 }, # 4
      17 => { card: "\u{1F0A5}", value: 5 }, 18 => { card: "\u{1F0B5}", value: 5 }, # 5
      19 => { card: "\u{1F0C5}", value: 5 }, 20 => { card: "\u{1F0D5}", value: 5 }, # 5
      21 => { card: "\u{1F0A6}", value: 6 }, 22 => { card: "\u{1F0B6}", value: 6 }, # 6
      23 => { card: "\u{1F0C6}", value: 6 }, 24 => { card: "\u{1F0D6}", value: 6 }, # 6
      25 => { card: "\u{1F0A7}", value: 7 }, 26 => { card: "\u{1F0B7}", value: 7 }, # 7
      27 => { card: "\u{1F0C7}", value: 7 }, 28 => { card: "\u{1F0D7}", value: 7 }, # 7
      29 => { card: "\u{1F0A8}", value: 8 }, 30 => { card: "\u{1F0B8}", value: 8 }, # 8
      31 => { card: "\u{1F0C8}", value: 8 }, 32 => { card: "\u{1F0D8}", value: 8 }, # 8
      33 => { card: "\u{1F0A9}", value: 9 }, 34 => { card: "\u{1F0B9}", value: 9 }, # 9
      35 => { card: "\u{1F0C9}", value: 9 }, 36 => { card: "\u{1F0D9}", value: 9 }, # 9
      37 => { card: "\u{1F0AA}", value: 10 }, 38 => { card: "\u{1F0BA}", value: 10 }, # 10
      39 => { card: "\u{1F0CA}", value: 10 }, 40 => { card: "\u{1F0DA}", value: 10 }, # 10
      41 => { card: "\u{1F0AB}", value: 10 }, 42 => { card: "\u{1F0BB}", value: 10 }, # валет
      43 => { card: "\u{1F0CB}", value: 10 }, 44 => { card: "\u{1F0DB}", value: 10 }, # валет
      45 => { card: "\u{1F0AD}", value: 10 }, 46 => { card: "\u{1F0BD}", value: 10 }, # дама
      47 => { card: "\u{1F0CD}", value: 10 }, 48 => { card: "\u{1F0DD}", value: 10 }, # дама
      49 => { card: "\u{1F0AE}", value: 10 }, 50 => { card: "\u{1F0BE}", value: 10 }, # король
      51 => { card: "\u{1F0CE}", value: 10 }, 52 => { card: "\u{1F0DE}", value: 10 }, # король
    }
  end
end

pack = Deck.new
puts pack.shuffle



