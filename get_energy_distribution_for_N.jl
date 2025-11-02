#Ex 75
#Calcula o número de microestados que correspondem a uma dada energia total, para um sistema com N partículas.
#O sistema pode ter de 1 a 6 partículas;
#Cada partícula pode ter energia entre 1 e 6.
#N é o número de partículas do sistema.
#Sintaxe:
#julia get_energy_distribution_for_N.jl N 

import Pkg; 

Pkg.add("DataStructures")

using DataStructures

energy_map = SortedDict{Int, Int}() #chave: energia total do sistema; valor: número de microestados com essa energia.

function count_energy(E, energy_map)
	if haskey(energy_map, E)
		energy_map[E] = energy_map[E] + 1
	else
		energy_map[E] = 1
	end
end

function energyLoop(pos, N, vec, num_p, energy_map)
	if pos == N+1
		E=sum(vec)
		count_energy(E, energy_map)
		num_p[1]+=1
        	return
	end
	for i in (1:6)
        	vec[pos] = i
        	energyLoop(pos+1, N, vec, num_p, energy_map)
	end
end

function extract_energy_data(energy_map, N)
	for (key, value) in energy_map
		println("$key $value")
	end
end

N=parse(Int, ARGS[1])

#println("Energies combinations - $N PARTICLE(S) ###########") 	

num_p=zeros(Int64,1)
vec = ones(Int64,N)
energyLoop(1, N, vec, num_p, energy_map)


println("ENERGY MICROSTATES") #header
extract_energy_data(energy_map, N)
