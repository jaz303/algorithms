def quicksort(array)
  if array.length <= 1
    array
  else
    pivot = array.delete_at(array.length / 2)
    quicksort(array.select { |v| v <= pivot }) + [pivot] + quicksort(array.select { |v| v  > pivot })
  end
end

p quicksort([5,7,4,2,6,6,1,9,0,4,1,5,8,3,6])