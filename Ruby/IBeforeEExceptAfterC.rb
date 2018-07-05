def check(word)
    if word.include?("ei") && !word.include?("cei") then return false end
    if word.include? "cie" then return false end
    return true
end

count = 0
file = File.open 'enable1.txt', 'r' do |file|
    file.each_line do |word|
        if !check word
            count += 1
        end
    end
end
puts count
