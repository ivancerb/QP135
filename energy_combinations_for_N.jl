
function nestedLoops(pos, N, vec, num_p)
	if pos == N+1
        	# Base case: perform the innermost loop operation
        	println(vec)
		num_p[1]+=1
        	return
	end
	if pos == N
		println()
	end
	for i in (1:6)
        	vec[pos] = i
        	nestedLoops(pos+1, N, vec, num_p)
	end
end

N=parse(Int, ARGS[1])

println("Energies combinations - $N PARTICLE(S) ###########") 	

num_p=zeros(Int64,1)
vec = ones(Int64,N)
nestedLoops(1, N, vec, num_p)

println()
println("Total number of energy combinations for each particle - Distinguishable case")
println()


println("$N PARTICLE(S): $(num_p[1]) POSSIBILITIES")

