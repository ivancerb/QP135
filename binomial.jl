using Printf

if length(ARGS) != 2
	println("Syntax: ./binomial.jl N n ")
        println("N total number of events")
        println("n number of events with the desired result")
        println("These calculations assume both possible results have the same probability")
	exit()
end

# Exact results - no approximations
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

# Not being used to return results
# This uses Stirling approximation in the format ln n! = n ln n - n
# This approximation is suitable only for very large numbers - so not suitable for the exercises 3 and 4, for instance, which use numbers < 1000. 
function stirling_binomial(N,n)
	ln_binomial = ln_stirling_factorial(N) - ln_stirling_factorial(n) - ln_stirling_factorial(N-n) + N * log(0.5)
	return exp(ln_binomial)
end

function ln_stirling_factorial(x)
	return x * log(x) - x
end

# Not being used to return results
# This uses Stirling approximation in the format n! = sqrt(2*pi*n) * n^n * e^(-n)
# This approximation is suitable for smaller numbers
function stirling_binomial_2(N,n)
       	return (stirling_factorial_2(N) / (stirling_factorial_2(n) * stirling_factorial_2(N-n))) * 0.5 ^N
end


function stirling_factorial_2(y)
	x = big(y)
        return sqrt(2*pi*x) * x^x * exp((-1)*x)
end


#ln_x = ln_stirling_factorial(100)

#x = exp(ln_x)

#println("ln_x = ", ln_x)
#println("x = ", x)


#P = binomial(100,50)
#println("Binomial direct calculation probability: ", P)

#PPerc = P * 100
#println(@sprintf("Probability: %.2f", PPerc))

#S = stirling_binomial(1000000000000, 500000000000)
#println(S)

#S2 = stirling_binomial_2(100, 50)
#println("Percent with stirling approximation - 2nd and more correct form - ",  S2 * 100)
#println(@sprintf("Probability with stirling approximation - 2nd and more correct form: %.4f", S2))


#fac100 = stirling_factorial_2(100)
#fac50 = stirling_factorial_2(50)
#println("fac100 ", fac100)
#println("fac50 ", fac50)

N=parse(Int64, ARGS[1]);
n=parse(Int64, ARGS[2]);
 
P = binomial(N,n)
println(@sprintf("P(%i,%i) = %.5e", N, n, P))
println(@sprintf("P(%i,%i) = %.5e %%", N, n, P*100))

