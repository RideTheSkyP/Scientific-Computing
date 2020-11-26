include("modules.jl")
using Test

x1 = [-1.0, 0.0, 1.0, 2.0, 3.0]
f1 = [2.0, 1.0, 2.0, -7.0, 10.0]
answer2 = [2.0, -1.0, 1.0, -2.0, 2.0]

x2 = [1.0, 3.0, 4.0, 5.0]
f2 = [4.0, -2.0, 10.0, 16.0]
answer3 = [4.0, -3.0, 5.0, -2.0]

naturalAns = [-156.0, 262.0, -118.0, 16.0]

@testset "Quotients" begin
	@test isapprox(modules.ilorazyRoznicowe(x1, f1), answer2)
	@test isapprox(modules.ilorazyRoznicowe(x2, f2), answer3)
end

@testset "Newton Values" begin
    @test isapprox(modules.warNewton(x2, modules.ilorazyRoznicowe(x2, f2), 1.0), 4.0)
    @test isapprox(modules.warNewton(x2, modules.ilorazyRoznicowe(x2, f2), 5.0), 16.0)
    @test isapprox(modules.warNewton(x2, modules.ilorazyRoznicowe(x2, f2), -3.0), 472.0)
end

@testset "Natural" begin
    @test isapprox(modules.naturalna(x2, f2), naturalAns)
end
