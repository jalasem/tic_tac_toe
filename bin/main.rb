#!/usr/bin/env ruby

# frozen_string_literal: true
class Instructions
  #instructions to player
  def welcome
    puts ' '
    puts '==========TIC-TAC-TOE=========='
    puts 'Welcome to tic tac toe'
    puts '-------------INSTRUCTIONS---------------'
    puts 'The first player is X'
    puts 'Choose numbers from 1 to 9 to select desired cell'
    puts 'No duplicate numbers are allowed'
    puts '--------------------------------'
    puts 'Player 1 name:'
    player_one = gets.chomp
    puts 'Player 2 name:'
    player_two = gets.chomp
    puts '************************************************************'
    puts "Player one with X is #{player_one} and Player two with O #{player_two}"
    puts '************************************************************'
  end
end

class Game
  attr_reader :state

  def initialize
    @state = true
  end

  # state for game over
  def game_over
    @state = false
  end
end

class Cell
  attr_reader :state

  def initialize
    @state = nil
  end

  # Method to mark X on board
  def make_x
    @state = 'X'
  end

  # Method to mark O on board
  def make_o
    @state = 'O'
  end
end

# Tic Tac Toe board
class Board
  def initialize
    @board = {
      1 => Cell.new,
      2 => Cell.new,
      3 => Cell.new,
      4 => Cell.new,
      5 => Cell.new,
      6 => Cell.new,
      7 => Cell.new,
      8 => Cell.new,
      9 => Cell.new
    }
  end

  def change_cell_o(cell)
    @board[cell].make_o
  end

  def change_cell_x(cell)
    @board[cell].make_x
  end

  def display_board
    (1..@board.length).each do |i|
      print "#{@board[i].state.nil? ? i : @board[i].state} #{(i % 3).zero? && !i.zero? ? "\n" : ''}"
    end
  end
end

# Class Game instance
tic_tac_toe = Game.new

instructions = Instructions.new
p instructions.welcome

# Class instance
board = Board.new

# While game is not over
while tic_tac_toe.state
  # Loop for every turn
  p "Here's the board"
  board.display_board
  p 'Player 1 please enter cell number of where you want to place X'

  # Prompts for user input.
  # Prompts error if user input character other than number between 1 to 9
  user_input = gets.chomp.to_i
  board.change_cell_x(user_input)
  
  # Print the board after receiving user input
  board.display_board
  p 'Player 2 please enter cell number of where you want to place O'

  # Prompts for user input.
  # Prompts error if user input character other than number between 1 to 9
  user_input = gets.chomp.to_i

  board.change_cell_o(user_input)
  board.display_board

  # If game is won or draw. Game state becomes false which ends the game
  tic_tac_toe.game_over
end