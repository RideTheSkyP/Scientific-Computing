include("modules.jl")

f(x) = exp(x)
g(x) = (x^2)*sin(x)

modules.rysujNnfx(f, 0.0, 1.0, 5)
modules.rysujNnfx(f, 0.0, 1.0, 10)
modules.rysujNnfx(f, 0.0, 1.0, 15)

modules.rysujNnfx(g, -1.0, 1.0, 5)
modules.rysujNnfx(g, -1.0, 1.0, 10)
modules.rysujNnfx(g, -1.0, 1.0, 15)
