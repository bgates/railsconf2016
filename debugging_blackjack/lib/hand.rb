class Hand
  attr_reader :owner
  include Comparable

  def <=>(other)
    clear_winner_vs(other) || value_vs(other)
  end

  def initialize(owner)
    @owner = owner
    @contents = []
  end

  def deal(card)
    @contents << card
  end

  def value
    base_value + ace_adjustment
  end

  def busted?
    value > 21
  end

  def blackjack?
    value == 21 && @contents.size == 2
  end

  def to_s
    if owner == 'Dealer'
      "Dealer shows #{@contents.first}"
    else
      reveal
    end
  end

  def reveal
    "#{owner}: #{@contents.map(&:to_s).join(', ')}"
  end

private

  def base_value
    @base_value ||= @contents.inject(0) do |sum, card|
      sum + card.value
    end
  end

  def ace_adjustment
    value_needs_adjustment?? 10 : 0
  end

  def value_needs_adjustment?
    base_value < 12 && has_aces?
  end

  def has_aces?
    @contents.any?(&:ace?)
  end

  def clear_winner_vs(other)
    if busted?
      push_or_lose_to(other)
    elsif other.busted?
      1
    end
  end

  def push_or_lose_to(other)
    other.busted?? 0 : -1
  end

  def value_vs(other)
    value <=> other.value
  end
end
