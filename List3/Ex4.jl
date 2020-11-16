include("modules.jl")

f(x) = sin(x) - (x/2)^ 2
df(x) = cos(x) - x/2
a = 1.5
b = 2.0
c = 1.0

delta = 1/2 * 10^(-5)
epsilon = 1/2 * 10^(-5)
maxit = 1000

println("\nMethod & Root & Value & Iterations & Error\n")
(root, value, iter, err) = Mfuncs.mbisekcji(f, a, b, delta, epsilon)
println("Bisection & $root & $value & $iter & $err \\\\ \n\\hline")
(root, value, iter, err) = Mfuncs.mstycznych(f, df, a, delta, epsilon, maxit)
println("Newton & $root & $value & $iter & $err \\\\ \n\\hline")
(root, value, iter, err) = Mfuncs.msiecznych(f, c, b, delta, epsilon, maxit)
println("Secant & $root & $value & $iter & $err \\\\ \n\\hline")
