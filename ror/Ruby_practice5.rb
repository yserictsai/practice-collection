###Dynamic dispatch





###Reporting System

class Store
    def get_piano_desc
        "Excellent piano"
    end
    def get_piano_price
        120.00
    end
    def get_violin_desc
        "Fantastic violin"
    end
    def get_violin_price
        110.00
    end
end







require_relative 'store'
class ReportingSystem
    def initialize
        @store = Store.new
    end
    def get_piano_desc
        @store.get_piano_desc
    end
    def get_piano_price
        @store.get_piano_price
    end
end

rs = ReportingSystem.new
puts "#{rs.get_piano_desc costs #{rs.get_piano_price.to_s.ljust(6, '0')}"



#######Dynamic method

require_relative 'store'
class ReportingSystem
    def initialize
        @store = Store.new
        @store.method.grep(/^get_(.*)_desc/) { ReportingSystem.define_report_methods_for $1 }
    end
    def self.define_report_methods_for(item)
        define_method("get_#{item}_desc") { @store.send("get_#{item}_desc") }
        define_method("get_#{item}_price") { @store.send("get_#{item}_price") }
    end
end


rs = ReportingSystem.new
puts "#{rs.get_piano_desc costs #{rs.get_piano_price.to_s.ljust(6, '0')}"







###calling method way
#1. obj.method
#2. send() method pass string or symbol


class Dog
    def bark
        puts "Woof!"
    end
    def greet(greeting)
        puts greeting
    end
end

dog = Dog.new

dog.bark

dog.send("bark")
dog.send(:bark) #symbol

method = :bark
dog.send method

dog.send(:greet, "hello")



####Ghost method
method_missing

require_relative 'store'

class ReportingSystem
    def initialize
        @store = Store.new
    end
    def method_missing(name, *args)
        super unless @store.respond_to?(name)
        @store.send(name)
    end
end

method behavior can be defined at runtime ex. db has column or not










