class Game
	def initialize(dealer)
		@dealer = Dealer.new
		@player1 = Player.new
		@player2 = Player.new
	end
	def start_game
		@dealer.deal(@player1, @player2)
	end
	def hand_value(hand)
	end
end