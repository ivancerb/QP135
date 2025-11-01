#Sintaxe:
#
#julia random.jl N   (para rodar somente uma vez, imprimindo informações textuais sobre os resultados)
#julia random.jl N n_runs (para rodar n_runs vezes, obtendo somente os resultados numéricos, e a média e o desvio padrão dos resultados obtidos)
#
#Simula N sorteios de 2 moedas, através de 2 vetores aleatórios de N booleanos cada; 
#Se os resultados são diferentes, equivale ao resultado S=0 (cara = 1 e coroa = -1)
#Esses resultados são contados e examinamos a sua proporção frente ao total.
#Além disso, calcula o desvio percentual da proporção de resultados S=0 obtidos com relação à distribuição esperada (50% de lançamentos com S=0)
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
# 1. Quanto maior N, mais próximo de 50% será a proporção de resultados S=0 (uma cara e uma coroa, ou vice-versa),
#    ou seja, mais próximo da distribuição esperada
# 2. Para valores pequenos de N, o resultado do percentual acima varie mais, e varie pouco para valores grandes de N -
#    resultando em desvios padrão menores para N maiores


#import Pkg; 

#Pkg.add("Random")
#Pkg.add("Statistics")

using Random
using Printf
using Statistics

function num_of_zeroes(vec1, vec2)
	sum_zeroes=0;
	for i in (1:N)
		if vec1[i]!= vec2[i]
			sum_zeroes=sum_zeroes+1
		end
	end
	return sum_zeroes;
end

function perc(result, total)
	return result * 100 / total
end

function perc_deviation(result)
	return abs(50 - result) * 100/50
end

# var initialization
print_msgs = true
n_runs=1

results  = zeros(Int64, 1)
percents = zeros(Float64, 1)
deviations = zeros(Float64, 1)

# reading args and adjusting variables according to arg values
num_args = length(ARGS)
N=parse(Int, ARGS[1])
if num_args == 2
	n_runs = parse(Int, ARGS[2])
	
	results = zeros(Float64,n_runs)
	percents = zeros(Float64,n_runs)
	deviations = zeros(Float64, n_runs)

        println("PERC  DESVIO") #header
        print_msgs = false
end


 
for i in (1:n_runs)
	vec1 = bitrand(N);
	vec2 = bitrand(N);

	results[i]  = num_of_zeroes(vec1, vec2)
	percents[i] = perc(results[i],N)
	deviations[i] = perc_deviation(percents[i])

end

for i in (1:n_runs)
	if print_msgs
		println("Número de zeros em ", N, " lançamentos: ", results[i])
	        println(@sprintf("Fração de zeros em %i lançamentos: %.2f%%", N, percents[i]))
	        println(@sprintf("Desvio com relação à distribuição esperada: %.2f%%", deviations[i]))
	else
		println(@sprintf("%.2f %.2f", percents[i],deviations[i]))
	end
end

if n_runs != 1
	avg = Statistics.mean(percents)
	sd  = Statistics.std(percents)
	println()
	println(@sprintf("Média: %.2f Desvio Padrão: %.2f", avg, sd))
end




