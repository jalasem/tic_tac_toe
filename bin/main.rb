#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/manager.rb'
require_relative '../lib/player.rb'

class UserInterface
  def initialize
    @game = GameManager.new
    @board = @game.init_board(9)
    @player1 = Player.new
    @player2 = Player.new
  end

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
    # Request for player names and save them to p1 and p2
    puts 'Player 1 please enter your name: '
    @player1.name = gets.chomp
    @player1.symbol = 'X'

    puts 'Player 2 please enter your name: '
    @player2.name = gets.chomp
    @player2.symbol = 'O'

    puts "Player 1: #{@player1.name}, Symbol: #{@player1.symbol}"
    puts "Player 2: #{@player2.name}, Symbol: #{@player2.symbol}"

    p "Here's the board"
    display_board
  end

  def end
      puts 'Thank you for playing Tic Tac Toe'
  end

  #Tic Tac Toe Board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "

    puts ' ---------- '

    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "

    puts ' ---------- '

    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position
    current = @game.current_player
    if current == 'X'
      print "\n #{@player1.name}, choose a position between 1-9: "
    else
      print "\n #{@player2.name}, choose a position between 1-9: "
    end
  end

    # Game begins, player 1 starts choosing between 1-9
  # if the input is different valid_move returns false and input is request again
  def turn
    position
    spot = gets.strip
    spot = @game.board_index(spot)
    if @game.valid_move?(spot)
      @game.set_input(spot, @game.current_player)
      display_board
    else
      puts 'This spot has been taken or you inputed a wrong value'
      puts 'Please enter a valid option between 1-9'
      display_board
      turn
    end
  end

  # Turn method is called for players to fill the board until @game.over? method is true
  # If total moves = 9 and no combinations detected, its a draw, if a combination is detected, @game.won is executed
  def play
    turn until @game.over?
      if @game.won?
        if @board[@game.won?.first] == 'X'
        puts "CONGRATULATIONS #{@player1.name}! You Won"
        else
          puts "CONGRATULATIONS #{@player2.name}! You Won"
        end
      elsif @game.draw?
        puts "It's a draw!"
      end
  end
end

game = UserInterface.new
game.welcome
game.play
game.end
