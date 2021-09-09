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
    each_node { counter += 1 }
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

  def each_node
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
    each_node { |element| string_list += "#{element.value} -> " }
    string_list + "#{tail_node.value} -> nil"
  end
end


test_list = LinkedList.new
puts "List initiation. Expected list size: 0; actual list size: #{test_list.size}"
test_list.append(5)
puts "Append first element. Expected list size: 1; actual list size: #{test_list.size}"
test_list.append(7)
puts "Append second element. Expected list size: 2; actual list size: #{test_list.size}"
test_list.append(9)
test_list.append(11)
puts "Append 4 elements. Expected list size: 4; actual list size: #{test_list.size}"
puts "Appended 4 elements."
puts "    expect: 5 -> 7 -> 9 -> 11 -> nil"
puts "    actual: #{test_list.to_s}"
test_list.prepend(99)
test_list.prepend(98)
test_list.prepend(97)
puts "Prepend 3 elements. Expected list size: 7; actual list size: #{test_list.size}"
puts "Prepended 3 elements."
puts "    expect: 97 -> 98 -> 99 -> 5 -> 7 -> 9 -> 11 -> nil"
puts "    actual: #{test_list.to_s}"
puts "Test #head method. expect 97; actual: #{test_list.head}"
puts "Test #tail method. expect: 11; actual: #{test_list.tail}"
