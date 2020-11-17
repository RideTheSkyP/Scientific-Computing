include("modules.jl")

f(x) = 3 * x - exp(x)
a = 0.0
b = 1.0
c = 2.0
delta = 10 ^ (-4)
epsilon = 10 ^ (-4)

println("\nMethod & Root & Value & Iterations & Error\n")
(root, value, iter, err) = Mfuncs.mbisekcji(f, a, b, delta, epsilon)
println("Bisection[0, 1] & $root & $value & $iter & $err")
(root, value, iter, err) = Mfuncs.mbisekcji(f, b, c, delta, epsilon)
println("Bisection[1, 2] & $root & $value & $iter & $err")
