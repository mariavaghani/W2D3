require_relative "board"
require_relative "human_player"

class Game
  
  def initialize(player_1_mark, player_2_mark)
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark)
    @current_player = @player_1
    @board = Board.new
  end

  def switch_turn
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
    @current_player
  end

  def play
    while @board.empty_positions?
      
      # print the board
      @board.print
      
      # get position and place it on the board
      move =  @current_player.get_position
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
    puts "It looks like a draw"
  end
end