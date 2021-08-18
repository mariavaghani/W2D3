class Player
  def get_move
    puts 'enter a position with coordinates separated with a space like `4 7`'
    move_position = gets.chomp.split(" ")
    return move_position.map(&:to_i)
  end
end
