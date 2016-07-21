require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  it 'has an array of cards' do
    expect(deck.cards).to be_an(Array)
  end

  it "has count of 52" do
    expect(deck.cards.count).to eq(52)
  end

  describe '#shuffle!' do

    it "shuffles the deck" do
      original_deck = deck.cards.dup
      deck.shuffle!
      expect(deck.cards).not_to eq(original_deck)
    end

  end

  describe '#deal' do

    let(:dealt_cards) { deck.deal(5) }

    it "should decrease the amount of cards in the deck" do
      dealt_cards
      expect(deck.cards.count).to eq(47)
    end

    it "should return an array of cards" do
      expect(dealt_cards).to be_an(Array)
    end

    it "should return correct number of cards" do
      expect(dealt_cards.count).to eq(5)
    end

  end

end
