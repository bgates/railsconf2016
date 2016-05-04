require_relative './card_game'
require_relative './output'

class Blackjack < CardGame

  def initialize(cards = nil)
    @dealer_hand = Hand.new('Dealer')
    super
  end

  def start
    @hands << @dealer_hand
    deal(2)
    check_for_blackjack
    play unless over?
  end

  def stay
    last_hand = player_name
    next_hand
    puts "#{last_hand} stays. #{current_hand}'s turn:"
    dealer_take_action
  end

  def hit
    _hit(current_hand)
  end
private

  def play
    puts "Game over" and return if over?
    Output.show_game(@hands)
    take_turn
  end

  def take_turn
    if player_turn?
      Output.request_player_action(player_name)
    else
      dealer_take_action
    end
  end

  def _hit(hand)
    hand.deal(next_card)
    check_for_bust(hand)
    play
  end

  def player_turn?
    @turn != @dealer_hand
  end

  def next_hand
    @current_hand = @hands[@hands.index(current_hand) + 1]
  end

  def player_name
    current_hand.owner
  end

  def check_for_blackjack
    if @hands.any?{|hand| hand.blackjack? }
      handle_initial_blackjack(current_hand)
      @game_over = true
    end
  end

  def handle_initial_blackjack(hand)
    if @dealer_hand.blackjack?
      Output.blackjack_push(hand, hand.owner, @dealer_hand)
    else
      Output.blackjack_for(hand, hand.owner)
    end
  end

  def check_for_bust(hand)
    if @game_over = hand.bust?
      puts "#{hand.owner} bust!"
    end
  end
end
