require 'pry-byebug'
#####################
class Game
  attr_accessor :word, :correct_array

  def initialize
    @guesses_left = 10
    @letters_correct = Array.new
    new_word
    @correct_array = Array.new(@word.length.to_i) {" _ "}
    # puts self.word
    player = Player.new
    12.times do
      Player.get_guess
      check_guess
      display
      is_win? ? break : next
    end
  end

  def new_word
    contents = File.readlines('google_10000_english_no_swear.txt')
    words = Array.new()

    contents.each do
      |word|
      word.length > 5 && word.length < 12 ? words.push(word.chomp.upcase) : next
    end

    @word = words.sample.split('')
  end
   
  def check_guess
    @word.each_with_index do
      |letter, index| 
      if letter == Player.user_guess 
        @letters_correct.push(index)
      else
        next 
      end
    end
    @letters_correct == [] ? @guesses_left = @guesses_left - 1 : false
    return @letters_correct
  end

  def display
    @letters_correct.each do
      |index|
      correct_array[index] = " #{Player.user_guess.to_s} "
    end
    @letters_correct = []
    puts  "#{correct_array.join("")}     You have #{@guesses_left} guesses left\n"
  end

  def is_win?
    if (@correct_array.map{ |el| el.strip }) == @word
      puts "You win!"
      return true
    elsif @guesses_left == 0
      puts "You lose!"
      puts "\n The word was: #{self.word.join("")}"
      return true
    end
  end
end
#####################
class Player
  attr_accessor :user_guess

  def initialize
    @user_guess = ""
  end

  def self.get_guess
    @user_guess = gets.upcase.chomp
  end

  def self.user_guess
    @user_guess
  end
end
#####################

game = Game.new