require "byebug"

class Board
  attr_reader :size

  def initialize(n)
    @board = Array.new(n) { Array.new(n, "_") }
    @size = n - 1
  end

  def [](position_arr)
    @board[position_arr[0]][position_arr[1]]
  end

  def []=(position_arr, value)
    @board[position_arr[0]][position_arr[1]] = value
  end

  def valid?(position_arr)
    (0...@board.length).include?(position_arr[0]) && (0...@board[0].length).include?(position_arr[1]) && empty?(position_arr)
  end

  def empty?(position_arr)
    self[position_arr] == "_"
  end


  def place_mark(position_arr, mark)
    if valid?(position_arr) & empty?(position_arr)
      self[position_arr] = mark
    else
      raise "the position is invalid"
    end
  end

  def print
    puts "============="
    @board.each { |row| puts row.join(" ") }
    puts ""
    puts "============="
  end

  def win_row?(mark)
    @board.any? { |row| row.all? { |ele| ele == mark } }
  end

  def win_col?(mark)
    (0...@board[0].length).each do |col_idx|
      return true if (0...@board.length).all? {|row_idx| @board[row_idx][col_idx] == mark } 
    end
    false
  end

  def win_diagonal?(mark)
    diagonal_1, diagonal_2 = true, true
    # check diagonal 1
    (0...@board.length).each do |row_idx|
      # debugger
      if @board[row_idx][row_idx] != mark
        diagonal_1 = false
        break
      end

    end

    # check diagonal 2
    (0...@board.length).each do |row_idx|
      if @board[row_idx][-(row_idx+1)] != mark
        diagonal_2 = false
        break
      end
    end

    diagonal_1 || diagonal_2
  end

  def win?(mark)
    win_row?(mark) || win_diagonal?(mark) || win_col?(mark)
  end

  def empty_positions?
    @board.flatten.any? { |ele| ele == "_"}
  end
end