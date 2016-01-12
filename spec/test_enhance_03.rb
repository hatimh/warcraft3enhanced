require_relative 'spec_helper'

#Barracks test loses half health by footman's attack power

describe Unit do

  before :each do
    @alive = Unit.new(50,10)
    @dead = Unit.new(0,10)
  end

  describe "#attack!" do
    it "should give nil if receiver is dead " do
      #check unit created to be alive obviously?
      expect(@alive.attack!(@dead)).to be(nil)
    end
    it "should give nil if attacker is dead" do
      #check unit created to be alive obviously?
      expect(@dead.attack!(@alive)).to be(nil)
    end
  end

end
