require_relative "game"

puts "Enter the board size:"
n = 5
board = Board.new(n)

position_arr = [1, 1]


begin
  puts "1=============================="
  board.place_mark([-1, 2], :X)
rescue
  puts "Place mark was not successful, as it should - GREAT"
end

begin
  puts "2=============================="
  board.place_mark([0, 1], :X)
  board.place_mark([1, 0], :O)
  puts "Mark put was successful, as it should - GREAT"
rescue 
  puts "Mark put was not successful, FAIL"
end

begin
  puts "3=============================="
  board.print
  puts "Print method works - GREAT"
rescue
  puts "Print method was not successful, FAIL"
end

begin
  puts "4=============================="
  board = Board.new(n)
  (0...n-1).each { |idx| board.place_mark([0, idx], :X) }
  if !board.win_row?(:X)
    puts "false - GREAT"
  else
    puts "win, when it is not win, FAIL"
  end
  # board.print
  board.place_mark([0, n-1], :X)
  if board.win_row?(:X)
    puts "Works, GREAT"
  else
    puts "no win, when it is a win, FAIL"
  end
  # board.print
  puts "win_row method runs GREAT"
rescue
  puts "win_row method was not successful, FAIL"
end


begin
  puts "5=============================="
  board = Board.new(n)
  (0...n-1).each { |idx| board.place_mark([idx, 0], :X) }
  if board.win_col?(:X) != false
    raise "win_col method was not successful FAIL"
  else
    puts "no win as it should GREAT"
  end
  puts "passed win_row false - GREAT"
  # board.print
  board.place_mark([n-1, 0], :X)
  if board.win_col?(:X) != true
    raise "win_col method was not successful FAIL"
  else
    puts "wins as it should GREAT"
  end
  # board.print

  puts "win_col method works GREAT"
rescue
  puts "win_col method was not successful, FAIL"
end

# #win_diagonal?

begin
  puts "6=============================="
  board = Board.new(n)
  (0...n-1).each { |idx| board.place_mark([idx, idx], :X) }
  
  # board.print
  if board.win_diagonal?(:X) != false
    raise "win_diagonal method was not successful"
  end
  puts "passed win_diagonal false - GREAT"
  board.place_mark([n-1, n-1], :X)
  # board.print
  if board.win_diagonal?(:X) != true
    raise "win_diagonal method was not successful"
  end

  puts "win_diagonal method works for diagonal 1 GREAT"
rescue
  puts "win_diagonal method was not successful, FAIL"
end

begin
  puts "7=============================="
  board = Board.new(n)

  (0...n-1).each do |idx|
    idx_2 = n - idx - 1
    board.place_mark([idx, idx_2], :X) 

  end

  # board.print
  if board.win_diagonal?(:X) != false
    raise "win_diagonal method was not successful"
  end
  puts "passed win_diagonal false - GREAT"
  board.place_mark([n-1, 0], :X)
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
  puts "8=============================="
  board = Board.new(n)
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
  puts "9=============================="
  board = Board.new(n)
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
  puts "10=============================="
  board = Board.new(n)
  player = HumanPlayer.new(:X)
  player.mark
  puts "Player created with mark :X - GREAT"
rescue => exception
  puts "Unable to create player: #{exception.message}"
end

begin
  puts "11=============================="
  board = Board.new(n)
  player = HumanPlayer.new(:X)
  player.mark
  # board.place_mark(player.get_position, player.mark)
  # board.print

rescue => exception
  puts "Unable to get position from player and place it in the board: #{exception.message}"
end

begin
  puts "12==============================SWITCHING TURNS"
  game = Game.new([:X, :O, :Y], 3)
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

begin
  puts "13==============================SHOW LEGAL POSITIONS"
  board = Board.new(3)
  puts "initial setup"
  # board.print
  p board.legal_positions
  board.place_mark([0, 1], :X)
  board.print
  p board.legal_positions
rescue => exception
  puts "Unable to get position from player and place it in the board: #{exception.message}"
end

begin
  puts "14=============================="
  board = Board.new(3)
  computer = ComputerPlayer.new(:C)
  puts "initial setup"
  board.print
  legal_positions_arr = board.legal_positions
  move = computer.get_position(legal_positions_arr)
  p move
  board.place_mark(move, computer.mark)
  board.print
  # p board.legal_positions
rescue => exception
  puts "Unable to get position from computer and place it in the board: #{exception.message}"
end