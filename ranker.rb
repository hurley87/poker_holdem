class Ranker

	def self.score(cards)

		if self.straight_flush?(cards)
			1000
		elsif self.four_of_a_kind?(cards)
			900
		elsif self.full_house?(cards)
			800
		elsif self.flush?(cards)
			700
		elsif self.straight?(cards)
			600
		elsif self.three_of_a_kind?(cards)
			500
		elsif self.two_pair?(cards)
			400
		elsif self.pair?(cards)
			300
		else
			100
		end		
	end

	def self.straight_flush?(cards)
		p "straight_flush"
		Ranker.straight?(cards) && Ranker.flush?(cards)
	end

	def self.straight?(cards)
		p 'straight'
		cards = Ranker.cards_in_numbers(cards)
		cards.uniq.length == 5 && (cards.max - cards.min)== 4
	end

	def self.flush?(cards)
		p 'flush'
		cards = Ranker.cards_in_suits(cards)
		cards.size - cards.uniq.size == 4
	end

	def self.four_of_a_kind?(cards)
		p 'four_of_a_kind'
		cards = Ranker.cards_in_numbers(cards)
		cards.size - cards.uniq.size == 3
	end

	def self.three_of_a_kind?(cards)
		p 'three_of_a_kind'
		cards = Ranker.cards_in_numbers(cards)
		cards.size - cards.uniq.size == 3
	end

	def self.pair?(cards)
		p 'pair'
		cards = Ranker.cards_in_numbers(cards)
		hash = card_counter(cards)
		hash.values.include?(2)
	end

	def self.highest_card?(cards)
		p 'highest_card'
		Ranker.cards_in_numbers(cards).max
	end

	def self.full_house?(cards)
		p 'full_house'
		cards = Ranker.cards_in_numbers(cards)
		hash = card_counter(cards)
		hash.values.include?(2) && hash.values.include?(3)
	end

	def self.two_pair?(cards)
		p 'two_pair'
		cards = Ranker.cards_in_numbers(cards)
		hash = card_counter(cards)
		hash.values.include?(2) && hash.length == 3 
	end

private

	def self.cards_in_suits(cards)
		 p cards.map(&:suit)
	end

	def self.cards_in_numbers(cards)
		p cards.map(&:number)
	end

	def self.card_counter(cards)
		hash = Hash.new(0)
		cards.each do |card|
			hash[card] += 1
		end
		hash
	end

end