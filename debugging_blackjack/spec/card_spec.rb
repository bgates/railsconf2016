require_relative './spec_helper'
require_relative '../lib/card'

describe Card do
  let(:card) { Card.new(5, :hearts) }

  it 'has a value' do
    card.value.must_equal 5
  end

  it 'has a suit' do
    card.suit.must_equal :hearts
  end

  it 'displays nicely' do
    "#{card}".must_equal "5 of Hearts"
  end
end
