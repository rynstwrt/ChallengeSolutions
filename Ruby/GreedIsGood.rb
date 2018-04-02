def score dice
	score = 0

	(1..6).each do |x|
		count = dice.count x
		if count > 2
			(0..2).each { dice.delete x }
			score += x > 1 ? x * 100 : 1000
		end
	end
  
	(1..dice.count(1)).each { score += 100 }
	(1..dice.count(5)).each { score += 50 }
	score
end

print score [2, 4, 4, 5, 4]
