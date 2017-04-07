def windowed_max_range(array, window_size)
  current_max_range = 0
  array.each_cons(window_size) do |window|
    current_max_range = (window.max - window.min) if (window.max - window.min) > current_max_range
  end
  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
