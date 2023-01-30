require_relative "./skeleton/lib/00_tree_node.rb"

class KnightPathFinder
    def self.root_node(pos)
        PolyTreeNode.new(pos)
    end

    def initialize(starting_pos)
        @initial_pos = KnightPathFinder.root_node(starting_pos)
        @considered_positions = [@initial_pos.value]
        self.build_move_tree
    end

    # this is the iteration
    def build_move_tree
        queue = @considered_positions.dup
        until @considered_positions.length == 64
            new_positions = self.new_move_positions(queue.shift())
            queue += new_positions
        end
        @considered_positions
    end


    def self.valid?(pos)
        x, y = pos
        return false if x < 0 || x > 7
        return false if y < 0 || y > 7
        true
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

    # this is a step
    def new_move_positions(pos)

        new_positions = []
        KnightPathFinder.valid_moves(pos).each do |new_pos|
            if !@considered_positions.include?(new_pos)
                new_positions << new_pos
                @considered_positions << new_pos
            end
        end
        new_positions
    end
    
end

tst = KnightPathFinder.new([4,5])