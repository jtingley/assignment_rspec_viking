require 'viking'
require 'spec_helper'

describe Bow do
  let(:bow) { Bow.new }
  
  describe "#initialize" do

    it "a bow's arrow count is readable" do 
      expect{bow.arrows}.to_not raise_error(NoMethodError)
    end


    it "starts with 10 arrows" do 
      expect(bow.arrows).to eq(10)
    end

    it "starts with specified amount of arrows" do 

      arrow_quantity = 25

      expect(Bow.new(arrow_quantity).arrows).to eq(arrow_quantity)
      
    end  
  end

  describe "#use" do 
    it "reduces arrows by one" do 
      original_count = bow.arrows
      bow.use      
      new_count = original_count - 1

      expect(bow.arrows).to eq(new_count)
    end

    it "raises error when bow has 0 arrows" do 
      invalid = double(out_of_arrows?: true)
      expect{Bow.use(0)}.to 
    end

  end


end