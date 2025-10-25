
function nestedLoops(pos, N, vec, num_p)
	if pos == N+1
        	# Base case: perform the innermost loop operation
        	println(vec)
		num_p[N]+=1
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

println("Energies combinations for each particle")

num_p=zeros(Int64, 6)

for N in (1:6)
	println()
	println("########### $N PARTICLE(S) ###########") 	

	vec = ones(Int64,N)
	nestedLoops(1, N, vec, num_p)
#	num_possibilities[N] = count
end

println()
println("Total number of energy combinations for each particle - Distinguishable case")
println()


for i in (1:6)
	println("$i PARTICLE(S): $(num_p[i]) POSSIBILITIES")
end
