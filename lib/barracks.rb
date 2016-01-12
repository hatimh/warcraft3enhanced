class Barracks  < Building
  attr_accessor :gold, :food, :health_points, :lumber

  def initialize
    super(500)
    #@health_points = 500
    @gold = 1000
    @food = 80
    @lumber = 500
  end

  def can_train_footman?
    (gold > 134) && (food > 1)

  end

  def train_footman
    if can_train_footman?
    @gold -= 135
    @food -= 2
    return Footman.new
    end
    nil
  end

  def can_train_peasant?
    (gold > 89) && (food > 4) # without @ it is just reading it, otherwise its a 'setter'

  end

  def train_peasant
    if can_train_peasant?
    @gold -= 90
    @food -= 5
    return Peasant.new
    end
    nil
  end
  
  def can_train_siege?
    (gold > 199) && (food > 2 ) && (lumber>59)

  end

  def train_siege
    if can_train_siege?
    @gold -= 200
    @food -= 3
    @lumber -= 60
    return SiegeEngine.new
    end
    nil
  end  
   
end
