Classes are things
Containers of method

Objects are instances of those things
Objects contain instances variables

instances variables begin with @

@name

class Person
	def initialize (name, age)
		@name = name
		@age = age
	end
	def get_info
		@additional_info = "Interesting"
		"Name: #{@name}, age: #{@age}"
	end
end
#####################

class Person
	def initialize (name, age)
		@name = name
		@age = age
	end
	def get_info
		@additional_info = "Interesting"
		"Name: #{@name}, age: #{@age}"
	end
end

person1 = Person.new("joe", 14)
p person1.instance_variables
# => [:@name, :@age]
puts person1.get_info
p person1.instance_variables
#####################

In order to access instance variables, you need to define getter/setter methods
ex.

class Person
	def initialize (name, age)
		@name = name
		@age = age
	end
	def name
		@name
	end
	def name= (new_name)
		@name = new_name
	end
end

person2 = Person.new("jow", 14)
puts person2.name
person2.name = "Mike"
puts person1.name
#####################

another way

attr_accessor
attr_reader
attr_writer

class PP
	attr_accessor :name, :age
end

person3 = PP.new  (constructor)
p person3.name  # => nil
person3.name = "Mike"
person3.age = 15
puts person3.name
puts person3.age
person3.age = "ggg"
puts person3.age
####################

inside instance method,self refers to the object itself

#using self for calling other methods of the same instance is extraneous

outside instance method, self refers to class itself


class Person
	attr_reader :age
	attr_accessor :name

	def initialize (name, ageVar)
		@name = name
		self.age = ageVar #call the age= method
		puts age
	end
	def age= (new_age)
		@age = new_age unless new_age > 120
    end
end


person1 = Person.new("Kin", 13)
####################


var = var || something
#can be a default setting
evaluates the left side
if true return left
else return right

@x = @x || 5   #first: 5, next time: @x



class Person
	attr_reader :age
	attr_accessor :name

	def initialize (name, ageVar)
		@name = name
		self.age = ageVar #call the age= method
	end
	def age= (new_age)
		@age ||= 5
		@age = new_age unless new_age > 130
	end
end
###################

@instance_variable
@@class_variable
###################

Inheritance

class Dog
	def to_s
		"Dog"
	end
	def bark
		"barks loudly"
	end
end

class SmallDog < Dog
	def bark #override
		"barks quietly"
	end
end

dog = Dog.new
small = SmallDog.new

puts "#{dog}1 #{dog.bark}"
puts "#{dog}2 #{small.bark}"

####################

Module is container for classes, method.

main purpose:
as Namespace
####################

module Sports
	class Match
		attr_accessor :score
	end
end

module Patterns
	class Match
		attr_accessor :complete
	end
end

match1 = Sports::Match.new
match1.score = 45

match2 = Patterns::Match.new
match2.complete = true

#####

module SayMyName
	attr_accessor :name
	def print_name
		puts "Name: #{@name}"
	end
end

class Person
	include SayMyName
end

class Company
	include SayMyName
end

person = Person.new
person.name = "Joe"
person.print_name
#####################

class BankAccount
    attr_accessor :id, :amount
    def initialize(id, amount)
        @id = id
        @amount = amount
    end
end


acct1 = BankAccount.new(123, 200)
acct2 = BankAccount.new(321, 100)
acct3 = BankAccount.new(421, -100)
accts = [acct1, acct2, acct3]

total_sum = 0
accts.each do |ee|
    total_sum += ee.amount
end

puts total_sum

######################

Three levels Access COntrol

public protected private





