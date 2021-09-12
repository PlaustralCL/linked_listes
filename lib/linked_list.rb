# frozen_string_literal: true

require "pry-byebug"
require_relative "./node"

# rubocop: disable Metrics/ClassLength
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
    head_node.value.nil? ? 0 : counter
  end

  def head
    head_node.value
  end

  def tail
    tail_node.value
  end

  def at(index)
    return tail if index + 1 == size

    counter = 0
    node_value = nil
    each_node do |element|
      node_value = element.value
      return node_value if counter == index

      counter += 1
    end
    node_value
  end

  def pop
    current_node = head_node
    current_node = current_node.next_node until current_node.next_node == tail_node
    @tail_node = current_node
    @tail_node.next_node = nil
  end

  def contains?(data)
    each_node { |element| return true if element.value == data }
    false
  end

  def find(data)
    counter = 0
    each_node do |element|
      return counter if element.value == data

      counter += 1
    end
    "nil"
  end

  def insert_at(data, index)
    return prepend(data) if index.zero?
    return append(data) if index >= size

    new_node = Node.new(value: data)
    counter = 0
    current_node = head_node
    until counter == index - 1
      current_node = current_node.next_node
      counter += 1
    end
    new_node.next_node = current_node.next_node
    current_node.next_node = new_node
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
    yield tail_node
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
    "#{string_list}nil"
  end
end
