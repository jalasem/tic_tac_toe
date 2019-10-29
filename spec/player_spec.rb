# frozen_string_literal: true

require '../lib/player.rb'

RSpec.describe Player do
  let(:player1) { Player.new('Joe') }
  let(:player2) { Player.new('Bob') }

  describe '#initialize' do
    it 'assigns name to new player 1' do
      expect(player1.name).to eql('Joe')
    end

    it 'assigns name to new player 2' do
      expect(player2.name).to eql('Bob')
    end
  end
end
