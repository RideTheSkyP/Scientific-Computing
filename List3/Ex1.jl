function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
	leftValue = f(a)
	rightValue = f(b)
	length = b - a
	i = 0
	
	if sign(leftValue)==sign(rightValue)
		return(0, 0, 0, 1)
	end
	
	while length > epsilon
		i += 1
		length /= 2
		middle = length + a
		value = f(middle)
		
		if abs(length) < delta || abs(value) < epsilon
			return (middle, value, i, 0)
		end
		
		if sign(value) == sign(leftValue)
			a = middle
			leftValue = value
		else
			b = middle
			rightValue = value
		end
	end
end
