require 'rspec'
require 'hand'
require 'card'

describe Hand do
  no_hand_cards = [
    Card.new(:hearts, 4),
    Card.new(:spades, 7),
    Card.new(:spades, 9),
    Card.new(:diamonds, 11),
    Card.new(:clubs, 8)
  ]

  subject(:no_hand) { Hand.new(no_hand_cards) }

  it "should have 5 cards" do
    expect(no_hand.cards.count).to eq(5)
  end

  it "should have the cards that are passed" do
    expect(no_hand.cards).to match_array(no_hand_cards)
  end

  describe "#best_hand" do

    it "finds that we have no hand" do
      expect(no_hand.best_hand).to eq("no hand")
      expect(no_hand.tiebreaker).to eq([4,7,8,9,11])
    end

    pair_cards = [
      Card.new(:hearts, 4),
      Card.new(:spades, 7),
      Card.new(:spades, 9),
      Card.new(:diamonds, 9),
      Card.new(:clubs, 8)
    ]
    let(:pair) {Hand.new (pair_cards)}

    it "finds that we have a pair" do
      expect(pair.best_hand).to eq("pair")
      expect(pair.tiebreaker).to eq([4,7,8,9,9])
    end

    two_pair_cards = [
      Card.new(:hearts, 7),
      Card.new(:spades, 7),
      Card.new(:spades, 9),
      Card.new(:diamonds, 9),
      Card.new(:clubs, 8)
    ]
    let(:two_pair) {Hand.new (two_pair_cards)}

    it "finds that we have two pair" do
      expect(two_pair.best_hand).to eq("two pair")
      expect(two_pair.tiebreaker).to eq([8,7,7,9,9])
    end

    triple_cards = [
      Card.new(:hearts, 7),
      Card.new(:spades, 9),
      Card.new(:spades, 7),
      Card.new(:diamonds, 7),
      Card.new(:clubs, 8)
    ]
    let(:triple) {Hand.new( triple_cards )}

    it "finds that we have a triple" do
      expect(triple.best_hand).to eq("triple")
      expect(triple.tiebreaker).to eq([8,9,7,7,7])
    end

    straight_cards = [
      Card.new(:hearts, 4),
      Card.new(:spades, 5),
      Card.new(:spades, 6),
      Card.new(:diamonds, 7),
      Card.new(:clubs, 8)
    ]
    let(:straight) {Hand.new ( straight_cards )}

    it "finds if we have a straight" do
      expect(straight.best_hand).to eq("straight")
      expect(straight.tiebreaker).to eq([4,5,6,7,8])
    end

    straight_cards2 = [
      Card.new(:hearts, 4),
      Card.new(:spades, 14),
      Card.new(:spades, 2),
      Card.new(:diamonds, 3),
      Card.new(:clubs, 5)
    ]
    let(:straight2) {Hand.new ( straight_cards2 )}

    it "finds if we have a straight with ace as 1" do
      expect(straight2.best_hand).to eq("straight")
      expect(straight2.tiebreaker).to eq([14,2,3,4,5])
    end


    flush_cards = [
      Card.new(:spades, 13),
      Card.new(:spades, 7),
      Card.new(:spades, 9),
      Card.new(:spades, 3),
      Card.new(:spades, 8)
    ]
    let(:flush) {Hand.new(flush_cards)}
    it "finds if we have a flush" do
      expect(flush.best_hand).to eq("flush")
      expect(flush.tiebreaker).to eq([3,7,8,9,13])

    end

    full_house_cards = [
      Card.new(:spades, 13),
      Card.new(:diamonds, 13),
      Card.new(:spades, 9),
      Card.new(:hearts, 9),
      Card.new(:clubs, 9)
    ]
    let(:full_house) {Hand.new(full_house_cards)}

    it "finds the full house from your cards" do
      expect(full_house.best_hand).to eq("full house")
      expect(full_house.tiebreaker).to eq([13,13,9,9,9])
    end

    four_ofa_kind_cards = [
      Card.new(:spades, 13),
      Card.new(:hearts, 9),
      Card.new(:diamonds, 9),
      Card.new(:spades, 9),
      Card.new(:clubs, 9)
    ]
    let(:four_ofa_kind) {Hand.new(four_ofa_kind_cards)}

    it "finds four of a kind from your cards" do
      expect(four_ofa_kind.best_hand).to eq("four of a kind")
      expect(four_ofa_kind.tiebreaker).to eq([13,9,9,9,9])
    end

    straight_flush_cards = [
      Card.new(:spades, 7),
      Card.new(:spades, 6),
      Card.new(:spades, 5),
      Card.new(:spades, 4),
      Card.new(:spades, 3)
    ]
    let(:straight_flush) {Hand.new(straight_flush_cards)}

    it "finds straight flush from your cards" do
      expect(straight_flush.best_hand).to eq("straight flush")
      expect(straight_flush.tiebreaker).to eq([3,4,5,6,7])
    end

  end

end


# hand_strength {
#   'straight flush' =>
# }
#
# pairs {
#   3 => 1
# }
#
# pairs {
#   2 => 2
# }
#
# pairs {
#   3 => 1
#   2 => 1
# }
#
# check cons
# check suit
# count multiples
