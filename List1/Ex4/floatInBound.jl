# Computes float in given interval that x ∗ (1/x) != 1.
function floatInBound(start, End)
	start = Float64(start)
	End = Float64(End)
	number = nextfloat(start)
	
	while number < End
		if number * (1 / number) != 1
			println(bitstring(number))
			return number
		end
		number = nextfloat(number)
	end
end
