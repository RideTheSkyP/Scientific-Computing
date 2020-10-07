function macheps(type)
	epsilon = type(1.0)
	one = type(1.0)
	while one + epsilon / 2!= one
		epsilon = epsilon / 2
	end
	return epsilon
end
