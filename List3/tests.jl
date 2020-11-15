include("modules.jl")

epsilon = 10.0^(-5)
delta = 10.0^(-5)
maxit = 1000

f(x) = x^2 - 4
df(x) = 2 * x
a = 1.0
b = 4.0

f1(x) = x^2 - 2*x - 3
df1(x) = 2*x - 2
a1 = -2.0
b1 = 2.0

println("\nf(x) = x^2 - 4;\tx=2;\n")
println("Method & Root & Value & Iterations & Error\n")
(root, value, iter, err) = Mfuncs.mbisekcji(f, a, b, delta, epsilon)
println("Bisection & $(root) & $(value) & $(iter) & $(err)")

(root, value, iter, err) = Mfuncs.mstycznych(f, df, a, delta, epsilon, maxit)
println("Newton & $(root) & $(value) & $(iter) & $(err)")

(root, value, iter, err) = Mfuncs.msiecznych(f, a, b, delta, epsilon, maxit)
println("Secant & $(root) & $(value) & $(iter) & $(err)")


println("\nf(x) = x^2 - 2*x - 3;\tx=-1, 3;\n")
(root, value, iter, err) = Mfuncs.mbisekcji(f1, a1, b1, delta, epsilon)
println("Bisection & $(root) & $(value) & $(iter) & $(err)")

(root, value, iter, err) = Mfuncs.mstycznych(f1, df1, a1, delta, epsilon, maxit)
println("Newton & $(root) & $(value) & $(iter) & $(err)")

(root, value, iter, err) = Mfuncs.msiecznych(f1, a1, b1, delta, epsilon, maxit)
println("Secant & $(root) & $(value) & $(iter) & $(err)")
