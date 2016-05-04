module Output

  def self.show_game(hands)
    hands.each{|hand| puts hand }
  end

  def self.blackjack_push(hand, player, dealer_hand)
    puts hand
    puts dealer_hand.reveal
    puts "Dealer and #{player} both have blackjack - push!"
  end

  def self.blackjack_for(hand, player)
    puts hand
    puts "Blackjack! #{player} wins!"
  end

  def self.request_player_action(player)
    puts "#{player}'s turn. Would you like to hit or stay?"
  end
end
