using VRP

#push!(LOAD_PATH, "src/solver")

"""
	main(ARGS)
	Flavio Sergio da Silva
"""

function main(V_S_ARG...)

	println("Antes...")
	if (length(V_S_ARG) < 3)
		println("\$ julia -O 3 main.jl -i data/input/rj_s102_supply.json -s 2023 -t 18e5 -k 50")

		exit()
	end
	println("Depois...")
	VRP.greet()

end

if (!isinteractive())
    main("-i", "data/input/rj_s102_supply.json", "-s", 2023, "-t", 10e5, "-k", 50)
end
