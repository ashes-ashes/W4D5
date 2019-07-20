def bad_two_sum?(array, target)
  (0...array.length).each do |i|
    (i+1...array.length).each do |j|
      return true if target == (array[i] + array[j])
    end
  end
  false
end

def okay_two_sum?(array, target)
  new_arr = array.sort
  new_arr.each do |el|
    return true if new_arr.bsearch { target - el }
  end
  false
end

# def bsearch(array, target, start = array.length/2, finish = array.length)
#   return nil if array.length == 0

#   case target <=> array[start]
#   when 0
#     start
#   when -1
#     bsearch(array, target, 0, start)
#   when 1
#     bsearch(array, target, start, finish)
#   end
# end



arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false