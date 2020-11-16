include("modules.jl")

f1(x) = exp(1 - x) - 1
df1(x) = -exp(1 - x)

f2(x) = x * exp(-x)
df2(x) = - exp(-x) * (x - 1)

a = 1.0
b = 1000.0
delta = 10^(-5)
epsilon = 10^(-5)
maxit = 1000

println("\nMethod & Root & Value & Iterations & Error\n")
(root, value, iter, err) = Mfuncs.mbisekcji(f1, a, b, delta, epsilon)
println("Bisection & $root & $value & $iter & $err")
(root, value, iter, err) = Mfuncs.mstycznych(f1, df1, a, delta, epsilon, maxit)
println("Newton & $root & $value & $iter & $err")
(root, value, iter, err) = Mfuncs.msiecznych(f1, a, b, delta, epsilon, maxit)
println("Secant & $root & $value & $iter & $err")

println("\nMethod & Root & Value & Iterations & Error\n")
(root, value, iter, err) = Mfuncs.mbisekcji(f2, a, b, delta, epsilon)
println("Bisection & $root & $value & $iter & $err")
(root, value, iter, err) = Mfuncs.mstycznych(f2, df2, a, delta, epsilon, maxit)
println("Newton & $root & $value & $iter & $err")
(root, value, iter, err) = Mfuncs.msiecznych(f2, a, b, delta, epsilon, maxit)
println("Secant & $root & $value & $iter & $err")
