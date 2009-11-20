# program that prints if a number is prime or not 
    number = 0
	100.times do |i|
        while number <100
        number+=1     
		temp = 2
		prime = ' is '
		while temp < number
			if number%temp==0
				prime = ' is not' 
		    end
		    temp+=1
	    end
		puts "The number #{number} #{prime} prime"
	end
end
