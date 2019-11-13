# frozen_string_literal: true

require_relative '../enumerables.rb'

RSpec.describe 'my_any?' do
  let(:array) { [1, 2, 3, 4] }
  let(:range) { (1..875) }
  let(:hash) { { Name: 'Mario', LastName: 'Dena' } }
  let(:t_array) { [] }

  it 'should return false for empty' do
    expect([].my_any?).to be_falsy
  end

  it 'should return true if at least 1 element match' do
    expect(range.my_any?(Integer)).to be_truthy
  end

  it 'should return false if at least 1 element match' do
    expect(range.my_any?(2)).to be_truthy
  end

  it 'should work with blocks (yield)' do
    expect(array.my_any? { |value| value == 3 }).to be_truthy
  end
end
