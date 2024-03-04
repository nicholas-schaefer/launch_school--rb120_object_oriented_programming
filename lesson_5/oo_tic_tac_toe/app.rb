=begin
Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns
marking a square. The first player to mark 3 squares in a row wins.
=end

class Board
  FIVE_SPACES = "     "
  MARK_X = "  X  "
  MARK_O = "  O  "
  COLUMN_DIVIDER = "|"
  ROW_DIVIDER = "-----+-----+-----"
  EMPTY_ROW = FIVE_SPACES + COLUMN_DIVIDER + FIVE_SPACES +
              COLUMN_DIVIDER + FIVE_SPACES

  def initialize
    @rows_top_to_bottom = [
      Array.new(3) { Square.new },
      Array.new(3) { Square.new },
      Array.new(3) { Square.new }
    ]
  end

  def win_condition_met?
    win_condition_row? || win_condition_column? || win_condition_diagonal?
  end

  def win_condition_row?
    line_win?(rows_top_to_bottom)
  end

  def win_condition_column?
    columns_left_to_right = rows_top_to_bottom.transpose
    line_win?(columns_left_to_right)
  end

  def win_condition_diagonal?
    arr_topleft_bottomright = []
    arr_bottomleft_topright = []

    3.times do |i|
      arr_topleft_bottomright << rows_top_to_bottom[i][i]
      arr_bottomleft_topright << rows_top_to_bottom[2 - i][i]
    end

    diagonals = [arr_topleft_bottomright, arr_bottomleft_topright]
    line_win?(diagonals)
  end

  def update_squares(square_to_update, player)
    return unless (0..8).any? square_to_update
    idx1, idx2 = square_to_update.divmod 3
    rows_top_to_bottom[idx1][idx2].status = player.marker
  end

  def open_squares
    rows_top_to_bottom.flatten.filter_map.with_index do |square, idx|
      idx if square.status.nil?
    end
  end

  def open_square?(requested_square)
    open_squares.any? requested_square
  end

  def display
    13.times do |row_level|
      case row_level
      when 0, 12              then puts "\r\n"
      when 1, 3, 5, 7, 9, 11  then puts EMPTY_ROW
      when 4, 8               then puts ROW_DIVIDER
      when 2                  then puts dynamic_row 0
      when 6                  then puts dynamic_row 1
      when 10                 then puts dynamic_row 2
      end
    end
  end

  private

  attr_accessor :rows_top_to_bottom

  def dynamic_row(dynamic_row_level)
    rows_top_to_bottom[dynamic_row_level].map do |square|
      case square.status
      when nil  then FIVE_SPACES
      when :x   then MARK_X
      when :o   then MARK_O
      end
    end.join(COLUMN_DIVIDER)
  end
end

def line_win?(line)
  line.each do |row|
    arr_row_statuses = row.map(&:status)
    next if arr_row_statuses.any? nil
    return true if arr_row_statuses.uniq.length == 1
  end
  false
end

class Square
  attr_accessor :status

  def initialize
    @status = nil
  end
end

class Player
  SELECT_MOVE_MSG = <<~MAKE_SELECTION
  Human make your move
  (Input square selection between 0-8)
    0 | 1 | 2
    3 | 4 | 5
    6 | 7 | 8
  MAKE_SELECTION

  attr_reader :marker

  def initialize(name, marker)
    @name   = name
    @marker = marker
    # maybe a "marker" to keep track of this player's symbol (ie, 'X' or 'O')
  end

  def select_random_move(board)
    board.open_squares.sample
  end

  def select_move(board)
    loop do
      human_move = obtain_integer_on_board()
      return human_move.to_i if valid_move?(board, human_move.to_i)
      puts "Invalid move selected, that move has already been taken"
    end
  end

  def valid_move?(board, requested_move)
    return false unless (0..8).any? requested_move
    board.open_square?(requested_move)
  end

  private

  def obtain_integer_on_board
    loop do
      puts SELECT_MOVE_MSG
      human_move = gets.chomp
      return human_move if (0..8).map(&:to_s).any? human_move
      puts "Invalid move selected, you must choose an integer between 0-8"
    end
  end
end

class TTTGame
  attr_reader :board, :player_human, :player_computer

  def initialize
    setup
  end

  def play
    display_board
    display_welcome_message

    winner = someone_wins?
    puts winner ? "#{winner.upcase} has won the game!!!" : "DRAW"
    puts "Let's Play again!!!!"
    2.times { puts "\r\n" }
    play_again
  end

  def reset
    setup
  end

  def setup
    @board = Board.new
    @player_human = Player.new :human, :x
    @player_computer = Player.new :computer, :o
  end

  def play_again
    reset()
    play()
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

  def first_player_moves
    first_player_move = player_human.select_move board
    board.update_squares first_player_move, player_human
    board.display
  end

  def second_player_moves
    p "----"
    p "Hmm Let me think"
    sleep(1)
    second_player_move = player_computer.select_random_move board
    board.update_squares second_player_move, player_computer
    board.display
  end

  def someone_won?
    board.win_condition_met?
  end

  def board_full?
    board.open_squares.empty?
  end

  def someone_wins?
    loop do
      first_player_moves
      break "human" if someone_won?
      break false if board_full?

      second_player_moves
      break "computer" if someone_won?
      break false if board_full?
    end
  end
end

# we'll kick off the game like this
game = TTTGame.new
game.play
