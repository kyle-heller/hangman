require 'json'

class Game
  attr_accessor :word, :correct_array, :guesses_left, :letters_correct

  def initialize
  @@guesses_left = 15
  @@letters_correct = Array.new
    new_word
    @@correct_array = Array.new(@@word.length.to_i) {" _ "}
    # puts self.word
    puts "\nWelcome to Hangman! You can guess a letter by typing it into the console.
    You can save at any time by entering SAVE or load a previous save by entering LOAD.\n\n"
    display
    15.times do
      Player.get_input
      Player.user_input == false ? next : false
      check_guess
      display
      is_win? ? break : next
    end
  end
  

  def self.save_game
    json = JSON.generate({guesses_left: @@guesses_left, letters_correct: @@letters_correct, correct_array: @@correct_array, word: @@word})
    Dir.mkdir('saves') unless Dir.exist?('saves')
    filename = "saves/save.json"
    File.open(filename, 'w') do |file|
    file.write(json)
    end
  end
  
  def self.load_game
    filename = "saves/save.json"
    string = File.read(filename)
    data = JSON.parse(string)
    @@guesses_left = data["guesses_left"]
    @@letters_correct = data["letters_correct"]
    @@correct_array = data["correct_array"]
    @@word = data["word"]
  end

  def new_word
    contents = File.readlines('google_10000_english_no_swear.txt')
    words = Array.new()

    contents.each do
      |word|
      word.length > 5 && word.length < 12 ? words.push(word.chomp.upcase) : next
    end

    @@word = words.sample.split('')
  end
   
  def check_guess
    @@word.each_with_index do
      |letter, index| 
      if letter == Player.user_input
      @@letters_correct.push(index)
      else
        next 
      end
    end
  @@letters_correct == [] ?@@guesses_left =@@guesses_left - 1 : false
    return@@letters_correct
  end

  def display
  @@letters_correct.each do
      |index|
      @@correct_array[index] = " #{Player.user_input.to_s} "
    end
  @@letters_correct = []
    puts  "    #{@@correct_array.join("")}     You have #{@@guesses_left} guesses left\n"
  end

  def is_win?
    if (@@correct_array.map{ |el| el.strip }) == @@word
      puts "You win!"
      return true
    elsif@@guesses_left == 0
      puts "You lose!"
      puts "\n The word was: #{self.word.join("")}"
      return true
    end
  end
end


class Player
  attr_accessor :user_input

  def initialize
    @user_input = ""
    @game = Game.new
  end

  def self.get_input
    @user_input = gets.upcase.chomp
    if @user_input == "SAVE"
      Game.save_game
      return false
    elsif @user_input == "LOAD"
      Game.load_game
      return false
    else
      return true
    end
  end

  def self.user_input
    @user_input
  end
end



player = Player.new