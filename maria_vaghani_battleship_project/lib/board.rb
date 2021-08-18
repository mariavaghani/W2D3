class Board

  #  /////// PART 1 ///////////

  attr_reader :size
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](position_arr)
    @grid[position_arr[0]][position_arr[1]]
  end

  def []=(position_arr, value)
    @grid[position_arr[0]][position_arr[1]] = value
  end

  def num_ships
    @grid.flatten.count { |position| position == :S }
  end

  #  /////// PART 2 ///////////

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    ships_to_place = (@size * 0.25).floor
    
    while ships_to_place > 0
      @grid.each_with_index do |row, row_idx|
        row.each_with_index do |col_ele, col_idx|
          @grid[row_idx][col_idx] = [:N, :S].sample
          ships_to_place -= 1 if @grid[row_idx][col_idx] == :S
          return @grid if ships_to_place == 0
        end
      end
    end
  end

  def hidden_ships_grid
    hidden_ships = []

    @grid.each_with_index do |row, row_idx|
      hidden_ships << []
      row.each_with_index do |col_ele, col_idx|
        hidden_ships[row_idx] << @grid[row_idx][col_idx]
        hidden_ships[row_idx][col_idx] = :N if col_ele == :S
      end
    end
    hidden_ships
  end

  def self.print_grid(grid_to_print)
    grid_to_print.each { |row| puts row.join(" ")}
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
