//FizzBuzz in scala
object FizzBuzz{
    def main(args: Array[String]){
	for (i <- 0 until 100){
	    if (i % 3 == 0){
		if(i % 5 == 0){
		    println(i + " is FizzBuzz")	
		}
		else
		{
		    println(i + " is Fizz")
		}
	    }
	    else if(i % 5 == 0)
	    {
		println(i + " is Buzz")
	    }
        }	
    }
}
