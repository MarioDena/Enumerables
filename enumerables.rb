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

  def my_count(lit = '')
    ar = self
    i = 0
    count = 0
    if block_given? == false
      while i < ar.size
        count += 1 if ar[i] == lit
        i += 1
      end
      count
    else
      while i < ar.size
        count += 1 if yield(ar[i])
        i += 1
      end
      count
    end
  end

  def my_map(&proc)
    i = 0
    ar = self
    array = []
    while i < ar.size
      array << if block_given?
                 yield(ar[i])
               else
                 proc.call(ar[i])
               end
      i += 1
    end
    array
  end

  def my_inject(origin = 0)
    i = 0
    ar = self
    injector_result = origin
    while i < ar.size
      injector_result = yield(injector_result, ar[i])
      i += 1
    end
    injector_result
  end
end

################# Testing Suite ##################

def multiply_els(array)
  array.my_inject(1) { |x, y| x * y }
end

## Proc for proc map method
my_proc = proc { |i| i * 4 }

[1, 2, 3, 4].my_each { |x| puts "working #{x}" }
[1, 2, 3, 4].my_each_with_index { |x, y| puts "#{x} at index #{y}" }
p [1, 2, 3, 4].my_select(&:even?)
testing_all = %w[testing this theme].my_all? { |x| x[0] == 't' }
p testing_all
testing_any = %w[testing this theme].my_any? { |x| x[0] == 'x' }
p testing_any
testing_none = %w[testing this theme].my_none? { |x| x[0] == 'x' }
p testing_none
test_count = [0, 1, 2, 3, 4].my_count(3)
p test_count
test_map = [1, 2, 3, 4, 5].my_map { |i| i * 4 }
p test_map
p [1, 2, 3, 4, 4, 5].my_inject(0) { |x, y| x + y }
p multiply_els([1, 2, 3])

# proc map method
p [1, 2, 3, 4, 5].my_map(&my_proc)
