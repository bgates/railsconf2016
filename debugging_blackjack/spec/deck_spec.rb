require_relative './spec_helper'
require_relative '../lib/deck'

describe Deck do
  let(:deck) { Deck.new }

  describe 'by default' do
    it 'has 52 cards' do
      deck.length.must_equal 52
    end

    it 'is in random order' do
      cards = []
      other_cards = []
      other_deck = Deck.new
      52.times{ cards << deck.deal; other_cards << other_deck.deal }
      cards.zip(other_cards).map{|pair| pair[0].to_s == pair[1].to_s}.uniq.wont_equal([true])
    end
  end
  describe 'deal' do
    it 'returns a card' do
      deck.deal.must_be_instance_of Card
    end

    it 'removes card from the deck' do
      card = deck.deal
      deck.wont_include card
    end
  end

end
