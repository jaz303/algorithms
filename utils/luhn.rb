# Luhn checksum for credit card numbers (aka mod-10 algorithm)
# http://en.wikipedia.org/wiki/Luhn_algorithm

def luhn(number)
  
  checksum, flip = 0, false
  
  while number > 0
    mod = number % 10
    number = number / 10
    mod *= 2 if flip
    mod -= 9 if mod > 9
    checksum += mod
    flip = !flip
  end
  
  checksum % 10 == 0
  
end

p luhn(49927398716)