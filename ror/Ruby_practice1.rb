a = 5 

if a == 3
	puts "a is 3"
elsif a == 5
	puts "a is 5"
else
	puts "is not 3 or 5"
end

##########
b = 5

#b不等於6 puts
#除非b等於6, 不然都puts
unless b == 6
	puts "b is not 6"
end
###########

y = 0
puts "aa" if y == 0
###########

y += 1 while y < 10
puts y
###########
##like triple equal

name = 'fisher'
case name
	when /fish/i then puts "fish"
	when "smith" then puts "you are smith"
end
###########
##like if else

age = 21
case 
  when age >= 21
    puts "You can buy a drink" 
  when 1 == 0 
    puts "Written by a drunk programmer"  
  else 
    puts "Default condition"
end 
###########
##3 type of triple equal

if /sera/ === "coursera"
	puts "triple work"
end

if "string" === "string"
	puts "triple also work"
end

if Integer === 21
	puts "21 is an Integer"
end
###########
#false & nil are false
#everything else is true

puts "0 is true" if 0
puts "false is false" if false
###########
#do until something 

a = 8
until a >= 10
	puts a
	a += 1
end
###########
#do unless something

a = 6
unless a == 5
 	puts "a is not 5"
end 
###########
#if n = 0 return 1 otherwise (:) return n * factorial(n-1)

def factorial (n)
	n == 0? 1 : n * factorial(n-1)
end
###########
##default n = 5

def factorial_1(n=5)
	puts n 
end
factorial_1()
###########
#splat, prefixed parameter inside method

def max(one_para, *number_of_para, last_para)
	number_of_para.max
end

###########

def can_divide_by?(number)
  return false if number.zero?
  true
end

puts can_divide_by?(3)
###########
#Blocks
#{} block content is a single line
#do ... end  spans multiple lines
#as iterators

2.times { puts "hh" }
5.times { |index| puts index if index > 0}

5.times do |index|
	if index > 0
		puts index
	end
end
###########
#implicit
#"block_given?"
#otherwise, exception is thrown

def two_times_implicit
	return "No block" unless block_given?
	yield
	yield
end

puts two_times_implicit { print 'hi'}
puts two_times_implicit
###########
#explicit
#declare a block inside method

def two_times_explicit (&here_is_a_block)
	return "No block" if here_is_a_block.nil?
	here_is_a_block.call
	here_is_a_block.call
end

two_times_explicit { puts "yo"}
puts two_times_explicit
###########
#Blocks are just code that you can pass into methods

###########
#Read from file

File.foreach( "test.txt" ) do |line|
	puts line  # one
	p line      #"one\n"
	p line.chomp #"one"
	p line.split  #["one"]
end
###########

begin
	File.foreach( "do_not_exit.txt" ) do |line|
		puts line.chomp
	end
rescue Exception => e  #Exception gets map to e variable 
	puts e.message
	puts "let's pretend this didn't happen"
end
###########

if File.exist? 'test.txt'
	File.foreach( 'test.txt' ) do |line|
		puts line.chomp
	end
end
###########

File.open("tt.txt", "w") do |file|
	file.puts "xxxx"
end
###########

puts ENV["EDITOR"] => 'subl'
###########
#跳脫字元要有效需用雙引號
#運算有效需要雙引號
#EX

def mul(one, two)
	"#{one} mul by #{two} equals #{one * two}"
end
###########
# modified string  !!!!!!!!
#  %Q{long multiline string}

my_one = " tim"
puts my_one

my_one.lstrip!
puts my_one

cur_weather = %Q{It's a hot day outside}
cur_weather.lines do |line|
	line.sub! 'hot', 'rainy'
	puts "#{line.strip}"
end