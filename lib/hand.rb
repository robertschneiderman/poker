require 'byebug'

class Hand

  attr_accessor :cards
  attr_reader :tie_breakers

  STRENGTH_OF_HAND = [
    "straight flush",
    "four of a kind",
    "full house",
    "flush",
    "straight",
    "triple",
    "two pair",
    "pair",
    "no hand"
  ]

  def initialize(cards)
    @cards = cards
  end

  def best_hand
    sorted = get_hands.sort { |hand1, hand2| STRENGTH_OF_HAND.index(hand1) <=> STRENGTH_OF_HAND.index(hand2) }
    sorted.first
  end

  def tiebreaker
    card_values = find_values
    @tie_breakers = card_values.sort.sort {|b, c| card_values.count(b) <=> card_values.count(c) }
    if @tie_breakers == [2, 3, 4, 5, 14]
      @tie_breakers = [14 ,2, 3, 4, 5]
    end
    @tie_breakers
  end

  private

  def find_values
    @cards.map { |card| card.value }
  end

  def get_hands
    hands = []
    hands << parse_multiples
    hands << "flush" if all_the_same_suit?
    hands << "straight" if consecutive?
    hands << "straight flush" if all_the_same_suit? && consecutive?
    # debugger
    hands
  end

  def parse_multiples
    multiples = count_multiples
    case multiples.values.sort # [2, 2], [4], [3, 2], [2], [3]
    when [4]
      "four of a kind"
    when [2, 3]
      "full house"
    when [3]
      "triple"
    when [2, 2]
      "two pair"
    when [2]
      "pair"
    else
      "no hand"
    end
  end

  def count_multiples
    # debugger
    multiples_hash = Hash.new(0)

    card_values = find_values

    card_values.each do |card_value|
      times = card_values.count(card_value)
      multiples_hash[card_value] = times if times > 1
    end
    multiples_hash

  end

  def consecutive?
    sorted = cards.sort { |card1, card2| card1.value <=> card2.value }
    return true if sorted.map {|card| card.value} == [2,3,4,5,14]
    sorted.last.value - sorted.first.value == 4
  end

  def all_the_same_suit?
    @cards.all?{ |card| card.suit == @cards.first.suit }
  end

end
