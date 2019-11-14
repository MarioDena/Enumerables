# frozen_string_literal: true

require_relative '../enumerables.rb'

RSpec.describe 'my_select?' do
  let(:array) { [1, 2, 3, 4] }
  let(:range) { (1..875) }
  let(:t_array) { [] }

  it 'should return an Enumerator' do
    expect(array.my_select).to be_instance_of(Enumerator)
  end

  it 'should return an empty collection' do
    expect(range.my_select { false }).to be_empty
  end

  it 'should work as a filter' do
    t_array = array.my_select { |n| n if n > 2 }
    expect(t_array).to eq([3, 4])
  end
end
