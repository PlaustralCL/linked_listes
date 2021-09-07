# frozen_string_literal: true

require_relative "./node"

# Create a linked list
class LinkedList
  attr_reader :head, :tail

  def initialize(tail = Node.new, head = Node.new(nil, tail))
    @tail = tail
    @head = head
  end

  def append(value)
    return head.value = value if head.value.nil?

    current_node = head
    current_node = current_node.next_node until current_node.next_node == tail
    current_node.next_node = Node.new(value, tail)
  end

  def prepend(value)
    new_node = Node.new(value, head)
    @head = new_node
  end

  def traverse
    current_node = head
    until current_node == tail
      puts current_node.value
      puts current_node.next_node
      current_node = current_node.next_node
    end
  end

  def to_s
    current_node = head
    until current_node == tail
      print "#{current_node.value} -> "
      current_node = current_node.next_node
    end
    puts "nil"
  end
end


test_list = LinkedList.new
test_list.append(5)
test_list.append(7)
test_list.append(9)
# test_list.traverse
# p test_list.tail
test_list.to_s
test_list.prepend(99)
test_list.prepend(98)
test_list.to_s
