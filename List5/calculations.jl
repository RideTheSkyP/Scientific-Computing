using SparseArrays

function buildMatrix(path)
	open(path, "r") do file
		fl = split(readline(file))
		n = parse(Int64, fl[1])
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
			n = parse(Int64, fl)
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
		lastColumn = min(i + l, n)
		lastRow = min(Int64((floor(i / l) + 1) * l), n)
		for j in i+1:lastRow
			if abs(A[i, i]) < eps(Float64)
				error("Diagonal contains 0")
			end
			x = A[j, i] / A[i, i]
			A[j, i] = 0
			
			for k in i+1:lastColumn
				A[j, k] -= x * A[i, k]
			end
			b[j] -= x * b[i]
		end
	end

	return A
end

function calculateGaussian(A, n, l, b)
	vector = zeros(Float64, n)
	for i in n:-1:1
		x = 0.0
		for j in i+1:min(i+l, n)
			x += A[i, j] * vector[j]
		end
		vector[i] = (b[i] - x) / A[i, i]
	end

	return vector
end

function gaussianEliminationPivoted(A, n, l, b)
    pivots = collect(1:n) 
    for i in 1:n-1
        maxIndex = i                      
        maxValue = abs(A[i, i])

        for j in i+1:min(n, Int64((floor(i / l) + 1) * l))
            absValue = abs(A[pivots[j], i])
            if absValue > maxValue
                maxIndex = j
                maxValue = absValue               
            end
        end

        pivots[i], pivots[maxIndex] = pivots[maxIndex], pivots[i]
        
        for j in i+1:min(n, Int64((floor(i / l) + 1) * l))
            x = A[pivots[j], i] / A[pivots[i], i]
            A[pivots[j], i] = 0        
             
            for k in i+1:min(n, i + l * 2)
                A[pivots[j], k] -= x * A[pivots[i], k]    
            end         
            b[pivots[j]] -= x * b[pivots[i]]   
        end
    end
    return A, pivots
end


function calculateGaussianPivoted(A, n, l, b, pivots)
	vector = zeros(Float64, n)
    for i in 1:n-1
        for j in i+1:min(n, 2 * l + i)
            b[pivots[j]] -= A[pivots[j], i] * b[pivots[i]]
        end
    end

    for j in n:-1:1
        x = 0
        for k in  j+1:min(n, 2 * l + j)
            x += A[pivots[j], k] * vector[k]
        end
        
        vector[j] = (b[pivots[j]] - x) / A[pivots[j], j]
    end
    return vector
end
