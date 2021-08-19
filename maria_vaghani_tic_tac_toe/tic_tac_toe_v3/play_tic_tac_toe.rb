require_relative "game"
puts "++++++++++++ WELCOME TO THE TIC TAC TOE GAME ++++++++++++"

# get board size
puts "Choose the size of the board:"
n = gets.chomp.to_i

# get people to sign up
puts "How many people are going to play?"
num_people = gets.chomp.to_i

player_marks_arr = []

while player_marks_arr.length < num_people
  puts "Player #{player_marks_arr.length + 1}, please choose your mark"
  mark_to_add = gets.chomp
  while player_marks_arr.include?(mark_to_add)
    puts "Player #{player_marks_arr.length}, I am sorry, this mark is taken, plese choose another mark"
    puts "Other players are: #{player_marks_arr.join(" ")}"
    mark_to_add = gets.chomp
  end
  puts "Is Player #{mark_to_add} human or computer? Please type Y/y for human"
  human = gets.chomp.downcase
  player_marks_arr << {"#{mark_to_add}":human}
end

game = Game.new(player_marks_arr, n)

game.play