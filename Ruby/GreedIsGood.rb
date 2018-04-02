# For challenge at http://www.codewars.com/kata/greed-is-good/train/ruby

def score dice
	score = 0

	(1..6).each {|x| if dice.count(x) > 2 then (1..3).each {dice.delete_at(dice.index(x) || dice.length)}; score += (x > 1) ? x * 100 : 1000 end}
	(1..dice.count(1)).each { score += 100 }
	(1..dice.count(5)).each { score += 50 }
	
	score
end

print score [2, 4, 4, 5, 4]
