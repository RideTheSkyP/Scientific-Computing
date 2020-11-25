function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
	len = length(x)
	nt = fx[len]

	for i in len-1:-1:1
	    nt = fx[i] + (t - x[i]) * nt
	end

	return nt
end
