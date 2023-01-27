class PolyTreeNode
    def initialize (value)
        @value = value
        @parent = nil
        @children = []
    end
        @value
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def parent=(new_parent)
        if !self.parent.nil?
            self.parent.children.remove(self)
        else
            @parent = new_parent 
            new_parent.children << self


        parent.children.each do |child|
            if self == child

        @parent = parent
        parent.children << self 
    end


        
end