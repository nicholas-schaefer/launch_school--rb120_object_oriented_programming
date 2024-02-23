=begin
Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game.
The game should play like this:

Note that a game object should start a new game with a new number to guess with each call to #play.
=end

class GuessingGame
  MIN_RANGE = 1
  MAX_RANGE = 100
  RANGE = (MIN_RANGE..MAX_RANGE)
  INITIAL_GUESS_COUNT = 7

  def play
    @winning_number = generate_winning_number
    @remaining_guesses = INITIAL_GUESS_COUNT.clone
    msg :new_game
    msg :guesses_remaining

    loop do
      break if player_won? obtain_valid_guess
      decrement_remaining_guess_count
      if remaining_guesses > 0
        msg :guesses_remaining
      else
        puts "\r\n"
        msg :out_of_guesses
        return
      end
    end

  end

  private
  attr_reader :remaining_guesses, :winning_number
  def generate_winning_number
    RANGE.to_a.sample
  end

  def decrement_remaining_guess_count
    @remaining_guesses -= 1
  end

  def prompt msg
    puts ">> #{msg}"
  end

  def player_won? guess
    case
    when guess == winning_number
      prompt "That's the number!"
      prompt "You Won!"
      true
    when guess < winning_number
      prompt "Your guess is too low."
      false
    when guess > winning_number
      prompt "Your guess is too high."
      false
    end
  end

  def obtain_valid_guess
    loop do
      msg :enter_a_number
      guess = gets.chomp.to_i
      break guess if RANGE === guess
      msg :invalid_output_out_of_range
    end
  end

  def msg type
    case type
    when :new_game
      prompt "A new Game has begun!"
    when :guesses_remaining
      prompt "You have #{remaining_guesses} guesses remaining."
    when :enter_a_number
      prompt "Enter a number between #{MIN_RANGE} and #{MAX_RANGE}:"
    when :invalid_output_out_of_range
      prompt "Invalid guess. Enter a number between 1 and 100:"
    when :out_of_guesses
      prompt "You have no more guesses. You lost!"
    end
  end

end

game = GuessingGame.new
game.play

y = <<~EOT
You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guess remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!
EOT
