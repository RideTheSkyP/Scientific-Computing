function naturalna(x::Vector{Float64}, fx::Vector{Float64})
    len = length(x)
    a = zeros(len)
    a[len] = fx[len]

    for i in len-1:-1:1
        a[i] = fx[i] - a[i + 1] * x[i]

        for j in i+1:len-1
            a[j] = a[j] - a[j + 1] * x[i]
        end
    end

    return a
end
