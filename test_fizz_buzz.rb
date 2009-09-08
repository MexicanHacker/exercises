require 'fizz_buzz'
require 'test/unit'

class TestFizzBuzz < Test::Unit::TestCase
   
   def test_multiples_of_three
       fb = FizzBuzz.new
       result = fb.do_it
      assert_equal(34, result.scan(/Fizz/).length)
      assert_equal(20, result.scan(/Buzz/).length)
      assert_equal(7,result.scan(/FizzBuzz/).length)
   end 
end