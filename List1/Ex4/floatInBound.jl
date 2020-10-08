function floatInBound(start, End)
	start = Float64(start)
	End = Float64(End)
	number = nextfloat(start)
	
	while number < End
		if number * (1 / number) != 1
			return number
		end
		number = nextfloat(number)
	end
end
