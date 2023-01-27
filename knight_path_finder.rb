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


    def self.valid?(pos)
        x, y = pos
        return false if x < 0 && x > 7
        return false if y < 0 && y > 7
    end

    def self.valid_moves(pos)
        x, y = pos
        results = []

        results << [x - 2, y + 1] if KnightPathFinder.valid?([x - 2, y + 1])
        results << [x - 1, y + 2] if KnightPathFinder.valid?([x - 1, y + 2])
        results << [x + 1, y + 2] if KnightPathFinder.valid?([x + 1, y + 2])
        results << [x + 2, y + 1] if KnightPathFinder.valid?([x + 2, y + 1])
        results << [x + 2, y - 1] if KnightPathFinder.valid?([x + 2, y - 1])
        results << [x + 1, y - 2] if KnightPathFinder.valid?([x + 1, y - 2])
        results << [x - 1, y - 2] if KnightPathFinder.valid?([x - 1, y - 2])
        results << [x - 2, y - 1] if KnightPathFinder.valid?([x - 2, y - 1])

        results
    end

    # NOT YET TESTED!!!!!!
    def new_move_positions(pos)
        new_positions = []
        @considered_positions

        KnightPathFinder.valid_moves(pos).each do |pos|
            if !@considered_positions.include?(pos)
                new_positions << pos 
                @considered_positions << pos
            end
        end
        new_positions
    end
    
end