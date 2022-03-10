# BUGGED CODE
# def factorial(n)
#     product = 1
#     while n > 0
#       n -= 1
#       product *= n
#     end
#     product
#   end

def factorial(n)
  product = 1
  # p "at the start product is #{product}"
  while n > 1
    # p "we multiply #{product} by #{n}"
    product *= n
    # p "we take 1 away from #{n}"
    n -= 1
    # p "we get #{product}"
  end
  product
  # p product
end