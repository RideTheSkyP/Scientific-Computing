include("modules.jl")

f(x) = 1 / (1 + x^2)
g(x) = abs(x)

modules.rysujNnfx(f, -1.0, 1.0, 5)
modules.rysujNnfx(f, -1.0, 1.0, 10)
modules.rysujNnfx(f, -1.0, 1.0, 15)

modules.rysujNnfx(g, -5.0, 5.0, 5)
modules.rysujNnfx(g, -5.0, 5.0, 10)
modules.rysujNnfx(g, -5.0, 5.0, 15)
