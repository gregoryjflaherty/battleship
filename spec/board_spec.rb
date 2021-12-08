require "./lib/board"

RSpec.describe Board do
  it 'exists' do
    board = Board.new
    expect(board).to be_an_instance_of(Board)
  end

  it 'has cells' do
    board = Board.new
    expect(board.cells).to be_a(Hash)
    expect(board.cells.size).to be(16)
  end

  it 'can validate coordinate' do
    board = Board.new
    expect(board.valid_coordinate?("A1")).to be(true)
    expect(board.valid_coordinate?("D4")).to be(true)
    expect(board.valid_coordinate?("A5")).to be(false)
    expect(board.valid_coordinate?("E1")).to be(false)
    expect(board.valid_coordinate?("A22")).to be(false)
  end

  it 'can validate coordinate and ship length'  do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be(false)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be(false)
  end

  it 'can validate coordinates are consecutive'  do
    board = Board.new
    submarine = Ship.new("Submarine", 2)
    cruiser = Ship.new("Cruiser", 3)
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be(false)
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to be(false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be(false)
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to be(false)
  end

  it 'can validate coordinates are not diagonal'  do
    board = Board.new
    submarine = Ship.new("Submarine", 2)
    cruiser = Ship.new("Cruiser", 3)
    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be(false)
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to be(false)
  end
end
