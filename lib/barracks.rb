class Barracks
  attr_accessor :gold, :food
  def initialize
    @gold = 1000
    @food = 80
  end
  def can_train_footman?
    (@gold > 134) && (@food > 1)

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
    (@gold > 89) && (@food > 4)

  end
   def train_peasant
    if can_train_peasant?
    @gold -= 90
    @food -= 5
    return Peasant.new
    end
    nil
  end
   
end
