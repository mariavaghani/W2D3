class HumanPlayer
  
  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position
    puts "Player #{@mark}, please enter your position as coordinate numbers separated by spaces"
    
    arr_from_string = gets.chomp.split(" ")
    if arr_from_string.length != 2 || !arr_from_string.all? { |ele| ele == ele.to_i.to_s }
      raise "sorry, the position is invalid"
    end
    arr_from_string.map!(&:to_i)
  end

end