#Name:    Miles Greatwood
#JMU eID: 109312473
#Class:   CS430 PA6

#Return array of all factors of n in order, no duplicates
#n<1 : returns [] empty array
#n=1 : returns [1]
def factors(n)
  return (1..n).select {|x| n % x == 0}
end

#Return array of all primes less than n
def primes(n)
  return (2..n).select {|x| factors(x).size() == 2}
end

#return prime factors of n
def prime_factors(n)
  return factors(n) & primes(n)
end

#Returns all perfect numbers less than n
#A perfect has factors that sum to exactly 2n
#6's factors sum to 12
def perfects(n)
  return (6..n).select {|x| factors(x).reduce(:+) == 2*x}
end

#reuturns array of pythagorean triples where all elements are less than n
def pythagoreans(n)
  triples = []
  hypot = (5..n).to_a.map!{|x| x ** 2}
  #iterate through both a and b values up to n
  (3..n).each do |a|
    (4..n).each do |b|
      c2 = a ** 2 + b ** 2
      if hypot.include? (c2)
        c = Math.sqrt(c2).to_i
        #puts a, b, c, "\n" if hypot.include? (c2)
        triples.push([a,b,c])
        #this delete insures that the triple is only added once
        hypot.delete(c2)
      end
    end
  end
  return triples
end
