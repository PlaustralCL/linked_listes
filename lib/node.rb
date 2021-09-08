# frozen_string_literal: true

# Create individual nodes for the linked list
class Node
  attr_accessor :value, :next_node

  def initialize(value: nil, next_node: nil)
    @value = value
    @next_node = next_node
  end
end
