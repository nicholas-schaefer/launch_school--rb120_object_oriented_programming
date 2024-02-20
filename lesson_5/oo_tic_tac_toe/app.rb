=begin
Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns
marking a square. The first player to mark 3 squares in a row wins.
=end

class Board
  def initialize
    @rows_top_to_bottom = [
      Array.new(3){Square.new},
      Array.new(3){Square.new},
      Array.new(3){Square.new}
    ]
    # we need some way to model the 3x3 grid. Maybe "squares"?
    # what data structure should we use?
    # - array/hash of Square objects?
    # - array/hash of strings or integers?
  end

  FIVE_SPACES = "     "
  MARK_X = "  X  "
  MARK_O = "  O  "
  COLUMN_DIVIDER = "|"
  ROW_DIVIDER = "-----+-----+-----"
  EMPTY_ROW = FIVE_SPACES + COLUMN_DIVIDER + FIVE_SPACES + COLUMN_DIVIDER + FIVE_SPACES

  def display
    13.times do |row_level|
      case row_level
      when 0,12 #Board padding
        puts "\r\n"
      when 1,3,5,7,9,11
        puts EMPTY_ROW
      when 4, 8
        puts ROW_DIVIDER
      when 2, 6, 10
        case row_level
        when 2
          puts dynamic_row 0
        when 6
          puts dynamic_row 1
        when 10
          puts dynamic_row 2
        end
      end
    end
  end

  private
  def dynamic_row dynamic_row_level
    @rows_top_to_bottom[dynamic_row_level].map do |square|
      case square.status
      when nil  then FIVE_SPACES
      when :x   then MARK_X
      when :o   then MARK_O
      end
    end.join(COLUMN_DIVIDER)
  end
end

class Square
  attr_reader :status
  def initialize
    @status
    # maybe a "status" to keep track of this square's mark?
  end
end

class Player
  def initialize
    # maybe a "marker" to keep track of this player's symbol (ie, 'X' or 'O')
  end

  def mark

  end
end

class TTTGame

  attr_reader :board
  def initialize
    @board = Board.new
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    board.display
  end

  def play
    display_board
    display_welcome_message
    # loop do
    #   display_board
    #   first_player_moves
    #   break if someone_won? || board_full?

    #   second_player_moves
    #   break if someone_won? || board_full?
    # end
    # display_result
    # display_goodbye_message
  end
end

# we'll kick off the game like this
game = TTTGame.new
game.play
