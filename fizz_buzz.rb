# Write a program that prints the numbers from 1 to 100. 
# But for multiples of three print “Fizz” instead of the 
# number and for the multiples of five print “Buzz”. 
# For numbers which are multiples of both three 
# and five print “FizzBuzz”.

class FizzBuzz
   def do_it
         result = ''
        100.times do |i|
            if i%3 == 0         
                if i%5 == 0
                    result << "FizzBuzz\n"
                else
                    result << "Fizz\n"
                end
            elsif i%5 ==0
                result << "Buzz\n"
            else
                result << "#{i}\n"
            end
        end
        return result
   end
end