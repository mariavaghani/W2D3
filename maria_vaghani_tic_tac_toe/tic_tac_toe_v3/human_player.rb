class HumanPlayer
  
  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position(legal_positions_arr)
    
    arr_from_string = gets.chomp.split(" ")
    move = arr_from_string.map(&:to_i)
    
    while !legal_positions_arr.include?(move) || !arr_from_string.all? { |ele| ele == ele.to_i.to_s }
      puts "Sorry, your input is invalid, please try again"
      arr_from_string = gets.chomp.split(" ")
      move = arr_from_string.map(&:to_i)
    end
    move
  end

end