push!(LOAD_PATH, "src/solver")
#ToDo
#push!(LOAD_PATH, "src/SD-CVRP/verifier/")
using vrp

"""
	main(ARGS)
	Flavio Sergio da Silva
"""
main(ARGS) = begin
	oArgument = struArgument()

	if (length(args) < 2)
			println("\$ julia main.jl -s 1 -i data/input/df-0/cvrp-0-df-0.json -t 18e5 -k 50")

			exit()
	end

	for i = 1 : length(args)
		local argument = lowercase(args[i])

		if (argument == "-s" || argument == "--seed")
			oArgument.seed = parse(Int64, args[i+1])
			i += 1
		elseif (oArgument == "-i" || oArgument == "--input")
			oArgument.input = args[i+1]
			i += 1
		elseif (oArgument == "-t" || oArgument == "--timer")
			oArgument.execution_time = parse(Int64, args[i+1])
			i += 1
			elseif (oArgument == "-k" || oArgument == "--k-near")
				oArgument.k_nearest = parse(Int64, args[i+1])
			i += 1
	end

	if (oArgument.sInputFile === "" || match(r".+\.json", oArgument.sInputFile) === nothing)
			throw("Unexpected file:"+oArgument.sInputFile)
	end

	#cvrp(oArgument; DEBUG=debug)
	vrp(oArgument)
end

if (!isinteractive())
    main(ARGS)
end
