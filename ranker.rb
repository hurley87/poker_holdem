class Ranker

	def self.straight_flush?(cards)
		Ranker.straight?(cards) && Ranker.flush?(cards)
	end

	def self.straight?(cards)
		cards = Ranker.cards_in_numbers(cards)
		cards.uniq.length == 5 && (cards.max - cards.min)== 4
	end

	def self.flush?(cards)
		cards = Ranker.cards_in_suits(cards)
		cards.size - cards.uniq.size == 4
	end

	def self.four_of_a_kind?(cards)
		cards = Ranker.cards_in_numbers(cards)
		cards.size - cards.uniq.size == 2
	end

	def self.three_of_a_kind?(cards)
		cards = Ranker.cards_in_numbers(cards)
		cards.size - cards.uniq.size == 3
	end

	def self.pair?(cards)
		cards = Ranker.cards_in_numbers(cards)
		cards.size - cards.uniq.size == 4
	end

	def self.highest_card(cards)
		Ranker.cards_in_numbers(cards).max
	end

	def self.full_house(cards)
		hash = card_counter(cards)
		hash.values.include?(2) && hash.values.include?(3)
	end

	def self.two_pair?(cards)
		hash = card_counter(cards)
		hash.value.include?(2) && hash.length == 3 
	end

private

	def self.cards_in_suits(cards)
		cards.map(&:suit)
	end

	def self.cards_in_numbers(cards)
		cards.map(&:number)
	end

	def card_counter(cards)
		hash = Hash.new(0)
		cards.each do |card|
			hash[card] += 1
		end
		hash
	end

end