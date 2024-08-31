require 'rspec'
require_relative '../src/string_calculator'

RSpec.describe StringCalculator do
  it 'returns 0 for an empty string' do
    expect(StringCalculator.add("")).to eq(0)
  end

  it 'returns the number itself for a single number' do
    expect(StringCalculator.add("1")).to eq(1)
  end

  it 'returns the sum of two numbers separated by a comma' do
  	expect(StringCalculator.add("1,5")).to eq(6)
	end


end
