class FizzBuzz
   def do_it
        100.times do |i|
            if i%3 == 0         
                if i%5 == 0
                    puts "Fizz Buzz"
                else
                    puts "Fizz"
                end
            elsif i%5 ==0
                puts "Buzz"
            else
                puts "#{i}"
            end
        end
   end
end