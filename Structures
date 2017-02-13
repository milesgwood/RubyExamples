#At start the self object points to main
#There is an implied self receiver object receiver.method x.even
#So when puts is called it is being called on the main object of class Object
puts self, self.class
#puts is a function of the Object class

x = 1

#puts prints a line followed by a newline
#print doesn't add a newline
puts "shit" if x < 0
puts "x is not even" unless x.even?
puts "x is odd" if x.odd?

#case control structure
r = rand(100)
case
when r.even?
 print r, " is even\n"
when r < 10
 print r, " is small\n"
else
 print r, " is big and odd\n"
end


#arrays
a = ['cat','dog','ferret']
#insert at index 1 and replace 2 things
a[1,2] = 'is', 'on', 'the', 'mat'
puts a.join(' ')
a[1,0] = 'boy'
puts a.join(' ')

#initialize arrays with spaces and default
b = Array.new(3, "default")
puts b.join(' ')

#each loops do a code block for each item in an array
b.each {puts "count off"}
#parameters are passed in | | seperated by commas.
#The only block parameter is the value of the current spot in the array
a.each { | w | puts "hi #{w} " }
#the second parameter is the index
a.each_with_index{| p1 , p2 | puts "hi #{p1} index #{p2}"}
#The yield keyword passes control to a block


#hashes use the literal {} instead of []used by arraysh = {}
h = {}
h[2] = "two"
h[true] = "true"
puts h
puts h[2]
puts h[true]

#functions start with def and end with enddef has5?(a)
def has5?(a)
  return 5<=a.size
end
#this function can be called with anything that has a size
puts has5?(a)

#return an array that counts up from one to n
#Default parameters can be set for functions so they don't have to be included
def getArray(n=3)
  return (1..n).to_a
end

print getArray(5), "\n"
#use the default params now
print getArray(), "\n"
#parentheses are optional
print getArray, "\t No parenteses in call\n"

#Ruby supports recursion
def getArr(n=5)
  return n==1? [1]: getArr(n-1).push(n)
end
print getArr(4), "\t Recursive function \n"
