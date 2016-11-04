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

  

end

