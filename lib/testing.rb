# frozen_string_literal: true

require_relative "./node"
require_relative "./linked_list"

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
puts ""
test_list.prepend(99)
test_list.prepend(98)
test_list.prepend(97)
puts "Prepend 3 elements. Expected list size: 7; actual list size: #{test_list.size}"
puts "Prepended 3 elements."
puts "    expect: 97 -> 98 -> 99 -> 5 -> 7 -> 9 -> 11 -> nil"
puts "    actual: #{test_list.to_s}"
puts "Test #head method. expect 97; actual: #{test_list.head}"
puts "Test #tail method. expect: 11; actual: #{test_list.tail}"
puts ""
puts "The #at(index) works for index = 0. expect: 97; actual #{test_list.at(0)}"
puts "The #at(index) works for tail. expect: 11; actual #{test_list.at(6)}"

random_index = (1..(test_list.size - 1)).to_a.sample
index_hash = {
  0 => 97,
  1 => 98,
  2 => 99,
  3 => 5,
  4 => 7,
  5 => 9,
  6 => 11
}
puts "#at(index) works for random index (#{random_index}). expect #{index_hash[random_index]}; "\
"actual: #{test_list.at(random_index)}"
puts ""
test_list.pop
puts "#pop removes the last element in the list."
puts "    expect: 97 -> 98 -> 99 -> 5 -> 7 -> 9 -> nil"
puts "    actual: #{test_list.to_s}"
puts ""
puts "#contains works for first element. expect true; actual: #{test_list.contains?(97)}"
puts "#contains works for last element. expect true; actual: #{test_list.contains?(9)}"
puts "#contains returns false in not present. expect false; actual: #{test_list.contains?(999)}"
