=begin
Nouns: player, move, rule
Verbs: choose, compare
=end

class Player
  @@player_id = 1000
  attr_reader :name, :player_id
  def initialize name
    @name = name
    @player_id = @@player_id
    @@player_id += 1
    @moves = []
    @results = {:wins => 0, :loses => 0, :draws => 0}
  end

  def move=(move)
    @moves << move
  end

  def last_move
    @moves.last
  end

end

class Move
  @@potential_moves = [:rock, :paper, :scissors]

  def self.potential_moves
    @@potential_moves
  end

  def self.select_random
    @@potential_moves.sample
  end
end

class Rule

  def self.outcome (player_1, player_2)
    player_1_move = player_1.last_move
    player_2_move = player_2.last_move
    winner = calculate_result(player_1_move, player_2_move)

    # case winner
    # when :player_1_wins
    # when :player_1_wins
    # when :draw
    # end

    winner.to_s.split("_").map(&:capitalize).join(" ") + "!"
  end

  private_class_method def self.calculate_result(player_1_move, player_2_move)
    return :draw if player_1_move == player_2_move
    case
    when player_1_move == :rock
      player_2_move == :scissors ? :player_1_wins : :player_2_wins
    when player_1_move == :paper
      player_2_move == :rock ? :player_1_wins : :player_2_wins
    when player_1_move == :scissors
      player_2_move == :paper ? :player_1_wins : :player_2_wins
    end
  end

end


class RPSGame
  def initialize
  end

  def self.play
    player_names = []
    player_names << "nick" << "nicole"

    player_instances =
      player_names.map do |player_name|
        Player.new(player_name)
      end

    player_1, player_2 = player_instances
    pp player_instances

    player_instances.each do |player_instance|
      player_instance.move = Move.select_random
    end

    player_instances.each do |player_instance|
      p player_instance.last_move
    end

    p Rule.outcome(player_1, player_2)
  end

end

RPSGame.play

# p Move.potential_moves
# p Move.select_random

# bob = Player.new("bob")
# p bob.name
# p bob.player_id

# p "---"

# fred = Player.new("fred")
# p fred.name
# p fred.player_id

