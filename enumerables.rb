# frozen_string_literal: true

# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/ModuleLength
# convention:Style/Documentation
# rubocop disable Metrics/MethodLength

module Enumerable
  def my_each
    return to_enum if block_given? == false

    i = 0
    ar = self
    while i < ar.size
      yield(ar[i])
      i += 1
    end
  end

  def my_each_with_index
    return to_enum if block_given? == false

    i = 0
    ar = self
    while i < ar.size
      yield(ar[i], i)
      i += 1
    end
  end

  def my_select
    return to_enum if block_given? == false

    i = 0
    ar = self
    array = []
    while i < ar.size
      array << ar[i] if yield(ar[i])
      i += 1
    end
    array
  end

  def my_all?(*args)
    i = 0
    ar = self
    while i < ar.size
      if block_given? == true
        return false unless yield(ar[i])
      elsif args.class == Class
        return false unless ar[i].class.ancestors.include? args
      elsif args.class == Ragexp
        return false unless ar[i] =~ args
      elsif args.empty? == true
        return false unless ar[i]
      else
        return false unless args[i] == ar[i]
      end

      i += 1
    end
    true
  end

  def my_any?(*args)
    i = 0
    ar = self
    while i < ar.size
      if block_given? == true
        return true if yield(ar[i])
      elsif args.class == Class
        return true if ar[i].class.ancestors.include? args
      elsif args.class == Ragexp
        return true if ar[i] =~ args
      elsif args.empty? == true
        return true if ar[i]
      else
        return true if args[i] == ar[i]

      end

      i += 1
    end
    false
  end

  def my_none?(*args)
    i = 0
    ar = self
    while i < ar.size
      if block_given? == true
        return false if yield (ar[i])
      elsif args.class == Class
        return false if ar[i].class.ancestors.include? args
      elsif args.class == Ragexp
        return false if ar[i] =~ args
      elsif args.empty? == true
        return false if ar[i]
      else
        return false if args[i] == ar[i]
      end

      i += 1
    end
    true
  end

  def my_count(args = '')
    ar = self
    i = 0
    count = 0
    if block_given? == false
      while i < ar.size
        if args != ''
          count += 1 if ar[i] == args
        else
          count += 1
        end
        i += 1
      end
    else
      while i < ar.size
        count += 1 if yield(ar[i])
        i += 1
      end
    end
    count
  end

  def my_map(&proc)
    return to_enum if block_given? == false

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

  def my_inject(*args)
    i = 0
    ar = self
    injector_result = 0
    if args[1].nil? && !block_given?
      symbol = args[0]
    elsif args[1].nil? && block_given?
      injector_result = args[0]
    else
      injector_result = args[0]
      symbol = args[1]
    end
    injector_result = 0 if args.empty?

    while i < ar.size
      injector_result = if symbol
                          injector_result.send(symbol, ar[i])
                        else
                          yield(injector_result, ar[i])
                        end
      i += 1
    end

    injector_result
  end
end

################# Testing Suite ##################
# rubocop enable Metrics/MethodLength

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/ModuleLength

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
test_count = [0, 1, 2, 3, 4].my_count
p test_count
p 'here'
test_map = [1, 2, 3, 4, 5].my_map { |i| i * 4 }
p test_map
p [1, 2, 3, 4, 4, 5].my_inject(:+)
p [1, 2, 3, 4, 4, 5].inject(:+)
p multiply_els([1, 2, 3])

# proc map method
p [1, 2, 3, 4, 5].my_map(&my_proc)
