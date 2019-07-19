# def my_min(list)
#   list.each do |el|
#     return el if list.all? { |el2| el <= el2 }
#   end
# end

def my_min(list)
  min = list[0]
  list.each do |el|
    min = el if el < min
  end
  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# def inefficient_largest_contiguous_subsum(list)
#   result_array = []
#   (0...list.length).each do |i|
#     (0...list.length).each do |j|
#       result_array << list[i..j] if i <= j
#     end
#   end
#   result_array.map! { |sub| sub.sum }
#   result_array.max
# end

def largest_contiguous_subsum(list)
  return list.sum if list.all? { |el| el >= 0 }
  return list.max if list.all? { |el| el < 0 }

  sum = list[0]
  largest_sum = list[0]

  list[1..-1].each do |el|
    if el >= 0
      sum += el
    elsif el < 0 && sum+el > 0
      sum += el
    else
      sum = 0
    end
    largest_sum = sum if sum > largest_sum
  end

  largest_sum
end

list1 = [5, 3, -7]
p largest_contiguous_subsum(list1) # => 8

list2 = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list2) # => 8 (from [7, -6, 7])

list3 = [-5, -1, -3]
p largest_contiguous_subsum(list3) # => -1 (from [-1])

list4 = [7, -20, 6]
p largest_contiguous_subsum(list4)