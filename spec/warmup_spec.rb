require 'warmup'
require 'spec_helper'

describe Warmup do
  let(:warmup) { Warmup.new }

  describe '#gets_shout' do

    it 'returns a capitalized message based on user input' do
      allow(warmup).to receive(:gets).and_return("hello")
      expect(warmup.gets_shout).to eq("HELLO")
    end

  end

  describe '#triple_size' do
    it "returns triple the size" do 
      array_double = double(:size => 6)
      expect(warmup.triple_size(array_double)).to eq(18)
    end
  end  

  describe '#calls_some_methods' do
    # turn into let 
    string = "asds"
    it 'passed in string responds to upcase call' do
    
      allow(string).to receive(:upcase!).and_return("ASDS")
      expect(string).to receive(:upcase!)#.and_return("hello")
      #expect(string).to eq("hello")
      warmup.calls_some_methods(string)
    
    end

    it 'passed in string responds to reverse method call' do
      allow(string).to receive(:reverse!).and_return("hello")
      expect(string).to receive(:reverse!)#.and_return("hello")
      warmup.calls_some_methods(string)  
    end

    it 'returns an object different than the one passed in' do
      expect(warmup.calls_some_methods("Hello")).to eq("I am unrelated")
    end
  end

end

