# frozen_string_literal: true

require "pry-byebug"
require_relative "./node"

# Create a linked list
class LinkedList
  attr_reader :head_node, :tail_node

  def initialize
    new_node = Node.new
    @head_node = new_node
    @tail_node = new_node
  end

  def append(value)
    new_node = Node.new(value: value)
    if first_node?
      add_first_node(new_node)
    elsif tail_node == head_node
      @tail_node = new_node
      head_node.next_node = tail_node
    else
      tail_node.next_node = new_node
      @tail_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value: value)
    if first_node?
      add_first_node(new_node)
    elsif head_node == tail_node
      @head_node = new_node
      head_node.next_node = tail_node
    else
      new_node.next_node = head_node
      @head_node = new_node
    end
  end

  def size
    counter = 0
    each { counter += 1 }
    head.nil? ? 0 : counter + 1
  end

  def head
    head_node.value
  end

  def tail
    tail_node.value
  end

  def first_node?
    head_node.value.nil?
  end

  def add_first_node(new_node)
    @head_node = new_node
    @tail_node = new_node
  end

  def each
    current_node = head_node
    until current_node == tail_node
      yield current_node
      current_node = current_node.next_node
    end
  end

  def traverse
    current_node = head_node
    until current_node == tail_node
      p current_node
      current_node = current_node.next_node
    end
    p tail_node
  end

  def to_s
    string_list = ""
    each { |element| string_list += "#{element.value} -> " }
    string_list + "#{tail_node.value} -> nil"
  end
end


test_list = LinkedList.new
puts "List size: #{test_list.size}"
test_list.append(5)
puts "List size: #{test_list.size}"
# binding.pry
# puts "#{test_list.head_node} --> #{test_list.head.value} #{test_list.tail_node} --> #{test_list.tail.value}\n\n"
test_list.append(7)
puts "List size: #{test_list.size}"
# puts "#{test_list.head_node} --> #{test_list.head.value} #{test_list.tail_node} --> #{test_list.tail.value}\n\n"
test_list.append(9)
# puts "#{test_list.head_node} --> #{test_list.head.value} #{test_list.tail_node} --> #{test_list.tail.value}\n\n"
# puts ""
test_list.append(11)
# puts "#{test_list.head_node} --> #{test_list.head.value} #{test_list.tail_node} --> #{test_list.tail.value}\n\n"
# puts ""
# test_list.traverse
# p test_list.tail_node
puts test_list.to_s
puts "List size: #{test_list.size}"
test_list.prepend(99)
# puts "#{test_list.head_node} --> #{test_list.head.value} #{test_list.tail_node} --> #{test_list.tail.value}\n\n"
test_list.prepend(98)
# puts "#{test_list.head_node} --> #{test_list.head.value} #{test_list.tail_node} --> #{test_list.tail.value}\n\n"
# test_list.traverse
test_list.prepend(97)
puts test_list.to_s
puts "List size: #{test_list.size}"
puts "Head: #{test_list.head}"
puts "Tail: #{test_list.tail}"
