require_relative './spec_helper'
require_relative '../lib/hand'
require_relative '../lib/card'

describe Hand do
  let(:hand) { Hand.new('player') }
  let(:five) { Card.new(5, :clubs) }
  let(:nine) { Card.new(9, :hearts) }
  let(:king) { Card.new('King', :clubs) }
  let(:ace) { Card.new('Ace', :diamonds) }
  let(:dealer) { Hand.new('Dealer') }

  it 'belongs to a player' do
    hand.owner.must_equal 'player'
  end

  it 'can be dealt cards' do
    assert hand.deal(five)
  end

  it 'can be displayed' do
    hand.deal(five)
    hand.deal(ace)
    "#{hand}".must_equal "player: 5 of Clubs, Ace of Diamonds"
  end

  describe 'dealer hand' do
    it 'shows only first card' do
      dealer.deal(five)
      dealer.deal(king)
      "#{dealer}".must_equal "Dealer shows 5 of Clubs"
    end
  end

  describe 'if all cards are numeric' do
    it 'has value equal to sum of card numeric values' do
      hand.deal(five)
      hand.deal(nine)
      hand.value.must_equal 14
    end
  end

  describe 'if hand includes a face card' do
    it 'has value equal to 10 plus sum of card numeric values' do
      hand.deal(king)
      hand.deal(five)
      hand.value.must_equal 15
    end
  end

  describe 'if hand has an ace' do
    let(:ace_hand) do
      hand.deal(ace)
      hand
    end

    describe 'other card values sum to less than 11' do
      it 'has value equal to 11 plus sum of card numeric values' do
        ace_hand.deal(nine)
        ace_hand.value.must_equal 20
      end

      it 'is blackjack if only other card is a face card' do
        ace_hand.deal(king)
        ace_hand.value.must_equal 21
        ace_hand.must_be :blackjack?
      end
    end

    describe 'other card values sum to 11 or more' do
      it 'has value equal to 1 plus sum of card numeric values' do
        ace_hand.deal(nine)
        ace_hand.deal(five)
        ace_hand.value.must_equal 15
      end
    end
  end

  describe 'if hand has two aces and other card values sum to less than 10' do
    it 'has value equal to 12 plus sum of card numeric values' do
      2.times { hand.deal(ace) }
      hand.deal(nine)
      hand.value.must_equal 21
    end
  end

  describe 'if value exceeds 21' do
    let(:busted_hand) do
      2.times { hand.deal(king) }
      hand.deal(five)
      hand
    end

    it 'is busted' do
      busted_hand.must_be :busted?
    end

    it 'loses to a non-busted hand' do
      2.times { dealer.deal(five) }
      dealer.must_be :>, busted_hand
      busted_hand.must_be :<, dealer
    end

    it 'pushes against another busted hand' do
      dealer.deal(king)
      dealer.deal(five)
      dealer.deal(king)
      dealer.must_be :==, busted_hand
    end
  end

  describe 'if value is under 21' do
    let(:hand_18) do
      2.times { dealer.deal(nine) }
      dealer
    end

    it 'beats hand with lower value' do
      hand.deal(five)
      hand.deal(nine)
      hand_18.must_be :>, hand
    end

    it 'loses to unbusted hand with higher value' do
      2.times { hand.deal(king) }
      hand_18.must_be :<, hand
    end
  end
end
