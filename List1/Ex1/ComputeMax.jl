function computeMax(type)
	max = type(2.0 - eps(type))
	
	while !isinf(max * 2)
		max *= 2
	end
	return max
end
