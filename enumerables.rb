# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    ar = self
    while i < ar.size
      yield(ar[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    ar = self
    while i < ar.size
      yield(ar[i], i)
      i += 1
    end
  end
end

# Test cases
[1, 2, 3, 4].my_each { |_x| puts "working #{_x}" }
[1, 2, 3, 4].my_each_index { |x, y| puts "#{x} at index #{y}" }
