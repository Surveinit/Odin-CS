# USING ITERATION

# def fibs(n)
#   arr = [0,1]
#   (n-2).times do 
#     arr << arr[-1]+arr[-2]
#   end
#   return arr
# end

# p fibs(8)


# USING RECURSION

def fibs_rec(n)
  if n == 0
    return [0]
  elsif n == 1
    return [0,1]
  else
    arr = fibs_rec(n-1)
    arr << arr[-1] + arr[-2]
  end
end

p fibs_rec(8)