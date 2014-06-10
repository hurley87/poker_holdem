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

hash = {}

 hash[200] = 0
 hash[300] = 0
 hash[400] = 0
 hash[500] = 0
 hash[600] = 0
 hash[700] = 0
 hash[800] = 0
 hash[900] = 0

8000.times do 
new_game = Game.new
new_game.start_game
value = new_game.hand_value
case value
	when 200 then hash[200] += 1
	when 300 then hash[300] += 1
	when 400 then hash[400] += 1
	when 500 then hash[500] += 1
	when 600 then hash[600] += 1
	when 700 then hash[700] += 1
	when 800 then hash[800] += 1
	when 900 then hash[900] += 1
end

end
puts hash