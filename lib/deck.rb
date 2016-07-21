class Deck
  attr_reader :cards

  def initialize
    @cards = Deck.make_deck
  end

  def self.make_deck
    values = (2..14).to_a
    suits = %w{clubs spades diamonds hearts}
    card_details = values.product(suits)
    card_details.map do |info|
      Card.new( info[1], info[0] )
    end
  end

  def shuffle!
    @cards.shuffle!
  end

  def deal(n)
    @cards.pop(n)
  end

end
