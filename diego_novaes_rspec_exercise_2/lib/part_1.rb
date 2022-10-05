$vowels = "aeiouAEIOU"

def partition(arr,limit)
    [arr.select { |num| num < limit },arr.select { |num| num >= limit }]
end

# p partition([11, 5, 13, 2, 3], 7)
# p partition([1, 2, 4, 3, 5, 7], 5)
# p partition([1, 2, 4, 3], 0)

def merge(hash_1, hash_2)
    result = Hash.new(0)
    hash_2.each {|k,v| result[k] = v }
    hash_1.each do |k,v|
        if !result.has_key?(k)
            result[k] = v
        end
    end
    result
end

# hash_1 = {"a"=>10, "b"=>20}
# hash_2 = {"c"=>30, "d"=>40, "e"=>50}
# p merge(hash_1, hash_2)

def censor(str,curses)
    clean_sentence = []
    curses.map { |curse| curse.upcase! }
    str.split(" ").each do |word|
        if curses.include?(word.upcase)
            clean_sentence << uncurse(word)
        else
            clean_sentence << word
        end
    end
    clean_sentence.join(" ")
end

def uncurse(curse_word)
    uncursed = ""
    curse_word.each_char do |char|
        if !$vowels.include?(char)
            uncursed += char
        else
            uncursed += "*"
        end
    end
    uncursed
end

# p censor("Gosh darn it", ["gosh", "darn", "shoot"])
# p censor("SHUT THE FRONT DOOR", ["door"])

def power_of_two?(num)
    i = num
    while i > 0
        if i % 2 == 1 && i != 1
            return false
        elsif i == 1
            return true
        else
            i = i / 2
        end
    end
end

# puts "must be true"
# p power_of_two?(16)
# p power_of_two?(32)
# p power_of_two?(64)
# p power_of_two?(1)
# puts "must be false"
# p power_of_two?(6)
# p power_of_two?(7)
# p power_of_two?(28)
# p power_of_two?(100)