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
  
  it 'returns the sum of multiple numbers separated by commas' do
  	expect(StringCalculator.add("1,2,3,4")).to eq(10)
	end
  
  it 'returns the sum of numbers separated by new lines' do
   expect(StringCalculator.add("1\n2,3")).to eq(6)
	end

	it 'supports different delimiters' do
  	expect(StringCalculator.add("//;\n1;2")).to eq(3)
	end

	it 'raises an error for negative numbers' do
  	expect { StringCalculator.add("1,-2,3") }.to raise_error("Negative numbers not allowed: -2")
	end
  
  it 'ignores numbers greater than 1000' do
  	expect(StringCalculator.add("2,1001")).to eq(2)
  	expect(StringCalculator.add("1000,1001,2")).to eq(1002)
	end

	it 'supports delimiters of any length' do
  	expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
	end

	it 'supports multiple delimiters' do
    expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
  end

  it 'supports multiple delimiters with length longer than one char' do
  	expect(StringCalculator.add("//[***][%%]\n1***2%%3")).to eq(6)
	end







end
