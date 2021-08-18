class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr_of_pegs)
    arr_of_pegs.all? { |peg| POSSIBLE_PEGS.has_key?(peg.upcase) }
  end

  def initialize(arr_of_pegs)
    if Code.valid_pegs?(arr_of_pegs)
      @pegs = arr_of_pegs.map(&:upcase)
    else
      raise "Invalid Pegs, try harder"
    end
  end

  def self.random(length)
    secret_code = []
    (0...length).each { |i| secret_code << POSSIBLE_PEGS.keys.sample}
    Code.new(secret_code)
  end

  def self.from_string(str)
    Code.new(str.upcase.split(''))
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    num_exact_matches = 0
    @pegs.each_with_index { |peg, idx| num_exact_matches += 1 if peg == guess[idx] }
    num_exact_matches
  end

  def num_near_matches(guess)
    num_near_matches = 0
    #create hashes counting pegs in both secret and guess codes 
    guess_hash = Hash.new(0)
    secret_hash = Hash.new(0)
    guess.pegs.each { |peg| guess_hash[peg] += 1 }
    @pegs.each { |peg| secret_hash[peg] += 1 }

    guess_hash.each { |peg, num_times| num_near_matches += [num_times, secret_hash[peg]].min }
    num_near_matches -= num_exact_matches(guess)
    num_near_matches
  end



  # def num_near_matches(code_instance)
  #   arr_guess = code_instance.pegs.dup
  #   arr_code = @pegs.dup
  #   # debugger
  #   arr_guess.each_with_index do |guess, idx|
  #     if guess == arr_code[idx]
  #       arr_guess[idx] = nil
  #       arr_code[idx] = nil
  #     end
  #   end

  #   arr_code.delete(nil)
  #   arr_guess.delete(nil)

  #   count = 0

  #   arr_guess.each_with_index do |guess, idx|
  #     if arr_code.include?(guess)
  #       arr_code.delete_at(arr_code.index(guess))
  #       count += 1
  #     end
  #   end
  #   count
  # end

  def ==(another_code)
    self.pegs == another_code.pegs
  end
end
