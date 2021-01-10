using SparseArrays

function buildMatrix(path)
	open(path, "r") do file
		fl = split(readline(file))
		
		# Size of matrix A
		n = parse(Int64, fl[1])
		
		# Size of matrices Ak, Bk, Ck
		l = parse(Int64, fl[2])
		
		A = spzeros(Float64, n, n)
		
		while !eof(file)
			values = split(readline(file))
			i = parse(Int64, values[1])
			j = parse(Int64, values[2])
			A[i, j] = parse(Float64, values[3])
		end
		return A, n, l
	end
end

function buildVector(path)
		iter = 1
		
		open(path, "r") do file
			fl = readline(file)
			
			# Size of matrix vector
			n = parse(Int64, fl)
			
			# Create vector
			b = zeros(Float64, n)
			
			while !eof(file)
				value = readline(file)
				b[iter] = parse(Float64, value)
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

function calculateVector(A, n, l)
	vector = zeros(Float64, n)
	for i in 1:n
		for j in max(1, i - (2+l)) : min(n, i+l)
			vector[i] += A[i, j]
		end
	end
	return vector
end

function gaussianElimination(A, n, l, b)
	for i in 1:n-1
		lastColumn = min(i+l, n)
		lastRow = min(l+l*floor((k+1)/l), n)
		for j in i+1:lastRow
			if abs(A[i, i]) < eps(Float64)
				error("Diagonal contains 0")
			end
			x = A[i, j] / A[i, i]
			for k in i+1:lastColumn
				A[k, j] -= x * A[k, i]
			end
		end
	end
	return A
end


