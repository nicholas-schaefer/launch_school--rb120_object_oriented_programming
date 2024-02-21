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
  EMPTY_ROW = FIVE_SPACES + COLUMN_DIVIDER + FIVE_SPACES + COLUMN_DIVIDER + FIVE_SPACES

  attr_reader :rows_top_to_bottom, :open_squares
  def initialize
    @rows_top_to_bottom = [
      Array.new(3){Square.new},
      Array.new(3){Square.new},
      Array.new(3){Square.new}
    ]
  end

  def win_condition_met?
    win_condition_row? || win_condition_column? || win_condition_diagonal?
  end

  def win_condition_row?
    rows_top_to_bottom.each do |row|
      arr_row_statuses = row.map { |square| square.status }
      next if arr_row_statuses.any? nil
      return true if arr_row_statuses.uniq.length == 1
    end
    false
  end

  def win_condition_column?
    columns_left_to_right = rows_top_to_bottom.transpose
    columns_left_to_right.each do |row|
      arr_row_statuses = row.map { |square| square.status }
      next if arr_row_statuses.any? nil
      return true if arr_row_statuses.uniq.length == 1
    end
    false
  end

  def win_condition_diagonal?
    arr_topleft_bottomright =
      rows_top_to_bottom[0][0], rows_top_to_bottom[1][1], rows_top_to_bottom[2][2]
    arr_bottomleft_topright =
      rows_top_to_bottom[2][0], rows_top_to_bottom[1][1], rows_top_to_bottom[0][2]
    diagonals = [arr_topleft_bottomright, arr_bottomleft_topright]

    diagonals.each do |row|
      arr_row_statuses = row.map { |square| square.status }
      next if arr_row_statuses.any? nil
      return true if arr_row_statuses.uniq.length == 1
    end
    false
  end

  def update_squares square_to_update, player
    return unless (0..8).any? square_to_update
    idx_1, idx_2 = square_to_update.divmod 3
    @rows_top_to_bottom[idx_1][idx_2].status = player.marker
    # p @rows_top_to_bottom
  end

  def open_squares
    @rows_top_to_bottom.flatten.filter_map.with_index do |square, idx|
      idx if square.status.nil?
    end
  end

  def open_square? requested_square
    open_squares.any? requested_square
  end

  def display
    13.times do |row_level|
      case row_level
      when 0,12
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
  attr_accessor :status
  def initialize
    @status = nil
    # maybe a "status" to keep track of this square's mark?
  end
end

class Player
  attr_reader :marker
  def initialize name, marker
    @name   = name
    @marker = marker
    # maybe a "marker" to keep track of this player's symbol (ie, 'X' or 'O')
  end

  def mark

  end

  def select_random_move board
    computer_move = board.open_squares.sample
  end

  def select_move board
    # puts "hello world!!!"
    select_move_msg = <<~EOT
    Human make your move
    (Input square selection between 0-8)
      0 | 1 | 2
      3 | 4 | 5
      6 | 7 | 8
    EOT
    invalid_move_msg = "Invalid move selected, please try again"
    human_move = ""

    loop do
      loop do
        puts select_move_msg
        human_move = gets.chomp
        break if (0..8).map(&:to_s).any? human_move
        puts "Invalid move selected, you must choose an integer between 0-8"
      end
      break if valid_move?(board, human_move.to_i)
      puts "Invalid move selected, that move has already been taken"
    end
    human_move.to_i
  end

  def valid_move? board, requested_move
    return false unless (0..8).any? requested_move
    board.open_square?(requested_move)
    # return false unless (0..8).any? requested_move
    # return true if board.rows_top_to_bottom.flatten[requested_move].status.nil?
    # false
  end
  private

end

class TTTGame

  attr_reader :board, :player_human, :player_computer
  def initialize
    setup
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
    puts "."
    sleep(1)
    puts "."
    sleep(1)
    puts "."
    sleep(1)
    second_player_move = player_computer.select_random_move board
    board.update_squares second_player_move, player_computer
    board.display
  end

  def someone_won?
    board.win_condition_met?
  end

  # @rows_top_to_bottom = [
  #   Array.new(3){Square.new},
  #   Array.new(3){Square.new},
  #   Array.new(3){Square.new}
  # ]

  def board_full?
    board.open_squares.empty?
  end

  def play
    display_board
    display_welcome_message
    # first_player_moves
    # second_player_moves

    winner = loop do
              first_player_moves
              break "human" if someone_won?
              break false if board_full?

              second_player_moves
              break "computer" if someone_won?
              break false if board_full?
            end
    puts "WE ARE OUT OF THE LOOP!"
    puts winner ? "#{winner.upcase} has won the game!!!" : "DRAW"
    # display_result
    # display_goodbye_message
    puts "Let's Play again!!!!"
    puts "\r\n"
    puts "\r\n"
    play_again
  end

end

# we'll kick off the game like this
game = TTTGame.new
game.play
