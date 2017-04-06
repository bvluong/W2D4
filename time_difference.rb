
def my_min_slow(list)
  list.each do |el|
    return el if list.all? {|el2| el <= el2}
  end
end

def my_min_fast(list)
  first = list.first
  list.each do |el|
    first = el if el < first
  end
  first
end


list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min_slow(list)  # =>  -5
p my_min_fast(list)


def largest_contiguous_subsum_slow(list)
  ans = 0
  (1..list.length).each do |len|
    list.each_cons(len) do |sub_arr|
      ans = sub_arr.inject(:+) if ans < sub_arr.inject(:+)
    end
  end
  ans
end

def largest_contiguous_subsum_fast(list)
  sum = 0
  max = 0
  list.each do |el|
    sum += el
    sum = 0 if sum < 0
    max = sum if sum > max
  end
  max
end

list = [2, 3, -6, 7, -6, 7]
list2 = [1, -5, 1, 1, -5, 1]
p largest_contiguous_subsum_fast(list)
p largest_contiguous_subsum_fast(list2)
