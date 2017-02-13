#Miles Greatwood
require 'test/unit'
class Node
  def initialize(n)
    @value = n
    @left = nil
    @right = nil
  end
  #This creates the getters and setters for the specified instance variables
  #They are now accessible attributes through node.value node.left
  attr_accessor :value, :left, :right
end
class BST
  #making this attr_reader or attr_writer makes this readonly or writeonly
  attr_accessor :root, :size
  def initialize()
    @root = nil
    @size = 0
  end
  def insert(node)
    if @size == 0  
    @root = node
    @size += 1
    end
  end
end
class BST_Test < Test::Unit::TestCase
  def test_node
    n = Node.new("abc")
    assert_equal("abc", n.value)

    tree = BST.new
    assert_equal(nil, tree.root)
  end
  def test_tree
    n = Node.new("5")
    assert_equal("5", n.value)

    tree = BST.new
    assert_equal(nil, tree.root)

    tree.insert(Node.new(7))
    assert_equal(1, tree.size)
    assert(tree.find(7))
    assert(!tree.find(1919))
    
  end
end
