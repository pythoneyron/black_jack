class Deck
  COUNT_CARDS = 52

  def initialize
  end

  def shuffle
    (1..COUNT_CARDS).to_a.shuffle
  end

  def cards(num_card)
    cards_sequence = {
      0 => { card: "\u{1F0A0}", value: 0 }, # рубашка
      1 => { card: "\u{1F0A1}", point: [1, 11] }, 2 => { card: "\u{1F0B1}", point: [1, 11] }, # туз
      3 => { card: "\u{1F0C1}", point: [1, 11] }, 4 => { card: "\u{1F0D1}", point: [1, 11] }, # туз
      5 => { card: "\u{1F0A2}", point: 2 }, 6 => { card: "\u{1F0B2}", point: 2 }, # 2
      7 => { card: "\u{1F0C2}", point: 2 }, 8 => { card: "\u{1F0D2}", point: 2 }, # 2
      9 => { card: "\u{1F0A3}", point: 3 }, 10 => { card: "\u{1F0B3}", point: 3 }, # 3
      11 => { card: "\u{1F0C3}", point: 3 }, 12 => { card: "\u{1F0D3}", point: 3 }, # 3
      13 => { card: "\u{1F0A4}", point: 4 }, 14 => { card: "\u{1F0B4}", point: 4 }, # 4
      15 => { card: "\u{1F0C4}", point: 4 }, 16 => { card: "\u{1F0D4}", point: 4 }, # 4
      17 => { card: "\u{1F0A5}", point: 5 }, 18 => { card: "\u{1F0B5}", point: 5 }, # 5
      19 => { card: "\u{1F0C5}", point: 5 }, 20 => { card: "\u{1F0D5}", point: 5 }, # 5
      21 => { card: "\u{1F0A6}", point: 6 }, 22 => { card: "\u{1F0B6}", point: 6 }, # 6
      23 => { card: "\u{1F0C6}", point: 6 }, 24 => { card: "\u{1F0D6}", point: 6 }, # 6
      25 => { card: "\u{1F0A7}", point: 7 }, 26 => { card: "\u{1F0B7}", point: 7 }, # 7
      27 => { card: "\u{1F0C7}", point: 7 }, 28 => { card: "\u{1F0D7}", point: 7 }, # 7
      29 => { card: "\u{1F0A8}", point: 8 }, 30 => { card: "\u{1F0B8}", point: 8 }, # 8
      31 => { card: "\u{1F0C8}", point: 8 }, 32 => { card: "\u{1F0D8}", point: 8 }, # 8
      33 => { card: "\u{1F0A9}", point: 9 }, 34 => { card: "\u{1F0B9}", point: 9 }, # 9
      35 => { card: "\u{1F0C9}", point: 9 }, 36 => { card: "\u{1F0D9}", point: 9 }, # 9
      37 => { card: "\u{1F0AA}", point: 10 }, 38 => { card: "\u{1F0BA}", point: 10 }, # 10
      39 => { card: "\u{1F0CA}", point: 10 }, 40 => { card: "\u{1F0DA}", point: 10 }, # 10
      41 => { card: "\u{1F0AB}", point: 10 }, 42 => { card: "\u{1F0BB}", point: 10 }, # валет
      43 => { card: "\u{1F0CB}", point: 10 }, 44 => { card: "\u{1F0DB}", point: 10 }, # валет
      45 => { card: "\u{1F0AD}", point: 10 }, 46 => { card: "\u{1F0BD}", point: 10 }, # дама
      47 => { card: "\u{1F0CD}", point: 10 }, 48 => { card: "\u{1F0DD}", point: 10 }, # дама
      49 => { card: "\u{1F0AE}", point: 10 }, 50 => { card: "\u{1F0BE}", point: 10 }, # король
      51 => { card: "\u{1F0CE}", point: 10 }, 52 => { card: "\u{1F0DE}", point: 10 }, # король
    }

    cards_sequence[num_card]
  end

  def one_random_card
    shuffle_arr = shuffle
    Enumerator::Lazy.new(shuffle_arr) do |yielder, val|
      yielder << cards(val)
    end
  end
end
