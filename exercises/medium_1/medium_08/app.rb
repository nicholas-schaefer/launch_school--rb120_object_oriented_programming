=begin

Highest and Lowest Ranking Cards
Update this class so you can use it to determine the lowest ranking and highest ranking cards in an Array of Card objects:

For this exercise, numeric cards are low cards, ordered from 2 through 10.
Jacks are higher than 10s, Queens are higher than Jacks, Kings are higher than Queens, and Aces are higher than Kings.
The suit plays no part in the relative ranking of cards.

If you have two or more cards of the same rank in your list, your min and max methods should return one of the matching cards;
it doesn't matter which one.

Besides any methods needed to determine the lowest and highest cards,
create a #to_s method that returns a String representation of the card, e.g., "Jack of Diamonds", "4 of Clubs", etc.

Examples:
=end

class Trading_Card
  RANGE = (1..10)
  def initialize
    @value = generate_random_number
  end

  def generate_random_number
    rand RANGE
  end

  def < other_card
    value < other_card.value
  end

  def > other_card
    value > other_card.value
  end

  def <=> other_card
    value <=> other_card.value
  end

  def == other_card
    value == other_card.value
  end

  protected
  attr_reader :value

end

def app_test
  card1 = Trading_Card.new
  card2 = Trading_Card.new

  # p card1
  # p card1
  # p card2
  p card1
  p card2
  p card1 < card2
  p card1 > card2
  p card1 == card2
  p card1 <=> card2
  p "-------------"
  cards = [card1, card2]
  p cards.sort
  # puts card1 > card2
end
# app_test()


class Card
  CARD_VALUE = {
    2       => 2,
    3       => 3,
    4       => 4,
    5       => 5,
    6       => 6,
    7       => 7,
    8       => 8,
    9       => 9,
    10      => 10,
    "Jack"  => 11,
    "Queen" => 12,
    "King"  => 13,
    "Ace"   => 14
  }.freeze

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank   = rank
    @suit   = suit
    @value  = CARD_VALUE[rank]
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=> other_card
    value <=> other_card.value
  end

  def == other_card
    value == other_card.value
  end

  protected
  attr_reader :value

end

def app
  cards =   [ Card.new(2, 'Hearts'),
              Card.new(10, 'Diamonds'),
              Card.new('Ace', 'Clubs')]
  puts cards
  puts cards.min == Card.new(2, 'Hearts')
  puts cards.max == Card.new('Ace', 'Clubs')

  cards = [Card.new(5, 'Hearts')]
  puts cards.min == Card.new(5, 'Hearts')
  puts cards.max == Card.new(5, 'Hearts')

  cards = [Card.new(4, 'Hearts'),
          Card.new(4, 'Diamonds'),
          Card.new(10, 'Clubs')]
  puts cards.min.rank == 4
  puts cards.max == Card.new(10, 'Clubs')

  cards = [Card.new(7, 'Diamonds'),
          Card.new('Jack', 'Diamonds'),
          Card.new('Jack', 'Spades')]
  puts cards.min == Card.new(7, 'Diamonds')
  puts cards.max.rank == 'Jack'

  cards = [Card.new(8, 'Diamonds'),
          Card.new(8, 'Clubs'),
          Card.new(8, 'Spades')]
  puts cards.min.rank == 8
  puts cards.max.rank == 8
end

app()

expected_output = <<~EOT
  2 of Hearts
  10 of Diamonds
  Ace of Clubs
  true
  true
  true
  true
  true
  true
  true
  true
  true
  true
EOT
