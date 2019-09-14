class Tree
  attr_accessor :payload, :children
  def initialize(payload, children = [])
    @payload = payload
    @children = children
  end

  def depth_first_search(node, search_value)
    return node if payload == search_value

    children.each do |child|
      tree = child.depth_first_search(child, search_value)
      return tree unless tree.nil?
    end
    nil
  end

  def breadth_first_search(node, search_value)
    return node if node.payload == search_value

    queue = MyQueue.new
    queue.enqueue(node)
    until queue.empty?
      current_node = queue.dequeue
      return current_node if current_node.payload == search_value
      current_node.children.each do |child|
        queue.enqueue(child)
      end
    end
  end
end

class MyQueue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
end


# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

