require 'warmup'
require 'spec_helper'

describe Warmup do
  describe '#gets_shout' do
    let(:warmup) { Warmup.new }

    it 'returns a capitalized message based on user input' do
      allow(warmup).to receive(:gets).and_return("hello")
      expect(warmup.gets_shout).to eq("HELLO")
    end

  end

end