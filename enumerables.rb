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

  def my_select
    i = 0
    ar = self
    array = []
    while i < ar.size
      array << ar[i] if yield(ar[i])
      i += 1
    end
    array
  end

  def my_all?
    i = 0
    ar = self
    while i < ar.size
      return false unless yield(ar[i])

      i += 1
    end
    true
  end

  def my_any?
    i = 0
    ar = self
    while i < ar.size
      return true if yield(ar[i])

      i += 1
    end
    false
  end

  def my_none?
    i = 0
    ar = self
    while i < ar.size
      return false if yield (ar[i])

      i += 1
    end
    true
  end
end

# Test cases
[1, 2, 3, 4].my_each { |_x| puts "working #{_x}" }
[1, 2, 3, 4].my_each_with_index { |x, y| puts "#{x} at index #{y}" }
p [1, 2, 3, 4].my_select(&:even?)
p %w[testing this theme].my_all? { |x| x[0] == 't' }
p %w[testing this theme].my_any? { |x| x[0] == 'x' }
p %w[testing this theme].my_none? { |x| x[0] == 'x' }
