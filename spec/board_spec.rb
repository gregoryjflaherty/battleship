require "./lib/ship"
require "./lib/cell"
require "./lib/board"

RSpec.describe Board do
  it 'exists' do
    board = Board.new
    expect(board).to be_an_instance_of(Board)
  end

  it 'has cells' do
    board = Board.new
    expect(board.cells).to be_a(Hash)
    expect(board.cells.size).to eq(16)
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

  it 'can validate good placement'  do
    board = Board.new
    submarine = Ship.new("Submarine", 2)
    cruiser = Ship.new("Cruiser", 3)
    expect(board.valid_placement?(submarine, ["A1", "A2"])).to be(true)
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be(true)
  end

  it 'can place a cruiser'  do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    board.place(cruiser, ["A1", "A2", "A3"])

    expect(cell_1.ship).to be(cruiser)
    expect(cell_2.ship).to be(cruiser)
    expect(cell_3.ship).to be(cruiser)
  end

  it 'can place a submarine' do
    board = Board.new
    submarine = Ship.new("Submarine", 2)
    cell_4 = board.cells["C1"]
    cell_5 = board.cells["D1"]
    board.place(submarine, ["C1", "D1"])

    expect(cell_4.ship).to be(submarine)
    expect(cell_5.ship).to be(submarine)
  end

  it 'places the same submarine in every cell' do
    board = Board.new
    submarine = Ship.new("Submarine", 2)
    cell_4 = board.cells["C1"]
    cell_5 = board.cells["D1"]
    board.place(submarine, ["C1", "D1"])

    expect(cell_4.ship).to eq(cell_5.ship)
  end

  it 'places the same cruiser in every cell'  do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    board.place(cruiser, ["A1", "A2", "A3"])

    expect(cell_1.ship).to eq(cell_2.ship)
    expect(cell_2.ship).to eq(cell_3.ship)
  end

  it 'denies overlapping ships'  do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(submarine, ["A1", "B1"])).to be(false)
  end

  it 'renders'  do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    board.render

    expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
  end

  it 'renders true'  do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    board.render(true)

    expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  end
end
