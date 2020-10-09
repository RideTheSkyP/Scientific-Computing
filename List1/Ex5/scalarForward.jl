function forwardProduct(type)
	sum = 0
	x = type[2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
	y = type[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
	
	for i=1:5
		sum += x[i] * y[i]
	end
	return sum
end

