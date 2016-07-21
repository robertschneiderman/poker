require 'rspec'
require 'card'

describe Card do
  subject(:card) {Card.new(:hearts, 3)}

  it 'has a value' do
    expect(card.value).to eq(3)
  end


  it 'has a suit' do
    expect(card.suit).to eq(:hearts)
  end

end
