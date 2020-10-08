delta = Float64(2) ^ (-52)

function computeInterval(start)
	deltaStart = delta * (2 ^ (start - 1))
	for k = 1:10
		println(bitstring(start + k * deltaStart))
	end
end
