
function energyLoop(pos, N, vec, num_p, print_comb)
	if pos == N+1
        	# Caso base
        	if print_comb
			print(vec)
			E=sum(vec)
			println(" E=$E")
		end
		num_p[1]+=1
        	return
	end
	if pos == N && print_comb
		println()
	end
	for i in (1:6)
        	vec[pos] = i
        	energyLoop(pos+1, N, vec, num_p, print_comb)
	end
end


num_args = length(ARGS)
N=parse(Int, ARGS[1])
print_comb = false
if (num_args == 2) && (ARGS[2] == "print")
	print_comb = true
end

println("##### Combinações de energias - $N PARTÍCULA(S) #####") 	

num_p=zeros(Int64,1)
vec = ones(Int64,N)
energyLoop(1, N, vec, num_p, print_comb)

println()
println("Número total de combinações de energia de cada partícula - Caso distinguível")
println()


println("$N PARTÍCULA(S): $(num_p[1]) POSSIBILIDADES")

