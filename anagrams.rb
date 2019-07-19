

def first_anagram?(word1, word2)
  anagrams = permutation(word1.split("")).map { |perm| perm.join("") }
  anagrams.any? { |anagram| anagram == word2 }
end

# def win_stupid_prizes(arr)
#   numperms =
# end

def permutation(arr)
  return [] if arr.length == 0
  return [arr] if arr.length == 1
  perms = []
  arr.each_with_index do |el, i|
    permutation(arr[0...i]+arr[i+1..-1]).each do |perm|
    perms << [el] + perm
    end
  end
  perms
end

def second_anagram?(string1, string2)
  string1.each_char do |char|
    string2.slice!(string2.index(char)) if string2.include?(char)
  end
  string2.empty?
end

def third_anagram?(string1, string2)
  string1.split("").sort == string2.split("").sort
end

def fourth_anagram?(string1, string2)
  res = Hash.new(0)
  string1.each_char {|char| res[char] += 1}
  string2.each_char {|char| res[char] -= 1}
  res.all? {|k, v| v == 0}
end


p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true