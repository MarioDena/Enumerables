# frozen_string_literal: true

require_relative '../enumerables.rb'

RSpec.describe 'my_none?' do
  let(:array) { [1, 2, 3, 4] }

  it 'should return true for empty arrays' do
    expect([].my_none?).to be_truthy
  end

  it 'should return false if any elements match with classes' do
    expect(array.my_none?(Integer)).to be_falsy
  end

  it 'should return true if any elements match' do
    expect(array.my_all?(2)).to be_falsy
  end
  
end
