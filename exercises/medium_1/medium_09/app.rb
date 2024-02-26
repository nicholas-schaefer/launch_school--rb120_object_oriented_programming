=begin

The Deck class should provide a #draw method to deal one card.
The Deck should be shuffled when it is initialized and, if it runs out of cards, it should reset itself by generating a new set of 52 shuffled cards.
Examples:
=end

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

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :state

  def initialize
    @state
    reset_and_shuffle!()
  end

  def draw
    next_card = state.shift
    reset_and_shuffle!() if state.count == 0
    next_card
  end

  private
  attr_writer :state

  def reset_and_shuffle!
    @state = create.shuffle
  end

  def create
    RANKS.map do |rank|
      SUITS.map do |suit|
        Card.new(rank, suit)
      end
    end.flatten
  end


  # private
  # attr_writer :deck


end

def app2
  deck = Deck.new
  # p deck
  # p deck.state
  # p deck.state.count
  # p deck.draw
  # p deck.state.count
  drawn = []
  52.times { drawn << deck.draw }
  p drawn.count { |card| card.rank == 5 } == 4
  p drawn.count { |card| card.suit == 'Hearts' } == 13

  drawn2 = []
  52.times { drawn2 << deck.draw }
  p drawn != drawn2 # Almost always.
end
app2()

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

# app()

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
