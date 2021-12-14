require './lib/cell'
require './lib/ship'

class Board
  attr_reader :cells

  def initialize
    letters = %w( A B C D )#.values_at method
    @cells = Hash.new { |hash, key| hash[key] = nil}
    letters.each do |letter|
      4.times do |num| #where 4 is replaceable by some value x by user in it 4
        @cells["#{letter}#{num + 1}"] = Cell.new("#{letter}#{num + 1}")
      end
    end
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, coord_array)

    coord_array.each do |coordinate|
      if valid_coordinate?(coordinate) == true && @cells[coordinate].empty? == true #Highlight this line in our readme
        next
      else
        return false
      end
    end

    if coord_array.length == ship.length && equal_letters?(coord_array)
      nums_increase_1?(coord_array)
    elsif coord_array.length == ship.length
      valid_vertical?(coord_array) #If true, then nums_identical && letters_increase_1
    else
      false #Ship length is not correct
    end
  end

  def equal_letters?(coord_array)
    coord_array.all? {|coord|coord[0] == coord_array[0][0]}
  end

  def nums_increase_1?(coord_array)
    coord_array.each_cons(2).all? {|x,y| y[-1].to_i == x[-1].to_i + 1}
  end

  def nums_identical?(coord_array)
    coord_array.each_cons(2).all? {|x,y| y[-1].to_i == x[-1].to_i}
  end

  def letters_increase_1?(coord_array)
    coord_array.each_cons(2).all? {|x,y| y[0].ord == x[0].ord + 1}
  end

  def valid_vertical?(coord_array)
    nums_identical?(coord_array) == true ? letters_increase_1?(coord_array) : false
  end

  def place(ship, coord_array)
    valid_placement?(ship, coord_array) == true ?
      coord_array.each {|coordinate| @cells[coordinate].place_ship(ship) } :
      'Invalid placement'
  end

  def render(show = false)
    letters = %w( A B C D )#.values_at method
    print_array = []

    print_array << "  "
    4.times do |num| #where 4 is replaceable by some value x by user in it 4
      print_array << "#{num + 1} "
    end
    print_array << "\n"
    letters.each do |letter|
      print_array << "#{letter} "
      4.times do |num| #where 4 is replaceable by some value x by user in it 4
        print_array << "#{@cells["#{letter}#{num + 1}"].render(show)} "
      end
      print_array << "\n"
    end
    print_array.join
  end
end
