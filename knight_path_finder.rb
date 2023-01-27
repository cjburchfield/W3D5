require "/skeleton/lib/00_tree_node.rb"

class KnightPathFinder
    def self.root_node(pos)
        @initial_pos = PolyTreeNode.new(pos)
    end

    def initialize(starting_pos)
        build_move_tree(starting_pos)
        @considered_positions = [starting_pos]
    end

    def build_move_tree(pos)
        self.root_node(pos)
    end

    def self.valid_moves(pos)
        
    end


    
end