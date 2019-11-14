# frozen_string_literal: true

require_relative '../enumerables.rb'

RSpec.describe 'my_each' do
  let(:array) { [1, 2, 3, 4] }
  let(:range) { (1..875) }
  let(:hash) { { Name: 'Mario', LastName: 'Dena' } }

  it 'returns enumerator for hash' do
    expect(hash.my_each).to be_instance_of(Enumerator)
  end

  it 'iterate over every value inside an array' do
    counter = 0
    array.my_each { counter += 1 }
    expect(counter).to eq(array.size)
  end

  it 'iterate over every value inside a range' do
    counter = 0
    range.my_each { counter += 1 }
    expect(counter).to eq(range.size)
  end

  it 'iterate over every value inside a hash' do
    counter = 0
    hash.my_each { counter += 1 }
    expect(counter).to eq(hash.size)
  end
end
