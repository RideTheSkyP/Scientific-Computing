function func(c, x)
	arr = []
	push!(arr, x)
	for i in 1:40
		x1 = Float64(x)^2 + Float64(c)
		push!(arr, x1)
		x = x1
	end
	return arr
end

res1 = func(-2, 1)
res2 = func(-2, 2)
res3 = func(-2, 1.99999999999999)
res4 = func(-1, 1)
res5 = func(-1, -1)
res6 = func(-1, 0.75)
res7 = func(-1, 0.25)

for i in 1:41
	println("$(res1[i]) & $(res2[i]) & $(res3[i]) & $(res4[i]) & $(res5[i]) & $(res6[i]) & $(res7[i]) \\\\ \n\\hline")
end