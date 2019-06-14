require_relative "tree_node"

class KnightPathFinder
  attr_reader :root_node

  def initialize(pos)
    @considered_positions = [pos]
    @root_node = PolyTreeNode.new(pos)
  end

  def self.valid_moves(current_pos)
    possible_pos = []
   deltas = [[1, 2], [2, 1], [-1, -2], [-2, -1], [-1, 2], [1, -2], [-2, 1], [2, -1] ] #all the possible difference
    deltas.each do |delta|
      new_x = current_pos[0] + delta[0]
      new_y = current_pos[1] + delta[1]
      new_pos = [new_x, new_y]
      unless new_x < 0 || new_x > 8 || new_y < 0 || new_y > 8
        possible_pos << new_pos 
      end
    end
    possible_pos
  end

  def new_move_positions(pos)
    KnightPathFinder.valid_moves(pos).reject { |arr| @considered_positions.include?(arr) }
  end


end


=begin
[
  [nil, nil, nil, nil, nil, nil, nil, nil],
 [nil, nil, nil, nil, nil, nil, nil, nil],
 [nil, nil, nil, nil, nil, nil, nil, nil],
 [nil, nil, nil, nil, nil, nil, nil, nil],
 [nil, nil, nil, nil, nil, nil, nil, nil],
 [nil, nil, nil, nil, nil, nil, nil, nil],
 [nil, nil, nil, nil, nil, nil, nil, nil],
 [nil, nil, nil, nil, nil, nil, nil, nil]

]

=end