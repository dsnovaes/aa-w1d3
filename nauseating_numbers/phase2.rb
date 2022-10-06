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
    (2..num).each { |x| return false if divisors(x) > divisors_of_num }
    return true
end

# puts "must be true"clear
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
    i = 0
    while i < mtx1.length
        subArr = []
        mtx1[i].each_with_index do |ele,idx|
            subArr << mtx1[i][idx] + mtx2[i][idx]
        end
        result<< subArr
        i += 1
    end
    result
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def factors(num)
    (1..num).select { |factor| factor if num % factor == 0 }
end

def mutual_factors(*nums)
    result = Hash.new(0)
    nums.each do |num|
        factors(num).each { |factor| result[factor] += 1 }
    end
    common_factors = []
    result.each do |k,v|
        if v == nums.count
            common_factors << k
        end
    end
    common_factors
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(num)
    origin = [1,1,2]
    num.times do |n|
        origin << origin[-1] + origin[-2] + origin[-3]
    end
    origin[num-1]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274