class SiegeEngine < Unit
  attr_accessor :health_points, :attack_power
  def initialize
    super(400,50)
  end
end  