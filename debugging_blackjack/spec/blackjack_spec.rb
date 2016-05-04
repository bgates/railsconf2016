require_relative './spec_helper'
require_relative '../lib/blackjack'

describe Blackjack do
  let(:game) do
    _game = Blackjack.new
    _game.join('player', 100)
    _game
  end
  let(:ace) { Card.new('Ace', :clubs) }
  let(:king) { Card.new('King', :hearts) }
  let(:six) { Card.new(6, :clubs) }
  let(:four) { Card.new(4, :spades) }

  let(:blackjack_game) do
    _game = Blackjack.new([ace, six, king, four])
    _game.join('player', 100)
    _game
  end

  describe 'start' do
    it "is player's turn" do
      Proc.new{game.start}.must_output(/player's turn/)
    end
  end

  it 'gives player immediate victory with blackjack' do
    Proc.new{blackjack_game.start}.must_output(/wins!/)
  end
end
