function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
	value0 = f(x0)
	value1 = f(x1)
	
	for i in 1:maxit
		if abs(value0) > abs(value1)
			x0, x1 = x1, x0
			value0, value1 = value1, value0
		end
		
		s = (x1 - x0) / (value1 - value0)
		x1= x0
		value1 = value0
		x0 = x0 - value0 * s
		value0 = f(x0)
		
		if abs(x1 - x0) < delta || abs(value0) < epsilon
			return (x0, value0, i, 0)
		end
	end
	return (x0, value0, maxit, 1)
end


