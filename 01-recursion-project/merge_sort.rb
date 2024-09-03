def merge_sort(arr)
  if arr.length <= 1
    return arr
  else
    mid = arr.length/2.floor
    left = arr[0..mid-1]
    right = arr[mid..-1]

    left = merge_sort(left)
    right = merge_sort(right)

    return merge(left, right)
  end
end

def merge(left, right)
  sorted_arr = []
  i = j = 0

  while i < left.length and j < right.length
    if left[i] <= right[j]
      sorted_arr << left[i]
      i += 1
    else
      sorted_arr << right[j]
      j += 1
    end
  end

  while i < left.length
    sorted_arr << left[i]
    i += 1
  end
  
  while j < right.length
    sorted_arr << right[j]
    j += 1
  end
  return sorted_arr
end

# a1 = [2,4,5,7,0,9]
# b1 = [10,1,6,8]
# p merge(a1, b1)

array = [105, 79, 100, 110]
p merge_sort(array)