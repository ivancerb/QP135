#Sintaxe:
#
#julia random.jl N   (para rodar somente uma vez, imprimindo informações textuais sobre os resultados)
#julia random.jl N n_runs (para rodar n_runs vezes, obtendo somente os resultados numéricos)
#
#Simula N sorteios de 2 moedas, através de 2 vetores aleatórios de N booleanos cada; 
#Se os resultados são diferentes, equivale ao resultado S=0 (cara = 1 e coroa = -1)
#
#Parâmetros:
#N numero de sorteios
#n_runs número de repetições dos N sorteios, para analisar as divergências dos resultados
#
#Exemplo: 
#julia random.jl 10000 5
#Para repetir 5 vezes o sorteio de 10000 números
#
# Esperamos que
# 1. Quanto maior N, mais próximo de 50% será o número de resultados S=0 (uma cara e uma coroa, ou vice-versa) com relação ao número total de lançamentos N,
#    ou seja, mais próximo da distribuição esperada
# 2. Para valores pequenos de N, o resultado do percentual acima varie mais, e varie pouco para valores grandes de N


#import Pkg; 

#Pkg.add("Random")

using Random
using Printf

function num_of_zeroes(vec1, vec2)
	sum_zeroes=0;
	for i in (1:N)
		if vec1[i]!= vec2[i]
			sum_zeroes=sum_zeroes+1
		end
	end
	return sum_zeroes;
end

function perc_deviation(result)
	return abs(50 - result) * 100/50
end
	
num_args = length(ARGS)
N=parse(Int, ARGS[1])
n_runs=1
print_msgs = false
if num_args == 2
	n_runs = parse(Int, ARGS[2])
	println("perc deviation")
else	
        print_msgs = true
end


for i in (1:n_runs)

	vec1 = bitrand(N);
	vec2 = bitrand(N);

	sum = num_of_zeroes(vec1, vec2)
	perc = (sum*100)/N
	deviation = perc_deviation(perc)

	if print_msgs
		println("Número de zeros em ", N, " lançamentos: ", sum)
		println(@sprintf("Fração de zeros em %i lançamentos: %.2f%%", N, perc))
		println(@sprintf("Desvio com relação à distribuição esperada: %.2f%%", deviation))
	else 
		println(perc, " ",  deviation)
	end
end








