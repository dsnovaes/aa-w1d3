def divisors(num)
    divisors = []
    (1..num).each do |factor|
        if num % factor == 0
            divisors << factor
        end
    end
    divisors.count
end

def anti_prime?(num)
    divisors_of_num = divisors(num)
    (2..num).each do |x|
        if divisors(x) > divisors_of_num
            return false
        end
    end
    return true
end

# puts "must be true"
# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# puts "must be false"
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition(mtx1, mtx2) # [[2,5], [4,7]] and [[9,1], [3,0]]
    result = []
    mtx1.each_with_index do |ele,idx|
        result << (ele+mtx2[idx])
    end
    result
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]