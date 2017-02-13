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
 #This goes down the tree to make add a new node lower.
 #This doesn't balance the tree it just inserts the item    
  def insertLower(node, current)
     case
     when node.value < current.value && current.left == nil
       current.left = node
       @size +=1
       return
     when node.value > current.value && current.right == nil
       current.right = node
       @size +=1
       return
     when node.value < current.value && current.left != nil
       insertLower(node, current.left)
     when node.value > current.value && current.right != nil
       insertLower(node, current.right)
     end
  end
  def insert(node)
    if @size == 0  
     @root = node
     @size += 1
    else
     current = @root
     insertLower(node, current)
    end
  end


  def find(val)
    return search(@root, val)
  end
  def search(node, val)
    return false if node == nil
    case 
    when val > node.value
      search(node.right, val)
    when val < node.value
      search(node.left, val)
    else
      return true
    end
  end
  #The following makes search private
  private :search
end
class BST_Test < Test::Unit::TestCase
  def test_node
    n = Node.new("abc")
    assert_equal("abc", n.value)

    tree = BST.new
    assert_equal(nil, tree.root)
  end
  def test_tree2
    n = Node.new("5")
    assert_equal("5", n.value)

    tree = BST.new
    assert_equal(nil, tree.root)

    #assert assert_equal assert_not_equal are all good tests. (expected vs actual)
    tree.insert(Node.new(7))
    assert_equal(1, tree.size)
    assert(tree.find(7))
    assert(!tree.find(1919))
  end
  def test_tree3
    n = Node.new("5")
    assert_equal("5", n.value)

    tree = BST.new
    assert_equal(nil, tree.root)

    #assert assert_equal assert_not_equal are all good tests. (expected vs actual)
    tree.insert(Node.new(10))
    assert_equal(1, tree.size)
    assert(tree.find(10))
    assert(!tree.find(25))
    tree.insert(Node.new(30))
    tree.insert(Node.new(5))
    assert(tree.find(30))
    assert(tree.find(5))
  
  end
end

#To comment things out use
=begin
lots of things can be written here and then
when you want to end the comment
=end

