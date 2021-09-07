# frozen_string_literal: true

require_relative "./node"

# Create a linked list
class LinkedList
  attr_accessor :head, :tail

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

  def traverse
    current_node = head
    until current_node == tail
      puts current_node.value
      current_node = current_node.next_node
    end
  end
end


test_list = LinkedList.new
p test_list.append(5)
p test_list.append(7)
p test_list.append(9)
test_list.traverse