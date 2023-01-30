class PolyTreeNode
    def initialize (value)
        @value = value
        @parent = nil
        @children = []
    end

    def value
        @value
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def parent=(new_parent)
        if new_parent.nil?
            self.parent.children.delete(self)
            @parent = nil
        elsif !self.parent.nil?
            self.parent.children.delete(self)
            @parent = new_parent 
            new_parent.children << self
        else
            @paresent = new_parent 
            new_parent.children << self
        end
    end

    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        child_node.parent=(nil)
    end

    def dfs(target_value)
        return self if self.value == target_value
        self.children.each do |child|

            node = child.dfs(target_value)
            if !node.nil?
                return node
            end
        end
        nil
    end

    def bfs(target_value)
        queue = [self]

        while !queue.empty?  
            last_ele = queue.shift
            return last_ele if last_ele.value == target_value
            last_ele.children.each {|child| queue.push(child)}
        end
        nil
    end
end

       