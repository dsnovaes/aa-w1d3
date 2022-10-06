# START - from previous file phase2.rb

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


# END - from previous file phase2.rb

def matrix_addition_reloaded(*matrices)
    mtx_count = []
    matrices.each do |mtx|
       mtx_count << mtx.count 
    end

    return nil if mtx_count.uniq.count != 1

    height = matrices[0].length
    width = matrices[0][0].length

    result = Array.new(height) { [0] * width }
    matrices.inject(result) do |mtx1, mtx2|
        # debugger
        matrix_addition(mtx1, mtx2)
    end

end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def same?(arr)
    arr.uniq.count == 1
end

def squarocol?(*arrays)
    arrays.each do |subArr|
        subArr.each_with_index do |row,idx|
            column = []
            subArr.each do |ele|
                column << ele[idx]
            end
            return true if same?(column) || same?(row)
        end
    end
    return false
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal?(matrices)
    diagonal1 = []
    diagonal2 = []
    (0...matrices.length).each do |i|
        diagonal1 << matrices[i][i]
        diagonal2 << matrices[i][matrices.length - i - 1]
    end
    return true if (diagonal1.uniq.length == 1 || diagonal2.uniq.length == 1)
    return false
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

def sum_last_step(arr)
    i = 0
    new_arr = []
    while i < arr.length - 1
        # debugger
        new_arr << (arr[i] + arr[i+1])
        i += 1
    end
    new_arr

end

def pascals_triangle(n)
    initial = [[1]]
    return initial if n == 1
    (1...n).each do |w|
        temp_arr = [1]
        temp_arr += sum_last_step(initial[-1]) if sum_last_step(initial[-1]).count > 0
        temp_arr << 1
        initial << temp_arr
    end

    initial
end

# p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]