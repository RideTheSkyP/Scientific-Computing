function backwardProduct(type)
	sum = 0
	x = type[2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
	y = type[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
	value = -1.00657107e-11
	
	for i=5:-1:1
		sum += x[i] * y[i]
	end
	println(sum, " Absolute error: ", abs(value - sum), " Relative error: ", abs(abs(value - sum) / value))
end

