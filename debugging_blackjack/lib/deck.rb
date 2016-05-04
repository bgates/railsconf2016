require_relative './card'
require 'forwardable'

class Deck
  extend Forwardable
  def_delegators :@cards, :length, :shuffle!, :include?
  #TODO: remove :shuffle! from list

  def initialize(cards = nil)
    @cards = cards || add_cards
  end

  def deal
    @cards.shift
  end

private
  def add_cards
    [ :clubs, :diamonds, :hearts, :spades ].each do |suit|
      (1..14).each do |n|
        value = case n
                when 11
                  "Jack"
                when 12
                  "Queen"
                when 13
                  "King"
                when 14
                  "Ace"
                else
                  n
                end
        Card.new(value, suit)
      end
    end
    shuffle!
  end

end
