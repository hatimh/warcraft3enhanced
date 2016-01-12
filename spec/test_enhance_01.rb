require_relative 'spec_helper'

#Barracks test loses half health by footman's attack power

describe Barracks do

  before :each do
    @barracks = Barracks.new
    @footman = Footman.new
  end

  describe "#damage" do
    it "should reduce the barrack's health_points by the half attack_power specified" do
      @footman.attack!(@barracks)
      expect(@barracks.health_points).to eq(495) # HP started at 500 but just got hit by 5 
    end
  end
  
end
