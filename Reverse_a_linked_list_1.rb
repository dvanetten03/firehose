class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end

end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  #Push a value onto the stack
  def push(value)
    @data = LinkedListNode.new(value, @data)
  end

  # Pop an item off the stack
  def pop
    if @data.nil?
      return nil
    else
      popped = @data
      @data = @data.next_node
      return popped
    end
  end

end

def print_values(list_node)
print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

def reverse_list(list)
  r = Stack.new
  while list
    r.push(list.value)
    list = list.next_node
  end
  return r.data
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(3200, node3)

print_values(node4)
puts "--------"
revlist = reverse_list(node4)
print_values(revlist)