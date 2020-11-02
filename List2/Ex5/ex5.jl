function func(type)
    previousP1 = previousP2 = type(0.01)
    r = type(3)
    println("0 & $previousP1 & $previousP2 & $(previousP2 - previousP1) & $previousP1 \\\\ \n\\hline")
    
    for n in 1:40
        p1 = type(previousP1) + type(r * previousP1 * (1 - previousP1))
        p2 = type(previousP2) + type(r * previousP2 * (1 - previousP2))

        if n==10
            p2 *= 1000
            p2 = floor(p2) / 1000
        end
        
        println("$n & $p1 & $p2 & $(p2-p1) &  \\\\ \n\\hline")
        previousP1 = p1
        previousP2 = p2
    end
end
