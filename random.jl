random_10 = rand(-1:1, 10);
#println(random_10*2);

random_100 = rand(-1:1, 100);
#println(random_100*2);

random_1000 = rand(-1:1, 1000);
#println(random_1000*2);

random_10000 = rand(-1:1, 10000);
#println(random_10000*2);

random_10000 = rand(-1:1, 10000);
#println(random_10000*2);

random_10000000 = rand(-1:1, 10000000)

function num_of_zeroes(vec)
	sum_zeroes=0;
	for i in vec
		if i == 0
			sum_zeroes=sum_zeroes+1
		end
	end
	return sum_zeroes;
end

sum_10 = num_of_zeroes(random_10)
println("Numero de zeros em 10 lançamentos: ", sum_10)
println("Fração de zeros em 10 lançamentos: ", sum_10/10)

sum_100 = num_of_zeroes(random_100)
println("Numero de zeros em 100 lançamentos: ", sum_100)
println("Fração de zeros em 100 lançamentos: ", sum_100/100)

sum_1000 = num_of_zeroes(random_1000)
println("Numero de zeros em 1000 lançamentos: ", sum_1000)
println("Fração de zeros em 1000 lançamentos: ", sum_1000/1000)

sum_10000 = num_of_zeroes(random_10000)
println("Numero de zeros em 10000 lançamentos: ", sum_10000)
println("Fração de zeros em 10000 lançamentos: ", sum_10000/10000)

sum_10000000 = num_of_zeroes(random_10000000)
println("Numero de zeros em 10000000 lançamentos: ", sum_10000000)
println("Fração de zeros em 10000000 lançamentos: ", sum_10000000/10000000)












