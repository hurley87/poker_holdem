require_relative'player'
require_relative'ranker'
require_relative 'texas_holdem'

class Game
	def initialize
		@dealer = Dealer.new
		@player1 = Player.new
		@player2 = Player.new
	end
	def start_game
		@dealer.deal(@player1, @player2)
	end
	def hand_value
		@player1.hand
		Ranker.score(@player1.hand)
	end
end
