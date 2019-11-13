# frozen_string_literal: true

require_relative '../enumerables.rb'

RSpec.describe 'my_all' do
  let(:array) { [1, 2, 3, 4] }
  let(:range) { (1..875) }
  let(:hash) { { Name: 'Mario', LastName: 'Dena' } }
  let(:t_array) { [] }

  it 'should return true for empty' do
    expect([].my_all?).to be_truthy
  end

  it 'should return true if all elements match' do
    expect(range.my_all?(Integer)).to be_truthy
  end

  it 'should return false if not all elements match' do
    expect(range.my_all?(2)).to be_falsy
  end

  it 'should work with blocks (yield)' do
    array.my_all? { |value| t_array << value }
    expect(t_array).to eq(array)
  end

  it 'should yield key and value' do
    hash.my_all? { |key, value| t_array.push(key, value) }
    expect(t_array).to eq(hash.to_a.flatten)
  end
end
