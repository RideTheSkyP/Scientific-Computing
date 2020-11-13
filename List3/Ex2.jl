function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
	value = f(x0)
	
	if abs(value) < epsilon
		return (x0, value, 0, 2)
	end
	
	for i in 1:(maxit+1)
		x = x0 - (value/pf(x0))
		value = f(x)
		
		if abs(x-x0) < delta || abs(value) < epsilon
			return (x, value, i, 0)
		end
		x0 = x
	end
end
