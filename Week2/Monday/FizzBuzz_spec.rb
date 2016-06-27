require 'rspec'
require './FizzBuzz'

describe 'FizzBuzz' do
    it 'when devisable by 3 returns Fizz' do
      result = FizzBuzz.new.calc(3)
      expect(result).to eq("Fizz")
    end
    it 'when devisable by 5 returns Buzz' do
      result = FizzBuzz.new.calc(25)
      expect(result).to eq("Buzz")
    end
    it 'when devisable by 5 and 3returns FizzBuzz' do
      result = FizzBuzz.new.calc(15)
      expect(result).to eq("FizzBuzz")
    end
    it 'when devisable by neither 5 and 3 returns Fizz' do
      result = FizzBuzz.new.calc(7)
      expect(result).to eq(7)
    end
  end
