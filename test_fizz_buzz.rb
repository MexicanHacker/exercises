require 'fizz_buzz'
require 'test/unit'

class TestFizzBuzz < Test::Unit::TestCase
   
   def test_multiples_of_three
       fb = FizzBuzz.new
       fb.do_it
       #TODO How to test this?
   end 
end