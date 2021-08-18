require_relative "game"


board = Board.new()

position_arr = [1, 1]


begin
  puts "=============================="
  board.place_mark([-1, 2], :X)
rescue
  puts "Place mark was not successful, as it should - GREAT"
end

begin
  puts "=============================="
  board.place_mark([0, 1], :X)
  board.place_mark([1, 0], :O)
  puts "Mark put was successful, as it should - GREAT"
rescue 
  puts "Mark put was not successful, FAIL"
end

begin
  puts "=============================="
  board.print
  puts "Print method works - GREAT"
rescue
  puts "Print method was not successful, FAIL"
end

begin
  puts "=============================="
  board = Board.new()
  board.place_mark([0, 1], :X)
  board.place_mark([1, 0], :X)
  board.place_mark([1, 1], :X)
  p board.win_row?(:X)
  # board.print
  board.place_mark([1, 2], :X)
  p board.win_row?(:X)
  # board.print
  puts "win_row method works GREAT"
rescue
  puts "win_row method was not successful, FAIL"
end


begin
  puts "=============================="
  board = Board.new()
  board.place_mark([0, 1], :X)
  board.place_mark([1, 1], :X)
  board.place_mark([0, 2], :X)
  if board.win_col?(:X) != false
    raise "win_col method was not successful"
  end
  puts "passed win_row false - GREAT"
  # board.print
  board.place_mark([2, 1], :X)
  if board.win_col?(:X) != true
    raise "win_col method was not successful"
  end
  # board.print

  puts "win_col method works GREAT"
rescue
  puts "win_col method was not successful, FAIL"
end

# #win_diagonal?

begin
  puts "=============================="
  board = Board.new()
  board.place_mark([0, 0], :X)
  board.place_mark([1, 1], :X)
  board.place_mark([0, 2], :X)
  # board.print
  if board.win_diagonal?(:X) != false
    raise "win_diagonal method was not successful"
  end
  puts "passed win_diagonal false - GREAT"
  board.place_mark([2, 2], :X)
  # board.print
  if board.win_diagonal?(:X) != true
    raise "win_diagonal method was not successful"
  end

  puts "win_diagonal method works for diagonal 1 GREAT"
rescue
  puts "win_diagonal method was not successful, FAIL"
end

begin
  puts "=============================="
  board = Board.new()
  board.place_mark([0, 0], :X)
  board.place_mark([0, 2], :X)
  board.place_mark([1, 1], :X)
  # board.print
  if board.win_diagonal?(:X) != false
    raise "win_diagonal method was not successful"
  end
  puts "passed win_diagonal false - GREAT"
  board.place_mark([2, 0], :X)
  # board.print
  if board.win_diagonal?(:X) != true
    raise "win_diagonal method was not successful"
  end

  puts "win_diagonal method works for diagonal 2 GREAT"
rescue
  puts "win_diagonal method was not successful, FAIL"
end

# win?



begin
  puts "=============================="
  board = Board.new()
  board.place_mark([0, 0], :X)
  board.place_mark([0, 2], :X)
  board.place_mark([1, 1], :X)
  # board.print
  if board.win?(:X) != false
    raise "win? method was not successful"
  end
  puts "passed win? false - GREAT"
  board.place_mark([2, 0], :X)
  # board.print
  if board.win?(:X) != true
    raise "win? method was not successful"
  end

  puts "win? method works for diagonal 2 GREAT"
rescue
  puts "win? method was not successful, FAIL"
end

# empty_positions?

begin
  puts "=============================="
  board = Board.new()
  board.place_mark([0, 0], :X)
  board.place_mark([0, 1], :X)
  board.place_mark([0, 2], :X)
  # board.print
  if board.empty_positions? != true
    raise "empty_positions? method was not successful"
  end
  puts "passed empty_positions? true - GREAT"
  board.place_mark([1, 0], :X)
  board.place_mark([1, 1], :X)
  board.place_mark([1, 2], :X)
  board.place_mark([2, 0], :X)
  board.place_mark([2, 1], :X)

  # board.print
  if board.empty_positions? != true
    raise "empty_positions? method was not successful"
  end
  board.place_mark([2, 2], :X)

  # board.print
  if board.empty_positions? != false
    raise "empty_positions? method was not successful"
  end
  puts "empty_positions? method works GREAT"
rescue
  puts "empty_positions? method was not successful, FAIL"
end

###### HumanPlayer //

begin
  puts "=============================="
  board = Board.new()
  player = HumanPlayer.new(:X)
  player.mark
  puts "Player created with mark :X - GREAT"
rescue => exception
  puts "Unable to create player: #{exception.message}"
end

begin
  puts "=============================="
  board = Board.new()
  player = HumanPlayer.new(:X)
  player.mark
  # board.place_mark(player.get_position, player.mark)
  # board.print

rescue => exception
  puts "Unable to get position from player and place it in the board: #{exception.message}"
end

begin
  puts "=============================="
  game = Game.new(:X, :O)
  puts "initial setup"
  p game
  game.switch_turn
  puts "player switched"
  p game
  game.switch_turn
  puts "player switched again"
  p game
  # player = HumanPlayer.new(:X)
  # player.mark
  # board.place_mark(player.get_position, player.mark)
  # board.print
rescue => exception
  puts "Unable to get position from player and place it in the board: #{exception.message}"
end