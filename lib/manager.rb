# frozen_string_literal: true

class GameManager
  def initialize
    @board = nil
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [6, 4, 2],
    [0, 4, 8]
  ].freeze

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] &&
        space_filled?(combo[0])
    end
  end

  def init_board(grid)
    @board = Array.new(grid) { '-' }
  end

  def set_input(index, input = 'X')
    @board[index] = input
  end

  def space_filled?(index)
    @board[index] == 'X' || @board[index] == 'O'
  end

  def board_index(input_index)
    input_index.to_i - 1
  end

  def valid_move?(position)
    position.between?(0, 8) && !space_filled?(position)
  end

  def turn_count
    @board.select { |e| e.include?('X') || e.include?('O') }.size
  end

  def current_player
    player = if (turn_count % 2).zero?
               'X'
             else
               'O'
             end
    player
  end

  def full?
    turn_count == 9
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end
end
