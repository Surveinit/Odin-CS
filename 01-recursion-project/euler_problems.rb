# Multiples of 3 or 5

def multiples(n, total = 0)
  if n == 0
    return [], total
  else
    if (n % 3 == 0 || n % 5 == 0)
      list, total = multiples(n-1, total += n)
      list << n
    else
      list, total = multiples(n-1, total)
    end
  end
  return list, total
end

list, total = multiples(1000)
p total