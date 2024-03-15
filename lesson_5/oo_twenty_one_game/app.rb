<<~PROBLEM_DESCRIPTION
Twenty-One is a card game consisting of a dealer and a player,
where the participants try to get as close to 21 as possible without going over.

Here is an overview of the game:
- Both participants are initially dealt 2 cards from a 52-card deck.
- The player takes the first turn, and can "hit" or "stay".
- If the player busts, he loses. If he stays, it's the dealer's turn.
- The dealer must hit until his cards add up to at least 17.
- If he busts, the player wins. If both player and dealer stays, then the highest total wins.
- If both totals are equal, then it's a tie, and nobody wins.
PROBLEM_DESCRIPTION

<<~NOUNS_AND_VERBS
Nouns:
- CardGameParticipant (Dealer, Player)
- Card
- Deck
- Hand
- Turn???

Verbs:
- create_deck
- shuffle_deck
- draw_card
- choose_hit
- choose_stay
- end_turn

Verbs:
NOUNS_AND_VERBS

module ExtraStuff
  def self.prompt(msg)
    puts "<< #{msg}"
  end
end


class PersonAtCasino
  attr_reader = :name, :black_jack_session
  def initialize name
    @name = name
    # @black_jack_session = nil
  end
  def play_blackjack
    black_jack_session = BlackJackSession.new
    black_jack_session.choose_role
    black_jack_round = BlackJackRound.new(
      dealer = black_jack_session.participant_dealer,
      player = black_jack_session.participant_player)
    p black_jack_round

    # return
  end

  private
  attr_writer :black_jack_session

end

class BlackJackSession
  attr_reader :participant_dealer, :participant_player
  def initialize
    @participant_dealer = nil
    @participant_player = nil
  end
  def choose_role
    user_roll_input = nil
    loop do
      ExtraStuff.prompt "Are you the Dealer or the Player (enter either 'd' or 'p')"
      user_roll_input = gets.chomp.to_s.downcase
      break if ["d","p"].any?(user_roll_input.to_s)
      ExtraStuff.prompt "Invalid Selection"
    end
    case user_roll_input
    when "d" then
      self.participant_dealer = "human"
      self.participant_player = "computer"
    when "p" then
      self.participant_dealer = "computer"
      self.participant_player = "dealer"
    else
    end
  end

  private

  attr_writer :participant_dealer, :participant_player
end

class BlackJackRound
  def initialize(dealer, player)
    @participant_dealer = dealer
    @participant_player = player
  end
end

class BlackJackParticipant
  # def initialize
  #   @hand
  # end

  def choose_hit
  end

  def choose_stay
  end
end


class Dealer < BlackJackParticipant
  attr_reader :deck

  def initialize
    @deck = []
  end

  def acquire_full_and_shuffled_deck
    acquire_full_ordered_deck()
    shuffle_deck!()
  end

  def acquire_full_ordered_deck
    Cards::VALUES.product(Cards::SUITS).each do |sub_array|
      value, suit = sub_array
      name = "#{value} of #{suit}"
      numeric_translated_values = Cards::TRANSLATE_VALUE_TO_NUM[value]

      @deck << Cards.new(name = name, suit = suit, value = value, numeric_translated_values = numeric_translated_values)
    end
  end

  def shuffle_deck!
    @deck.shuffle!
  end
end

class Player < BlackJackParticipant
end

class Cards

  SUITS = %w(clubs diamonds hearts spades).freeze
  VALUES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace).freeze
  TRANSLATE_VALUE_TO_NUM = {
    "2"     => [2],
    "3"     => [3],
    "4"     => [4],
    "5"     => [5],
    "6"     => [6],
    "7"     => [7],
    "8"     => [8],
    "9"     => [9],
    "10"    => [10],
    "jack"  => [10],
    "queen" => [10],
    "king"  => [10],
    "ace"   => [1, 11]
  }

  attr_reader :name, :suit, :value, :numeric_translated_values

  def initialize(name, suit, value, numeric_translated_values)
    self.name = name
    self.suit = suit
    self.value = value
    self.numeric_translated_values = numeric_translated_values
  end



  private
  attr_writer :name, :suit, :value, :numeric_translated_values
end

class Deck
  def initialize
    @cards
  end
end

class Hand
  def initialize
    @cards
  end
end

gambler_nick = PersonAtCasino.new("nick")
p gambler_nick
gambler_nick.play_blackjack
# card_thingy = Cards.new(name = "ace of spades", suit = "spades", value = "ace", numeric_translated_values = [1, 11])
# dealer_thingy = Dealer.new
# dealer_thingy.acquire_full_and_shuffled_deck
# pp dealer_thingy.deck


# card_thingy.create
# p card_thingy
# p card_thingy.list_names
# p gambler_nick
# gambler_nick.play_blackjack
