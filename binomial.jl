using Printf

if length(ARGS) != 2
	println("Sintaxe: ./binomial.jl N n ")
        println("N - número total de eventos")
        println("n - número de eventos com o resultado desejado")
        println("Estes cálculos assumem que ambos os resultados possuem a mesma probabilidade de ocorrência")
	exit()
end

# Resultados exatos - sem aproximações
# P = { N! / [ n! . (N - n)! ] } ( 1/2 )^N
# P = { N . (N - 1) . (N - 2) .... (N - n + 1)  / [ (N - n)! ] } ( 1/2 )^N
function binomial(N,n)
	prod=big(1);
	for i in (n+1:N)
		prod=prod*i;
	end
	fact = factorial(big(N-n));
	half_factor = (0.5)^N
	return (prod/fact) * half_factor;
end


# Usa a aproximação de Stirling na forma n! = sqrt(2*pi*n) * n^n * e^(-n)
# Essa aproximação é adequada para números menores.
function stirling_binomial(N,n)
       	return (stirling_factorial(N) / (stirling_factorial(n) * stirling_factorial(N-n))) * 0.5 ^N
end


function stirling_factorial(y)
	x = big(y)
        return sqrt(2*pi*x) * x^x * exp((-1)*x)
end

# Usa a aproximação de Stirling na forma ln n! = n ln n - n
# Esta forma é adequada somente para números muito grandes - não sendo adequada nos exercícios 3 and 4, por exemplo, onde temos números < 1000.
function stirling_binomial_very_large(N,n)
        ln_binomial = ln_stirling_factorial(N) - ln_stirling_factorial(n) - ln_stirling_factorial(N-n) + N * log(0.5)
        return exp(ln_binomial)
end

function ln_stirling_factorial(x)
        return x * log(x) - x
end


N=parse(Int64, ARGS[1]);
n=parse(Int64, ARGS[2]);

P = binomial(N,n)
println("Usando o cálculo exato da distribuição binomial")
println(@sprintf("P(%i,%i) = %.5e", N, n, P))
println(@sprintf("P(%i,%i) = %.5e %%", N, n, P*100))
println()

P = stirling_binomial(N,n)
println("Usando a aproximação de Stirling")
println(@sprintf("P(%i,%i) = %.5e", N, n, P))
println(@sprintf("P(%i,%i) = %.5e %%", N, n, P*100))
println()

P = stirling_binomial_very_large(N,n)
println("Usando a aproximação de Stirling para números muito grandes")
println(@sprintf("P(%i,%i) = %.5e", N, n, P))
println(@sprintf("P(%i,%i) = %.5e %%", N, n, P*100))
