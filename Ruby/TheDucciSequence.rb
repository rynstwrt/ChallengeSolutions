@history = []
@steps = 1
def ducci arr
    @steps += 1
    new_arr = []
    arr.each_with_index do |v, i|
        second_part = i == arr.length - 1 ? arr[0] : arr[i + 1]
        new_arr.push (v - second_part).abs
    end

    print arr.to_s + "\n"

    if @history.include? new_arr or new_arr.inject(&:+) == 0
        print new_arr.to_s + "\n"
        puts @steps.to_s + " steps"
    else
        @history.push new_arr
        ducci new_arr
    end
end
