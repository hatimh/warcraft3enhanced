require_relative 'spec_helper'

#Barracks test loses half health by footman's attack power

describe Unit do

  before :each do
    @unit = Unit.new(100,10)
  end

  describe "#dead?" do
    it "should give false if unit is alive " do
      #check unit created to be alive obviously?
      expect(@unit.dead?).to be_falsey
    end
  end

  describe "#dead?" do
    it "should give true if unit is dead (HP=0)" do
      #check unit \to be dead if HP = 0 ?
      #@unit.health_points = 0
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.dead?).to be_truthy
    end
  end

  describe "#dead?" do
    it "should give true if unit is dead (HP<0)" do
      #check unit \to be dead if HP = 0 ?
      #@unit.health_points = -5
      expect(@unit).to receive(:health_points).and_return(-5)
      expect(@unit.dead?).to be(true) 
    end
  end
  
end
