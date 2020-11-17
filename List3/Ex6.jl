include("modules.jl")

f1(x) = exp(1 - x) - 1
df1(x) = -exp(1 - x)

f2(x) = x * exp(-x)
df2(x) = - exp(-x) * (x - 1)

a = 0.0
b = 0.5
c = 2.0
d = 1.5
f = -1.5

delta = 10^(-5)
epsilon = 10^(-5)
maxit = 1000

println("\nMethod & Root & Value & Iterations & Error\n")
(root, value, iter, err) = Mfuncs.mbisekcji(f1, b, d, delta, epsilon)
println("Bisection & $root & $value & $iter & $err \\\\ \n\\hline")
(root, value, iter, err) = Mfuncs.mstycznych(f1, df1, a, delta, epsilon, maxit)
println("Newton & $root & $value & $iter & $err \\\\ \n\\hline")
(root, value, iter, err) = Mfuncs.msiecznych(f1, b, d, delta, epsilon, maxit)
println("Secant & $root & $value & $iter & $err \\\\ \n\\hline")

println("\nMethod & Root & Value & Iterations & Error\n")
(root, value, iter, err) = Mfuncs.mbisekcji(f2, f, b, delta, epsilon)
println("Bisection & $root & $value & $iter & $err \\\\ \n\\hline")
(root, value, iter, err) = Mfuncs.mstycznych(f2, df2, b, delta, epsilon, maxit)
println("Newton & $root & $value & $iter & $err \\\\ \n\\hline")
(root, value, iter, err) = Mfuncs.msiecznych(f2, f, b, delta, epsilon, maxit)
println("Secant & $root & $value & $iter & $err \\\\ \n\\hline")

println("\nMethod & Root & Value & Iterations & Error\n")
(root, value, iter, err) = Mfuncs.mstycznych(f1, df1, 1.0, delta, epsilon, maxit)
println("Newton & $root & $value & $iter & $err \\\\ \n\\hline")
(root, value, iter, err) = Mfuncs.mstycznych(f2, df2, 1.0, delta, epsilon, maxit)
println("Newton & $root & $value & $iter & $err \\\\ \n\\hline")
