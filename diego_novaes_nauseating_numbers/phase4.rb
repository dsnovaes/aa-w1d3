def is_prime?(num)
    return false if num < 2
    
    (2...num).each do |factor| 
        if num % factor == 0
            return false
        end
    end
    return true
end

def is_1_less?(num)
    i = 1
    until 2**i == num + 1
        i+=1
        if i == num
            return false
        end
    end
    return true
end

def mersenne_prime(num)
    result = []
    i = 0
    until result.length == num
        i+=1
        puts i
        if is_prime?(i) && is_1_less?(i)
            result << i
        end
    end
    result.max
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(5) # 8191

$alphabet = ("a".."z").to_a.join("")

def triangular_number?(num)
    (1..num).each { |i| return true if ((i*(i+1)) / 2) == num }
    return false
end

def triangular_word?(word)
    num = 0
    word.each_char { |char| num += $alphabet.index(char) +1 }
    triangular_number?(num)
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

require "byebug"

def consecutives?(num1,num2)
    rest = num1 - num2
    rest.abs == 1
end

def consecutive_collapse(arr)
    reducible = true
    debugger
    while reducible
        reducible = false
        arr.each_with_index do |ele,i|
            puts "comparing: #{arr[i]} and #{arr[i+1]}"
            if arr[i] != arr[-1] && consecutives?(arr[i],arr[i+1])
                puts "consecutives: #{arr[i]} and #{arr[i+1]}"
                arr = arr[0...i] + arr[i + 1..-1]
                reducible = true
            else
                arr
            end
        end
    end
    arr

end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

def prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % i == 0 }
end

def nearest_prime(n,th)
    n += 1 if prime?(n) && th > 0
    n -= 1 if prime?(n) && th < 0
    primes = []
    if th > 0
        while primes.length < th
            primes << n if prime?(n)
            n += 1
        end
    else
        while primes.length < th.abs
            return nil if n < 0
            primes << n if prime?(n)
            n -= 1
        end
    end

    primes.last
end


def pretentious_primes(arr, num)
    arr.map { |number| nearest_prime(number, num) }
end


# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]