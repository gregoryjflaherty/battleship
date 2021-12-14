require './lib/cell'
require './lib/ship'

class Board
  attr_reader :cells, :height, :length

  def initialize(length = get_length.to_i, height = get_height)
    @height = height
    @length = length
    @cells = Hash.new { |hash, key| hash[key] = nil}
    @height.each do |letter|
      @length.times do |num| #where 4 is replaceable by some value x by user in it 4
        @cells["#{letter}#{num + 1}"] = Cell.new("#{letter}#{num + 1}")
      end
    end
  end

  def get_length
    puts "How many rows do you want the board? "
    @length = gets.chomp
  end

  def get_height
    puts "How many columns do you want the board? "
    input = gets.chomp
    letters = ("A".."Z").to_a
    @height = letters.slice!(0, input.to_i)
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def cells_empty?(coord_array)  #### CHANGED
    coord_array.all? {|coordinate| @cells[coordinate].empty?}
  end

  def valid_placement?(ship, coord_array) ###CHANGED
    if cells_empty?(coord_array) == true
      if coord_array.length == ship.length && equal_letters?(coord_array)
        nums_increase_1?(coord_array)
      elsif coord_array.length == ship.length
        valid_vertical?(coord_array) #If true, then nums_identical && letters_increase_1
      else
        false #Ship length is not correct
      end
    else
      false
    end
  end

  def equal_letters?(coord_array) ###CHANGED
    coord_array.all? {|coord|coord[0] == coord_array[0][0]}
  end

  def nums_increase_1?(coord_array)  ###CHANGED
    num_array = coord_array.map {|coord| coord.delete(coord[0])}
    num_array.each_cons(2).all? {|x,y| y.to_i == x.to_i + 1}
  end

  def nums_identical?(coord_array)  ##CHANGED
    num_array = coord_array.map {|coord| coord.delete(coord[0])}
    num_array.each_cons(2).all? {|x,y| y.to_i == x.to_i}
  end

  def letters_increase_1?(coord_array) ###CHANGED
    coord_array.each_cons(2).all? {|x,y| y[0].ord == x[0].ord + 1}
  end

  def valid_vertical?(coord_array)
    nums_identical?(coord_array) == true ? letters_increase_1?(coord_array) : false
  end

  def place(ship, coord_array) ##CHANGED
    valid_placement?(ship, coord_array) == true ?
      coord_array.each {|coordinate| @cells[coordinate].place_ship(ship) } :
      'Invalid placement'
  end

  def render(show = false)
    print_array = ["   "]
    #print_array << "  "
    @length.times do |num|
      if num < 9
        print_array << "#{num + 1}   "
      else
        print_array << "#{num + 1}  "
      end
    end
    print_array << "\n"
    @height.each do |letter|
      print_array << "#{letter} "
      @length.times do |num| #where 4 is replaceable by some value x by user in it 4
        print_array << " #{@cells["#{letter}#{num + 1}"].render(show)}  "
      end
      print_array << "\n"
    end
    return print_array.join
  end
end


=begin
def render(show = false)
  print_array = ["  "]
  #print_array << "  "
  @length.times {|num|print_array << "#{num + 1} "} #where 4 is replaceable by some value x by user in it 4
  print_array << "\n"
  @height.each do |letter|
    print_array << "#{letter} "
    @length.times do |num| #where 4 is replaceable by some value x by user in it 4
      print_array << "#{@cells["#{letter}#{num + 1}"].render(show)} "
    end
    print_array << "\n"
  end
  return print_array.join
end
=end
