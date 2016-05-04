require_relative './hand'
require_relative './deck'

class CardGame
  attr_reader :current_hand

  def initialize(cards = nil)
    @deck = Deck.new(cards)
    @bets = {}
    @hands = []
  end

  def join(player, bet)
    @hands << Hand.new(player)
    @bets[player] = bet
  end

private

  def deal(n)
    n.times do
      @hands.each{|hand| hand.deal(next_card)}
    end
    @current_hand = @hands.first
  end

  def next_card
    @deck.deal
  end

  def over?
    @game_over
  end

end
