def mergesort(array)
  if array.length <= 1
    array
  else
    mid = (array.length / 2) - 1
    merge(mergesort(array[0..mid]), mergesort(array[mid+1..array.length-1]))
  end
end

def merge(left, right)
  out = []
  while left.length > 0 && right.length > 0
    if left.first < right.first
      out << left.shift
    else
      out << right.shift
    end
  end
  out += left
  out += right
end

p mergesort([1,7,5,8,2,1,5,0,3,4])