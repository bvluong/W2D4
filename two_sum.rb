def bad_two_sum?(arr, target)
  arr.each_with_index do |el,idx|
    arr.drop(idx+1).each do |el2|
      return true if el+el2 == target
    end
  end
  false
  # O(n**2)
end

def okay_two_sum?(arr,target)
  arr.sort!
  arr.each_with_index do |el, idx|
    temp_target = target - el
    return true if binary_search(arr[idx+1..-1], temp_target)
  end
  false
end

def binary_search(array,target)
  return nil if array.empty?
  middle = array.length/2
  case target <=> array[middle]
  when -1
    return binary_search(array.take(middle),target)
  when 0
    return true if array[middle] == target
  else
    result = binary_search(array.drop(middle+1),target)
    return result.nil? ? nil : true
  end
end


def best_two_sum?(array, target)
  hash = Hash.new(0)
  array.each do |el|
    return true if hash.key?(target-el)
    hash[el] += 1
  end
  false
end

array = [0, 1, 5, 7]
p bad_two_sum?(array, 6) # => should be true
p bad_two_sum?(array, 10) # => should be false
p okay_two_sum?(array, 6) # => should be true
p okay_two_sum?(array, 10) # => should be false
p best_two_sum?(array, 6) # => should be true
p best_two_sum?(array, 10) # => should be false
