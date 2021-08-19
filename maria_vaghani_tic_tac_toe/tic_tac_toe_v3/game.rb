require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
  
  def initialize(player_marks_arr, n)
    @player_marks_arr = player_marks_arr.map do |mark_hash|
      if mark_hash.values[0] == 'y'
        HumanPlayer.new(mark_hash.keys[0])
      else
        ComputerPlayer.new(mark_hash.keys[0])
      end
    end
    @current_player = @player_marks_arr[0]
    @board = Board.new(n)
  end

  def switch_turn
    @player_marks_arr.rotate!(1)
    @current_player = @player_marks_arr[0]
    @current_player
  end

  def play
    while @board.empty_positions?
      
      # print the board
      @board.print
      legal_positions_arr = @board.legal_positions
      # p legal_positions_arr
      # get position and place it on the board
      puts "Player #{@current_player.mark}, it is your turn. please enter your position as numbers should be between 0 and #{@board.size} inclusively"
      move =  @current_player.get_position(legal_positions_arr)

      @board.place_mark(move, @current_player.mark)
      
      # check if the user won?
      if @board.win?(@current_player.mark)
        @board.print
        puts "Player #{@current_player.mark} won!"
        return "End Game"
      else
        switch_turn 
      end
    end
    @board.print
    puts "It looks like a draw"
  end
end