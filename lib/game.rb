# frozen_string_literal: true

require 'json'
require_relative 'colors'
require_relative 'quips'

class Game
  attr_accessor :secret_word, :board, :guesses_left, :correct_letter_index, :guessed, :correct

  include Quips
#
  def initialize
  @guessed = Array.new
  @correct = Array.new
  @correct_letter_index = Array.new
  get_secret_word
  get_num_of_guesses
  @board = Array.new(@secret_word.length.to_i) {" _ "}
  end
  
  def save_game
    json = JSON.generate({guesses_left: @guesses_left, board: @board, secret_word: @secret_word, guessed: @guessed})
    Dir.mkdir('saves') unless Dir.exist?('saves')
    filename = "saves/save.json"
    File.open(filename, 'w') do |file|
    file.write(json)
    puts "\nSave succesful!\n\n"
    end
  end
  
  def load_game
    filename = "saves/save.json"
    begin
      string = File.read(filename)
    rescue Errno::ENOENT
      puts "\nSave file does not exist.\n\n"
      return
    end
    data = JSON.parse(string)
    @guesses_left = data["guesses_left"]
    @board = data["board"]
    @secret_word = data["secret_word"]
    @guessed = data["guessed"]
    puts "\nLoad succesful!\n\n"
    puts "Already guessed: #{guessed.sort.join(", ")}\n\n".gray
  end

  def play
    Player.new
    clear_screen
    Quips.intro
    display
    loop do
      Player.get_input(self)
      check_guess
      show_already_guessed
      display
      game_over?
    end
  end

  def get_num_of_guesses
    @guesses_left = [@secret_word.length, 7].max
  end

  def show_already_guessed
    if @guessed.count % 5 == 0
      puts "Already guessed: #{guessed.sort.join(", ")}\n".gray
    end
  end

  def get_secret_word
    begin
      contents = File.readlines('google_10000_english_no_swear.txt')
    rescue Errno::ENOENT
      puts "\nError: Dictionary does not exist.\n\n"
      exit
    end
    words = Array.new()
    contents.each do
      |word|
      word.length > 5 && word.length < 12 ? words.push(word.chomp.upcase) : next
    end
    @secret_word = words.sample.split('')
  end


  def check_guess
    unless Player.user_input == "LOAD" || Player.user_input == "SAVE"
      @secret_word.each_with_index do |letter, index| 
        if letter == Player.user_input
          @correct_letter_index.push(index)
          @correct << letter
          if @correct.count == 1 || @correct.count % 2 == 0
            Quips.random_success_quip
          end
        end
      end
      unless @guessed.include?(Player.user_input)
        if @correct_letter_index.empty?
          @guesses_left -= 1
          Quips.random_failure_quip
        end
        @guessed << Player.user_input
        return @correct_letter_index
      end
    end
  end


  def game_over?
    if (@board.map{ |el| el.strip }) == @secret_word
      puts "\nYou win! 🙂\n\n"
      play_again?
    elsif @guesses_left == 0
      puts "\nYou lose!"
      puts "\nThe word was: #{@secret_word.join("")}\n\n"
      play_again?
    end
  end
end

  def play_again?
    loop do
      puts 'Play again? (yes/no)'
      response = gets.chomp.downcase
      if %w[yes y].include?(response)
        hangman = Game.new
        hangman.play
        return true
      elsif %w[no n].include?(response)
        exit
      else
        puts "Invalid response. Please enter 'yes' or 'no'."
      end
    end
  end

  def clear_screen
    system('clear') || system('cls')
  end

def display
  @correct_letter_index.each do
      |index|
      @board[index] = " #{Player.user_input.to_s} "
    end
  @correct_letter_index = []
    print  "    #{@board.join("")}"
    print "     You have #{@guesses_left} guesses left\n".brown
  end