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
###########
#Symbols = flag, stands for something type
#:
#highly optimized
#unique, immutable

###########
#array

%w{str1 str1}

heterogeneous_arr = [1, 'tww', :there]
arr_words = %w{ what a great day !}
puts arr_words[-2]
puts "#{arr_words.first}"

p arr_words[-3, 3] #go back 3 and take 2
p arr_words[2..4] #range 2 to 4

puts arr_words.join(',')
###########

push <<
pop shift
[]= index operator
sample
sort!     #如果沒有驚嘆號，會給一個新的array
reverse!


stack = []

stack << "one"
stack.push("two")
stack << "three"
puts stack.pop   #從後面吐
puts stack.shift #從前面吐
###########

useful array methods

each
select filter block
reject
map

a = [1,2,4,5,6,7,19]
a.each{ |num| print num}
new_arr = a.select{ |num| num > 4}
new_arr2 = a.select{ |num| num < 10}.reject{ |num| num.even?}
new_arr3 = a.map{ |x| x * 3}
p new_arr2



###########
#Range

two dots --> all inclusive
three dots --> end exclusive

useful for consecutive sequences

some_range = 1..3

puts some_range.max
#puts some_range.include?

puts (1...10) === 5.3
puts ('a'...'r') === "r"


p ('k'..'z').to_a.sample(2) #to_a is a function convert to array


age = 55
case age
	when 0..12 then puts "Still a baby"
	when 13..99 then puts "teenager at heart"
	else puts "You are getting older"
end

#####################
#hash create, associative arrays,

#{}
#Hash.new { |hash, key| hash [key] =   }
#index(key) can be anything
#[] operator, post creation
# => (creation)

editor_props = { "front" => "Arial", "size" => 23, "color" => "red"}

puts editor_props.length
puts editor_props["front"]

editor_props["background"] = "Blue"

editor_props.each_pair do |key, value|
	puts "Key: #{key} value: #{value}"
end


#################
#Hash API
http://ruby-doc.org/core-2.2.0/Hash.html

Hash.new(0) # return 0 when something doesn't exist


word_frequency = Hash.new(0)

sentence = "Chicka chicka bom, bom"
sentence.split.each do |word|
	word_frequency[word.downcase] += 1
end
p word_frequency

###################


