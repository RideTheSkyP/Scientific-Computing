function descending(type)
	x = type[2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
	y = type[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
	pos = []
	neg = []
	sum = 0
	value = -1.00657107e-11
	
	for i=1:5
		temp = x[i] * y[i]
		if temp < 0
			push!(neg, temp)
		else
			push!(pos, temp)
		end
	end
	
	
	pos = sort(pos, rev=true)
	neg = sort(neg, rev=true)
	posSum = 0
	negSum = 0
	
	for i=length(pos):-1:1
		posSum += pos[i]
	end
	
	for i=1:length(neg)
		negSum += neg[i]
	end
	
	sum = posSum + negSum
	println(sum, " Absolute error: ", abs(value - sum), " Relative error: ", abs(abs(value - sum) / value))
end
