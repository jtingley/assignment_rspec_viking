require 'viking'
require 'spec_helper'

describe Viking do
  let(:viking) { Viking.new('Bob', 150) }


  describe "#initialize" do

    it "assigns a new viking to the name passed" do
      expect(viking.name).to eq('Bob')
    end

    it "assigns viking 150 health points" do
      expect(viking.health).to eq(150)
    end

    it "health points cannot be overwritten" do    
      expect{viking.health = 44}.to raise_error(NoMethodError)
    end

    it "A viking's weapon starts out nil by default" do
      expect(viking.weapon).to eq(nil)
    end
  end


  describe '#pick_up_weapon' do

    it "Viking can pick up a weapon" do
      viking.pick_up_weapon(Axe.new)
      expect(viking.weapon.name).to eq("Axe")
    end    

    it "exception is raised when picking up an invalid weapon" do
          

      expect{viking.pick_up_weapon('lightsabre')}.to raise_error(RuntimeError)
    end    

    it "Viking can pick up a weapon" do

      weapon = double(is_a?: true)
      viking.pick_up_weapon(weapon)

      expect(viking.weapon).to eq(weapon)
    end


  end  

  describe '#drop_weapon' do

    it "drops viking's current weapon" do

      viking.pick_up_weapon(Axe.new)
      viking.drop_weapon

      expect(viking.weapon).to eq(nil)
    end   
  end

  describe '#receive_attack' do

    it "reduces viking's health by X amount" do

      viking.receive_attack(3)

      expect(viking.health).to eq(147)
    end

   it "calls the take_damage method" do
      
    end

  end 

  describe ""




end