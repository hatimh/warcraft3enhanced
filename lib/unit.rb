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
    return nil if self.dead? || unit.dead?
    if self.is_a? SiegeEngine
      return unit.damage(@attack_power*2) if unit.is_a? Building
      return unit.damage(@attack_power*0) if !(unit.is_a? SiegeEngine)
    end  
    if self.is_a? Footman
      return unit.damage(@attack_power*0.5) if unit.is_a? Building
    end
    unit.damage(@attack_power)
  end  

  def dead?
    health_points <= 0
  end  
end
