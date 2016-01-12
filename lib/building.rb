class Building
  attr_accessor  :health_points
  def initialize(health_points)
     @health_points = health_points
  end
  def damage(attack_power)
    @health_points -= (attack_power.to_f/2).ceil
  end 
  def dead?
    health_points <= 0
  end
  def damage(attack)
    @health_points -= attack
  end
end
