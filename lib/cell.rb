class Cell
  attr_reader :coordinate, :ship, :shot_at

  def initialize(coordinate)
    @coordinate = coordinate
    @ship       = nil
    @shot_at    = false
  end

  def place_ship(ship)
    @ship = ship
  end

  def empty?
    @ship.nil? ? true : false
  end

  def fire_upon
    @shot_at = true
    @ship.hit
  end

  def fired_upon?
    @shot_at
  end

end
