include("matrixgen.jl")
using SparseArrays

function buildMatrix(path, swap)
	open(path, "r") do file
		head = split(readline(file))
		
		# Size of matrix A
		n = parse(Int64, file[1])
		
		# Size of matrices Ak, Bk, Ck
		l = parse(Int64, file[2])
		
		A = spzeros(Float64, n, n)
		
		while !eof(file)
			values = split(readline(file))
			i = parse(Int64, values[1])
			j = parse(Int64, values[2])
			value = parse(Float64, values[3])

			if swap
				A[j, i] = value
			else
				A[i, j] = value
			end
		end
		return A, n, l
	end
end

function buildVector(path)
	iter = 1
	
	open(path, "r") do file
		head = split(readline(file))
		
		# Size of matrix vector
		n = parse(Int64, head)
		
		# Create vector
		b = zeros(Float64, n)
		
		while !eof(file)
			value = readline(file)
			b[iter] = parse(Float64, value
			iter += 1
		end
		return b
	end
end

function saveVector(path, n, b)
	open(path, "w") do file
		println(file, "$n")
		for i in 1:n
			println(b[i])
		end
	end
end
