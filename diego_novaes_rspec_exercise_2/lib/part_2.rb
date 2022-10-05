def palindrome?(str)
   reversed = ""
   idx = str.length - 1
   while idx > -1
    reversed += str[idx]
    idx -= 1
   end 
   str == reversed
end

# puts "must be true"
# p palindrome?("tot")
# p palindrome?("racecar")
# p palindrome?("madam")
# p palindrome?("aa")
# p palindrome?("a")
# puts "must be false"
# p palindrome?("cat")
# p palindrome?("greek")
# p palindrome?("xabcx")

def substrings(str)
    substrings = []
    arr = str.split("")
    arr.each_with_index do |ele1,idx1|
        arr.each_with_index do |ele2,idx2|
            if idx1 == idx2
                substrings << ele1
            elsif idx2 > idx1
                substrings << str[idx1..idx2]
            end
        end
    end
    substrings
end

# p substrings("jump")
# p substrings("abc")
# p substrings("x")

def palindrome_substrings(str)
    substrings(str).select { |ele| palindrome?(ele) && ele.length > 1 }
end

p palindrome_substrings("abracadabra")
p palindrome_substrings("madam")
p palindrome_substrings("taco")