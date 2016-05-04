class Card
  attr_reader :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def value
    numeric_value || face_card_value || ace_value
  end

  def to_s
    "#{@value} of #{@suit.capitalize}"
  end

  def ace?
    @value == 'Ace'
  end
private

  def numeric_value
    @value if (2..10).include?(@value)
  end

  def face_card_value
    10 if %w(Jack Queen King).include?(@value)
  end

  def ace_value
    1 if @value == 'Ace'
  end
end
