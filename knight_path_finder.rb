require "/skeleton/lib/00_tree_node.rb"

class KnightPathFinder
    def self.root_node(pos)
        @initial_pos = PolyTreeNode.new(pos)
    end

    def initialize(pos)
        build_move_tree(pos)
    end

    def build_move_tree(pos)
        self.root_node(pos)
    end

    
end