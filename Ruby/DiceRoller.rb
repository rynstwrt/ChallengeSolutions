input = File.new "input.txt", "r"

input.each do |line|
    num_dice, num_sides = line.split /d/

    sum = 0
    rolls = []

    (0..num_dice.to_i).each do |i|
        rand_val = rand(1..num_sides.to_i)
        rolls.push rand_val
        sum += rand_val
    end

    puts sum.to_s + ": " + rolls.join(' ')
end

input.close
