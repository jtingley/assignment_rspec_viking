require 'viking'
require 'spec_helper'

describe Viking do
  let(:viking) { Viking.new('Bob', 150) }
  let(:victim) { Viking.new('Greg', 100) }


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
      
      expect(viking).to receive(:take_damage).with(5)
      viking.receive_attack(5)    

    end

  end 

  describe '#attack' do

    it 'lowers opponents health when they are attacked' do

      viking.attack(victim)

      expect(victim.health).to be < 100
    
    end

    it 'attacking another viking calls that viking\'s take damage method' do
      expect(victim).to receive(:take_damage)
      viking.attack(victim)
    end

    # it 'calls damage with fist when attacks with no weapon' do
    #   # viking.attack(victim)
    #   expect(viking.attack(victim)).to receive(:damage_with_fists)
    # end

    it 'calls damage with fists when attacking with no weapon' do
      expect(viking).to receive(:damage_with_fists)
      viking.attack(victim)
    end
  end




end