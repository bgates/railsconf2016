require_relative './card'
require 'forwardable'

class Deck
  extend Forwardable
  def_delegators :@cards, :length, :shuffle!, :include?
  #TODO: remove :shuffle! from list

  def initialize(cards = nil)
    @cards = cards || []
    add_cards if @cards.empty?
  end

  def deal
    @cards.shift
  end

private
  def add_cards
    [ :clubs, :diamonds, :hearts, :spades ].each do |suit|
      add_number_cards(suit)
      add_face_cards(suit)
    end
    shuffle!
  end

  def add_number_cards(suit)
    (2..10).each do |value|
      @cards << Card.new(value, suit)
    end
  end

  def add_face_cards(suit)
    %w(Jack Queen King Ace).each do |face|
      @cards << Card.new(face, suit)
    end
  end
end
