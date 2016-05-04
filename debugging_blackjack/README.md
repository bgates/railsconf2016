# Blackjack

This is a card game.

It uses a 52-card deck, shuffled into a random order.

A game involves one player who is a dealer, and one other player.

A game begins by dealing two cards from the deck to each player.

The cards dealt to a player constitute that player's hand.

The goal is to have a hand with a value of 21.
If a player's hand has a value over 21, that player loses.
If both players have a hand with value under 21, the higher value wins.

The value of a hand is determined by adding the face value of the numerical cards,
plus 10 for each face card (Jack, Queen, or King), plus either 1 or 11 for each Ace.
The value of the Ace is set to maximize the value of the player's hand.

The non-dealer player plays first. That player can ask for another card to increase the 
value of the player's hand. More cards can be requested, one at a time, until the player
either chooses to stop or the hand value exceeds 21.

After the player has stopped, the dealer plays. The dealer must take more cards until
the dealer hand value reaches 17.
