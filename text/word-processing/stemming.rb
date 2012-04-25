# porter stemmer
# http://tartarus.org/~martin/PorterStemmer/def.txt

def try_subs(str, subs)
  subs.each do |regex, replace|
    if str =~ regex
      return str.gsub(regex, replace)
    end
  end
end

def stem(word)
  
  m = 0
  
  # step 1a
  try_subs(
    /sess$/ => 'ss',
    /ies$/  => 'i',
    /ss$/   => 'ss',
    /s$/    => ''
  )
  
  # step 1b
  if m > 0
    try_subs(/eed$/ => 'ee')
  elsif 1
    
  elsif 2
    
  end
  
  # step 2
  if m > 0
    try_subs(
      /ational$/      => 'ate',
      /tional$/       => 'tion',
      /enci$/         => 'ence',
      /anci$/         => 'ance',
      /izer$/         => 'ize',
      /abli$/         => 'able',
      /alli$/         => 'al',
      /entli$/        => 'ent',
      /eli$/          => 'e',
      /ousli$/        => 'ous',
      /ization$/      => 'ize',
      /ation$/        => 'ate',
      /ator$/         => 'ate',
      /alism$/        => 'al',
      /iveness$/      => 'ive',
      /fulness$/      => 'ful',
      /ousness$/      => 'ous',
      /aliti$/        => 'al',
      /iviti$/        => 'ive',
      /biliti$/       => 'ble'
    )
  end
  
  
  "f"
end

input   = File.read('stemming.input').split
output  = File.read('stemming.output').split
total   = 0
success = 0

input.each_with_index do |i, index|
  total += 1
  success += 1 if stem(i) == output[index]
end

puts "#{success}/#{total} passed"