require_relative 'spec_helper'

describe SiegeEngine do
  before :each do
    @siege = SiegeEngine.new
    @peasant = Peasant.new
    @footman = Footman.new
    @building = Building.new(500)
  end
    it "is an instance of SiegeEngine" do #check for its constructor
    expect(@siege).to be_a SiegeEngine
  end
  describe "#attack!" do
    it "does 0 damage to footman" do
      @siege.attack!(@footman)
      expect(@footman.health_points).to eq(60)
    end
    it "does 0 damage to peasant" do
      @siege.attack!(@peasant)
      expect(@peasant.health_points).to eq(35)
    end
    it "does default damage to another siege" do
      @siege.attack!(@siege)
      expect(@siege.health_points).to eq(350)
    end
    it "does twice damage to buildings" do
      @siege.attack!(@building)
      expect(@building.health_points).to eq(400)
    end
  end
end

# verify costs associated with making a SiegeEngine
describe Barracks do
  before :each do
    @barracks = Barracks.new
  end  
  describe "#train_siege" do
    it "costs 200 gold" do
      @barracks.train_siege
      expect(@barracks.gold).to eq(800) # starts at 1000
    end
    it "costs 3 food" do
      @barracks.train_siege
      expect(@barracks.food).to eq(77) # starts at 80
    end
    it "costs 60 lumber" do
      @barracks.train_siege
      expect(@barracks.lumber).to eq(440) # starts at 500
    end
    it "does not train a siege if there aren't enough resources" do
      expect(@barracks).to receive(:can_train_siege?).and_return(false)
      expect(@barracks.train_siege).to be_nil
    end
    it "trains a siege if there are enough resources" do
      expect(@barracks).to receive(:can_train_siege?).and_return(true)
      expect(@barracks.train_siege).to be_a(SiegeEngine)
    end
  end
    describe "#can_train_siege?" do
    it "returns true if there are enough resources to train a siege" do      
      expect(@barracks.can_train_siege?).to be_truthy
    end
    it "returns false if there isn't enough food" do
     
      expect(@barracks).to receive(:food).and_return(2)
      expect(@barracks.can_train_siege?).to be_falsey
    end
    it "returns false if there isn't enough gold" do
      expect(@barracks).to receive(:gold).and_return(199)
      expect(@barracks.can_train_siege?).to be_falsey
    end
    it "returns false if there isn't enough lumber" do
      expect(@barracks).to receive(:lumber).and_return(59)
      expect(@barracks.can_train_siege?).to be_falsey
    end
  end
end
#check for damage