include("modules.jl")
using Plots

function rysujNnfx(f, a::Float64, b::Float64, n::Int)
	h = (b - a) / n
	x = zeros(n + 1)
	y = zeros(n + 1)

	for i in 0:n
		x[i + 1] = a + i * h
		y[i + 1] = f(x[i + 1])
	end

	fx = modules.ilorazyRoznicowe(x, y)

	graphSize = (2*n)^2
    acc = (b - a) / graphSize
    values = zeros(graphSize + 1)
    interpolation = zeros(graphSize + 1)

    for i in 0:graphSize
        t = a + i * acc
        values[i + 1] = f(t)
        interpolation[i + 1] = modules.warNewton(x, fx, t)
	end
	
    graph = plot(values, label="Function values")
    graph = plot!(interpolation, label="Interpolation")
	savefig(graph, "graphs/Ex5Test$f($n).png")
end
