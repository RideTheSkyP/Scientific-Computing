include("calculations.jl")
using Test

function tests()
	matrixSizes = [16, 10000, 50000]
	for size in matrixSizes
		println("\nMatrix of size: $size")
		A, n, l = buildMatrix("Dane$(size)_1_1/A.txt")
		b = buildVector("Dane$(size)_1_1/b.txt")
		vector = 0
		
		@time @testset "Calculating Vector" begin
			vector = calculateVector(A, n, l)
    		@test isapprox(vector, b)
    	end
    	
    	saveVector("output/CalculatingVector$(size)", n, vector, true)
    	A, n, l = buildMatrix("Dane$(size)_1_1/A.txt")
		b = buildVector("Dane$(size)_1_1/b.txt")
		
    	@time @testset "Gaussian Elimination" begin
	    	matrix, vector = gaussianElimination(A, n, l, b)
			@test isapprox(calculateGaussian(matrix, n, l, vector), ones(Float64, n))
    	end
    	
    	saveVector("output/GaussianElimination$(size)", n, vector, true)
    	A, n, l = buildMatrix("Dane$(size)_1_1/A.txt")
		b = buildVector("Dane$(size)_1_1/b.txt")
    	
    	@time @testset "Gaussian Elimination Pivoted" begin
	    	matrix, vector, pivots = gaussianEliminationPivoted(A, n, l, b)
			@test isapprox(calculateGaussianPivoted(matrix, n, l, vector, pivots), ones(Float64, n))
    	end
    	saveVector("output/GaussianEliminationPivoted$(size)", n, vector, true)
    end
end
