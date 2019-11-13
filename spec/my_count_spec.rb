# frozen_string_literal: true

require_relative '../enumerables.rb'

RSpec.describe 'my count' do
  let(:array) { [1, 2, 3, 4] }
  let(:range) { (1..875) }
  let(:hash) { { Name: 'Mario', LastName: 'Dena' } }
  let(:t_array) { [] }

  it 'return 0 if collection is empty' do
    expect([].my_count).to eq(0)
  end

  it 'return size if collection is no arguments' do
    expect(array.my_count).to eq(array.size)
  end

  it 'count the number of matches' do
    expect(hash.my_count{|key, value| value == 'Mario'} ).to eq(1)
  end

  it 'count the number of matches' do
    expect(range.my_count(45) ).to eq(1)
  end
end
