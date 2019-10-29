# frozen_string_literal: true

require '../lib/manager.rb'
require '../lib/player.rb'

RSpec.describe GameManager do
  let(:game) { GameManager.new([Player.new('Joe'), Player.new('Bob')]) }

  describe '#initialize' do
    it 'should init an instance of the GameManager class' do
      expect(game).to be_an_instance_of(GameManager)
    end
  end

  describe '#set_input' do
    it 'inputs symbol X into position' do
      board = (1..9).to_a
      expect(game.set_input(0, :X)).to eq(board[0] = :X)
    end
  end

  describe '#set_input' do
    it 'inputs symbol Y into position' do
      board = (1..9).to_a
      expect(game.set_input(0, :O)).to eql(board[0] = :O)
    end
  end

  describe '#space_filled?' do
    context 'Current space = filled'
    it 'checks if a board position has X or O' do
      game.set_input(1, :X)
      expect(game.space_filled?(1)).to eq(true)
    end

    context 'Current space = empty'
    it 'checks if a board position has X or O' do
      game.set_input(1, ' ')
      expect(game.space_filled?(3)).to eql(false)
    end
  end

  describe '#valid_move?' do
    context 'Valid move (Board position is empty)'
    it 'checks if an option selected is between 1-9, returns true if empty' do
      game.set_input(4, :O)
      expect(game.valid_move?(1)).to eql(true)
    end

    context 'Invalid move (Board position occupied or option wrong)'
    it 'checks if an option selected is between 1-9, returns false if occupied or wrong input' do
      game.set_input(3, :O)
      expect(game.valid_move?(3)).to eql(false)
    end
  end

  describe '#turn_count' do
    it 'displays the counter for how many turns has been passed' do
      game.set_input(0, :X)
      game.set_input(1, :O)
      game.set_input(2, :X)
      game.set_input(3, :O)
      game.set_input(4, :X)
      expect(game.turn_count).to eql(5)
    end
  end

  describe '#current_player' do
    it 'displays the current players symbol based on turn count, X if even, O if odd' do
      game.set_input(0, :X)
      expect(game.current_player).to eql(:O)
    end

    it 'displays the current players symbol based on turn count, X if even, O if odd' do
      game.set_input(0, :X)
      game.set_input(1, :O)
      expect(game.current_player).to eql(:X)
    end
  end

  describe '#full?' do
    context 'Board not full'
    it 'Checks if all the positions in the board are occupied' do
      game.set_input(0, :X)
      game.set_input(1, :O)
      game.set_input(2, :X)
      game.set_input(3, :O)
      expect(game.full?).to eq(false)
    end

    context 'Board full'
    it 'Checks if all the positions in the board are occupied' do
      game.set_input(0, :X)
      game.set_input(1, :O)
      game.set_input(2, :X)
      game.set_input(3, :O)
      game.set_input(4, :X)
      game.set_input(5, :O)
      game.set_input(6, :X)
      game.set_input(7, :O)
      game.set_input(8, :X)
      expect(game.full?).to eq(true)
    end
  end

  describe '#won?' do
    it 'Top horizontal win combination' do
      game.set_input(0, :O)
      game.set_input(1, :O)
      game.set_input(2, :O)
      expect(game.won?).to eq([0, 1, 2])
    end

    it 'First Diagonal win combination' do
      game.set_input(0, :X)
      game.set_input(4, :X)
      game.set_input(8, :X)
      expect(game.won?).to eq([0, 4, 8])
    end

    it 'Second Diagonal win combination' do
      game.set_input(6, :X)
      game.set_input(4, :X)
      game.set_input(2, :X)
      expect(game.won?).to eq([6, 4, 2])
    end

    it 'Middle horizontal win combination' do
      game.set_input(3, :O)
      game.set_input(4, :O)
      game.set_input(5, :O)
      expect(game.won?).to eq([3, 4, 5])
    end

    it 'Bottom horizontal win combination' do
      game.set_input(6, :X)
      game.set_input(7, :X)
      game.set_input(8, :X)
      expect(game.won?).to eq([6, 7, 8])
    end

    it 'Left vertical win combination' do
      game.set_input(0, :O)
      game.set_input(3, :O)
      game.set_input(6, :O)
      expect(game.won?).to eq([0, 3, 6])
    end

    it 'Middle vertical win combination' do
      game.set_input(1, :O)
      game.set_input(4, :O)
      game.set_input(7, :O)
      expect(game.won?).to eq([1, 4, 7])
    end

    it 'Right vertical win combination' do
      game.set_input(2, :O)
      game.set_input(5, :O)
      game.set_input(8, :O)
      expect(game.won?).to eq([2, 5, 8])
    end
  end

  describe '#draw?' do
    it 'Checks if there is a draw after all positions are occupied and no win' do
      game.set_input(5, :X)
      game.set_input(1, :O)
      game.set_input(2, :X)
      game.set_input(8, :O)
      game.set_input(6, :X)
      game.set_input(4, :O)
      game.set_input(7, :X)
      game.set_input(3, :O)
      game.set_input(0, :X)
      expect(game.draw?).to eq(true)
    end
  end

  describe '#over?' do
    context 'Board full, no winning combination detected'
    it 'Checks for won? or full? or draw?, returns true if game is over' do
      game.set_input(0, :X)
      game.set_input(1, :O)
      game.set_input(2, :X)
      game.set_input(3, :X)
      game.set_input(4, :X)
      game.set_input(5, :O)
      game.set_input(6, :O)
      game.set_input(7, :X)
      game.set_input(8, :O)
      expect(game.over?).to eq(true)
    end

    context 'Board full, with a winning combination'
    it 'Checks for won? or full? or draw?, returns true if game is over' do
      game.set_input(0, :X)
      game.set_input(1, :X)
      game.set_input(2, :X)
      game.set_input(3, :X)
      game.set_input(4, :X)
      game.set_input(5, :O)
      game.set_input(6, :O)
      game.set_input(7, :X)
      game.set_input(8, :O)
      expect(game.over?).to eq(game.won?)
    end
  end

  describe '#winner?' do
    context 'Winner is O'
    it 'checks if the winner is O' do
      game.set_input(5, :X)
      game.set_input(1, :O)
      game.set_input(2, :X)
      game.set_input(4, :O)
      game.set_input(6, :X)
      game.set_input(7, :O)
      game.set_input(8, :X)
      game.set_input(3, :O)
      game.set_input(0, :X)
      expect(game.winner? == :O).to eq(true)
    end

    context 'Winner is X'
    it 'checks if the winner is X' do
      game.set_input(0, :X)
      game.set_input(1, :O)
      game.set_input(3, :X)
      game.set_input(4, :O)
      game.set_input(6, :X)
      game.set_input(5, :O)
      game.set_input(2, :x)
      game.set_input(7, :X)
      game.set_input(8, :O)
      expect(game.winner? == :X).to eq(true)
    end
  end
end
