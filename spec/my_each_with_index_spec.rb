# frozen_string_literal: true

require_relative '../enumerables.rb'

RSpec.describe 'my Each with index' do
  let(:array) { [1, 2, 3, 4] }
  let(:range) { (1..875) }
  let(:hash) { { Name: 'Mario', LastName: 'Dena' } }
  let(:t_array) { [] }

  it 'returns enumerator for array' do
    expect(array.my_each_with_index).to be_instance_of(Enumerator)
  end

  it 'iterate over every value inside an array' do
    counter = 0
    array.my_each_with_index { counter += 1 }
    expect(counter).to eq(array.size)
  end

  it 'iterate over every value inside a range' do
    counter = 0
    range.my_each_with_index { counter += 1 }
    expect(counter).to eq(range.size)
  end

  it 'iterate over every value inside an hash' do
    counter = 0
    hash.my_each_with_index { counter += 1 }
    expect(counter).to eq(hash.size)
  end

  it 'should take into account indexes' do
    hash.my_each_with_index { |pair, index| t_array[index] = pair }
    expect(t_array).to eq(hash.to_a)
  end
end
