class Unit
  attr_accessor :attack_power
  attr_reader :health_points
  
  def initialize(health,attack)
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
    @health_points = health
    @attack_power = attack   
  end

  def damage(attack)
    @health_points -= attack

  end

  def attack!(unit)
    unit.damage(@attack_power)
  end  

end
