function main()
	x0 = Float64(1)
	
	for n=0:54
		h = Float64(2) ^ (-n)
		f = (fx(x0 + h) - fx(x0)) / h
		
		println(n, " & ", f, " & ", abs(f - derivative(x0)), " & ", h + 1, " \\")
	end
end

function fx(x)
	f = sin(Float64(x)) + cos(Float64(3 * x))
	return f
end

function derivative(x)
	# Derivative is: cos(x) - 3 sin(3x)
	der = cos(Float64(x)) - 3.0 * sin(3 * Float64(x))
	return der
end
