#Ex 75
#Calculates the number of microstates corresponding to a giving total energy, for a number of particles N
#System can have from 1 up to 6 particles
#Each particle can have energies in the range 1-6
#N is the number of particles of the system
#Syntax:
#julia get_energy_distribution_for_N.jl N 

import Pkg; 

Pkg.add("DataStructures")

using DataStructures

energy_map = SortedDict{Int, Int}() #key = energy of the system; value = number of microstates with that energy

function count_energy(E, energy_map)
	if haskey(energy_map, E)
		energy_map[E] = energy_map[E] + 1
	else
		energy_map[E] = 1
	end
end

function energyLoop(pos, N, vec, num_p, energy_map)
	if pos == N+1
        	#print(vec)
		E=sum(vec)
		#println(" E=$E")
		count_energy(E, energy_map)
		num_p[1]+=1
        	return
	end
#	if pos == N
#		println()
#	end
	for i in (1:6)
        	vec[pos] = i
        	energyLoop(pos+1, N, vec, num_p, energy_map)
	end
end

function extract_energy_data_to_file(energy_map, N)
	#println("@title \"Distribuição de microestados - $N partículas\"")
	#println("@xaxis label \"Energia (unidades arbitrárias)\"")
	#println("@yaxis label \"Número de microestados\"")
	for (key, value) in energy_map
		println("$key $value")
	end
end

N=parse(Int, ARGS[1])

#println("Energies combinations - $N PARTICLE(S) ###########") 	

num_p=zeros(Int64,1)
vec = ones(Int64,N)
energyLoop(1, N, vec, num_p, energy_map)

#println()
#println("Total number of energy combinations for each particle - Distinguishable case")
#println()


#println("$N PARTICLE(S): $(num_p[1]) POSSIBILITIES")

#println("Energy map")
extract_energy_data_to_file(energy_map, N)
