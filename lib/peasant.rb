class Peasant < Unit
  attr_accessor :attack_power
  attr_reader :health_points
  
  def initialize
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
   super(35,0)  
  end

end
