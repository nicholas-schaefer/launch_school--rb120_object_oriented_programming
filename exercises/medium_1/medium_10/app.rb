=begin

In the previous two exercises, you developed a Card class and a Deck class.
You are now going to use those classes to create and evaluate poker hands.

Create a class, PokerHand, that takes 5 cards from a Deck of Cards and evaluates those cards as a Poker hand.
If you've never played poker before, you may find this overview of poker hands useful.


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

  attr_reader :rank, :suit, :value

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

# Include Card and Deck classes from the last two exercises.

class PokerHand
  def initialize(dealt_5_cards)
    @dealt_5_cards = dealt_5_cards
    # @state = []
  end

  # def reset
  #   @state = cards_array
  # end

  def print
    puts @dealt_5_cards
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private
  attr_reader :dealt_5_cards

  def royal_flush?
    straight_flush? &&
      dealt_5_cards.map(&:value).sort == (10..14).to_a
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    dealt_5_cards.map(&:value).tally.values.sort == [1,4]
  end

  def full_house?
    dealt_5_cards.map(&:value).tally.values.sort == [2,3]
  end

  def flush?
    dealt_5_cards.map(&:suit).uniq.count == 1
  end

  def straight?
    dealt_5_cards.map(&:value).sort.reduce do |el_1, el_2|
      return false unless el_1 + 1 == el_2
      el_2
    end
    true
  end

  def three_of_a_kind?
    dealt_5_cards.map(&:value).tally.values.sort == [1,1,3]
  end

  def two_pair?
    dealt_5_cards.map(&:value).tally.values.sort == [1,2,2]
  end

  def pair?
    dealt_5_cards.map(&:value).tally.values.sort == [1,1,1,2]
  end
end

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

def app_poker_hand
  # hand = PokerHand.new(Deck.new)

  # p hand
  # hand.print
  # puts hand.evaluate
  # p hand
  # hand.print

  # Test that we can identify each PokerHand type.
  hand = PokerHand.new([
    Card.new(10,      'Hearts'),
    Card.new('Ace',   'Hearts'),
    Card.new('Queen', 'Hearts'),
    Card.new('King',  'Hearts'),
    Card.new('Jack',  'Hearts')
  ])
  # puts hand.evaluate
  puts hand.evaluate == 'Royal flush'

  hand = PokerHand.new([
    Card.new(8,       'Clubs'),
    Card.new(9,       'Clubs'),
    Card.new('Queen', 'Clubs'),
    Card.new(10,      'Clubs'),
    Card.new('Jack',  'Clubs')
  ])
  puts hand.evaluate == 'Straight flush'

  hand = PokerHand.new([
    Card.new(3, 'Hearts'),
    Card.new(3, 'Clubs'),
    Card.new(5, 'Diamonds'),
    Card.new(3, 'Spades'),
    Card.new(3, 'Diamonds')
  ])
  puts hand.evaluate == 'Four of a kind'

  hand = PokerHand.new([
    Card.new(3, 'Hearts'),
    Card.new(3, 'Clubs'),
    Card.new(5, 'Diamonds'),
    Card.new(3, 'Spades'),
    Card.new(5, 'Hearts')
  ])
  puts hand.evaluate == 'Full house'

  hand = PokerHand.new([
    Card.new(10, 'Hearts'),
    Card.new('Ace', 'Hearts'),
    Card.new(2, 'Hearts'),
    Card.new('King', 'Hearts'),
    Card.new(3, 'Hearts')
  ])
  puts hand.evaluate == 'Flush'

  hand = PokerHand.new([
    Card.new(8,      'Clubs'),
    Card.new(9,      'Diamonds'),
    Card.new(10,     'Clubs'),
    Card.new(7,      'Hearts'),
    Card.new('Jack', 'Clubs')
  ])
  puts hand.evaluate == 'Straight'

  hand = PokerHand.new([
    Card.new('Queen', 'Clubs'),
    Card.new('King',  'Diamonds'),
    Card.new(10,      'Clubs'),
    Card.new('Ace',   'Hearts'),
    Card.new('Jack',  'Clubs')
  ])
  puts hand.evaluate == 'Straight'

  hand = PokerHand.new([
    Card.new(3, 'Hearts'),
    Card.new(3, 'Clubs'),
    Card.new(5, 'Diamonds'),
    Card.new(3, 'Spades'),
    Card.new(6, 'Diamonds')
  ])

  puts hand.evaluate == 'Three of a kind'

  hand = PokerHand.new([
    Card.new(9, 'Hearts'),
    Card.new(9, 'Clubs'),
    Card.new(5, 'Diamonds'),
    Card.new(8, 'Spades'),
    Card.new(5, 'Hearts')
  ])
  puts hand.evaluate == 'Two pair'

  hand = PokerHand.new([
    Card.new(2, 'Hearts'),
    Card.new(9, 'Clubs'),
    Card.new(5, 'Diamonds'),
    Card.new(9, 'Spades'),
    Card.new(3, 'Diamonds')
  ])
  puts hand.evaluate == 'Pair'

  hand = PokerHand.new([
    Card.new(2,      'Hearts'),
    Card.new('King', 'Clubs'),
    Card.new(5,      'Diamonds'),
    Card.new(9,      'Spades'),
    Card.new(3,      'Diamonds')
  ])
  puts hand.evaluate == 'High card'
end
app_poker_hand()

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
# app2()

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
