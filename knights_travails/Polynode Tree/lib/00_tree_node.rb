require "byebug"

class PolyTreeNode
  attr_reader :value, :parent, :children
  attr_writer :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end


  def parent=(new_parent)   
    if parent == nil
      @parent = new_parent
      new_parent.children << self
    else 
      self.parent.children.delete(self)
      @parent = new_parent
      new_parent.children << self if !new_parent.nil? #!new_parent.children.include?(self)
    end
  end


  def add_child(child)
    if !self.children.include?(child)
      child.parent = self
    end
  end

  def remove_child(child)
    self.children.delete(child)
    child.parent = nil
  end

  def dfs(target)
    return self if target == self.value

    self.children.each do |child_node|
      result = child_node.dfs(target) # memoization
      return result if !result.nil?
    end
    nil
  end

  def bfs(target)
    queue = [self]

    until queue.empty?
      test = queue.shift
      if target == test.value
        return test
      else
        queue += test.children
      end
    end

    nil
  end

end


=begin
  
Write a #bfs(target_value) method to implement breadth first search.
You will use a local Array variable as a queue to implement this.
First, insert the current node (self) into the queue.
Then, in a loop that runs until the array is empty:
Remove the first node from the queue,
Check its value,
Push the node's children to the end of the array.
Prove to yourself that this will check the nodes in the right order. Draw it out. Show this explanation to your TA.
Get your TA to check your work!
Make sure all the specs pass.

=end




