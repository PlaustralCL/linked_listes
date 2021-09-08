# frozen_string_literal: true

require "pry-byebug"
require_relative "./node"

# Create a linked list
class LinkedList
  attr_reader :head, :tail

  def initialize
    new_node = Node.new
    @head = new_node
    @tail = new_node
  end

  def append(value)
    new_node = Node.new(value: value)

    if first_node?
      add_first_node(new_node)
    elsif tail == head
      @tail = new_node
      head.next_node = tail
    else
      tail.next_node = new_node
      @tail = new_node
    end
  end

  def first_node?
    head.value.nil?
  end

  def add_first_node(new_node)
    @head = new_node
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value, head)
    @head = new_node
  end

  def traverse
    current_node = head
    until current_node == tail
      p current_node
      current_node = current_node.next_node
    end
    p tail
  end

  def to_s
    current_node = head
    until current_node == tail
      print "#{current_node.value} -> "
      current_node = current_node.next_node
    end
    print "#{tail.value} -> "
    puts "nil"
  end
end


test_list = LinkedList.new
# binding.pry
p test_list.append(5)
puts "#{test_list.head} --> #{test_list.head.value} #{test_list.tail} --> #{test_list.tail.value}\n\n"
p test_list.append(7)
puts "#{test_list.head} --> #{test_list.head.value} #{test_list.tail} --> #{test_list.tail.value}\n\n"
p test_list.append(9)
puts "#{test_list.head} --> #{test_list.head.value} #{test_list.tail} --> #{test_list.tail.value}\n\n"
puts ""
p test_list.append(11)
puts "#{test_list.head} --> #{test_list.head.value} #{test_list.tail} --> #{test_list.tail.value}\n\n"
puts ""
test_list.traverse
# p test_list.tail
test_list.to_s
# test_list.prepend(99)
# test_list.prepend(98)
# test_list.to_s
