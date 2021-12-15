require './lib/ship'

class Cell
  attr_reader :coordinate,
              :ship,
              :shot_at

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
    @shot_at = true && @ship.hit unless @ship.nil?
  end

  def fired_upon?
    @shot_at
  end

  def render(show = false)
    if @ship.nil? && @shot_at == true
      "M"
    elsif !@ship.nil? && @ship.sunk? == true
      "X"
    elsif !@ship.nil? && @shot_at == true
      "H"
    elsif show == true && !ship.nil?
      "S"
    elsif show == true && ship.nil?
      "."
    else
      "."
    end
  end
end
