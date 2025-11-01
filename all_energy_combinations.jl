
function energyLoop(pos, N, vec, num_p)
	if pos == N+1
        	# Caso base
        	print(vec)
		E=sum(vec)
		println(" E=$E")
		num_p[N]+=1
        	return
	end
	if pos == N
		println()
	end
	for i in (1:6)
        	vec[pos] = i
        	energyLoop(pos+1, N, vec, num_p)
	end
end

println("Combinações de energia:")

num_p=zeros(Int64, 6)

for N in (1:6)
	println()
	println("########### $N PARTÍCULA(S) ###########") 	

	vec = ones(Int64,N)
	energyLoop(1, N, vec, num_p)
#	num_possibilities[N] = count
end

println()
println("Número total de combinações de energias - Caso distinguível")
println()


for i in (1:6)
	println("$i PARTÍCULA(S): $(num_p[i]) POSSIBILIDADES")
end
