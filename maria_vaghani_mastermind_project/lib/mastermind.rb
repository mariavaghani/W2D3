require_relative "code"

class Mastermind

  def initialize(length)
    @secret_code = Code.random(length)    
  end

  def print_matches(guess)
    puts "Exact matches: " + @secret_code.num_exact_matches(guess).to_s
    puts "Near matches: " + @secret_code.num_near_matches(guess).to_s
  end

  def ask_user_for_guess
    puts "Enter a code"
    guess_pegs = gets.chomp
    guess = Code.from_string(guess_pegs)
    print_matches(guess)
    guess == @secret_code
  end
end
