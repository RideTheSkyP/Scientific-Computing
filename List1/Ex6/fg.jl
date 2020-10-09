function fx()
	for i = 1:10
		x = Float64(8.0 ^ -i)
		f = sqrt(x ^ 2 + 1) - 1
		println(f)
	end
end

function gx()
	for i = 1:10
		x = Float64(8.0 ^ -i)
		g = (x ^ 2) / (sqrt(x ^ 2 + 1) +1)
		println(g)
	end
end
