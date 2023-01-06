###Unit testing

require 'test/unit'
require_relative 'Ruby_workplace'

class CalculatorTest < Test::Unit::TestCase
    def setup
        @calc = Calculator.new('test')
    end
    def test_addition
        assert_equal 4, @calc.add(2, 2)  #expect equals to 4
    end
    def test_subtraction
        assert_equal 2, @calc.substract(4, 2)
    end
    def test_division
        #assert_equal 2, @calc.divide(4, 2)
        assert_raise ZeroDivisionError do  #ZeroDivisionError 是固定寫法
            @calc.divide(1, 0)
        end
    end
end


#################

RSpec
RSpec Matcher

to() or not_to()

be_true
be_false
eq xxx
raise_error(SomeError)

it 'should sum two odd numbers and become even' do
    expect(@calculator.add(3, 3)).to be_even
    expect(@calculator.add(3, 3)).not_to be_even
end


