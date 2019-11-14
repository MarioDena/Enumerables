# frozen_string_literal: true

require_relative '../enumerables.rb'

RSpec.describe 'my_inject' do
  let(:array) { [1, 2, 3, 4] }
  let(:range) { (1..875) }
  let(:hash) { { Name: 'Mario', LastName: 'Dena' } }
  let(:t_array) { [] }

  it 'should work with blocks (yield)' do
    expect(array.my_inject(0) { |x, y| x + y }).to eq(10)
  end

  it 'should work with simbols' do
    expect(array.inject(:*)).to eq(24)
  end

  it 'should inject the arguments and work with blocks (yield)' do
    expect(array.my_inject(12) { |x, y| x + y }).to eq(22)
  end
end
