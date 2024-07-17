def bubble(arr)
  # cần 3 dấu chấm @@ ngồi mò mãi
  for i in 0...arr.length
    sorted = true
    for j in 0...(arr.length - 1 - i)
      if arr[j]>arr[j+1]
        arr[j],arr[j+1] = arr[j+1],arr[j]
        sorted = false
      end
    end
    break if sorted
  end
  arr
  end
  array = [10, 2, 6, 2, 1, 5, 8, 6, 0, 2, 8, 9]
  p bubble(array)
  