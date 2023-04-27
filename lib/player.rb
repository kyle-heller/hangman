# frozen_string_literal: true

require_relative 'player'

class Player
  attr_accessor :user_input

  def initialize
    @user_input = ""
  end

  def self.get_input(game)
    @user_input = gets.upcase.chomp
    if @user_input == "SAVE"
      game.save_game
    elsif @user_input == "LOAD"
      game.load_game
    elsif
      @user_input.match?(/^[A-Z]+$/)
      return true
    else 
      puts "\nInvalid input. Please enter letters a-z only."
      get_input(game)
    end
  end

  def self.user_input
    @user_input
  end
end
