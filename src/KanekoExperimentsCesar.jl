module KanekoExperimentsCesar

export coupled_iteration

f(a, x) = 1-a*x^2

a = [1.85, 1.92]

#using CUDA

almost_equal(x, y, epsilon) = abs(x-y)< epsilon ? true : false

function flagging_roots(orbits, epsilon = 10^-1)
    roots = Float64[]
    push!(roots, orbits[1])
    B = zeros(Int64, size(orbits))
    for (i, x) in enumerate(orbits)
        seen = false
        for (k, y) in enumerate(roots)
            if almost_equal(x, y, epsilon)
                B[i] = k
                seen = true
            end
        end
        if seen ==  false
            push!(roots, x)
            B[i] = length(roots)
        end
    end
    
    return B, roots
end


function find_basin(a = 1.85, N = 10000, K = 10000)
    x0 = 2*rand(Float64, N).-1
    sort!(x0)
    g(x) = f(a, x)

    x = x0
    for _ in 1:K
        x = g.(x)
    end
    return Array(x0), Array(x) 
end

function coupled_iteration(a, ϵ, x)
    g(x) = f(a, x)
    y = g.(x)

    z = sum(y)/length(y)

    return (1-ϵ)*y .+ϵ*z
end

function coupled_orbit(a, ϵ, x, N)
    orbit = zeros((N, length(x)))

    for i in 1:N
        x = coupled_iteration(a, ϵ, x)
        orbit[i, :] = x
    end

    return orbit
end




end
