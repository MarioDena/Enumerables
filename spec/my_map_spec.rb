# frozen_string_literal: true

require_relative '../enumerables.rb'

RSpec.describe 'my_map' do
  let(:array) { [1, 2, 3, 4] }
  let(:t_array) { [] }

  it 'should yields its values (work with blocks)' do
    array.my_map { |x| t_array << x }
    expect(t_array).to eq(array)
  end

  it 'should map new values' do
    t_array = array.my_map { |x| x * 2 }
    expect(t_array).to eq([2, 4, 6, 8])
  end

  it 'should filter undesired values' do
    t_array = array.my_map { |n| n if n > 2 }
    expect(t_array).to eq([nil, nil, 3, 4])
  end
end
