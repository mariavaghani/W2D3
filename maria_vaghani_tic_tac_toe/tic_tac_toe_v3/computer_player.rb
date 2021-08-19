class ComputerPlayer
  
  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position(legal_positions_arr)
    puts "..."
    puts "Computer player #{@mark} is making a turn"

    move = legal_positions_arr.sample(1)[0]
    puts "..."
    puts "Computer player #{@mark} is going #{move.join(' ')}"
    move
  end
end