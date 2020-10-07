function computeEta(type)
	eta = type(1.0)
	i = type(0.0)
	while eta / 2 != i
		eta = eta / 2
	end
	return eta
end
