function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
	len = length(x)
	fx = copy(f)
	
	for i in 1:len-1
		for j in len:-1:i+1
			fx[j] = (fx[j] - fx[j - 1]) / (x[j] - x[j - i])
		end
	end

	return fx
end
