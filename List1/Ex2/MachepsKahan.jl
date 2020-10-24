# Computes machine epsilon using Kahan expression. As argument accepts a type (Float16, Float32, Float64)
function macheps2(type)
	return type(3.0) * (type(4.0) / type(3.0) - type(1.0)) - type(1.0)
end
