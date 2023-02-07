push!(LOAD_PATH, "src/solver")

using VRP

"""
	main(ARGS)
	Flavio Sergio da Silva
"""

main(V_S_ARG) = begin
	oArgument = rArgument()

	if (length(V_S_ARG) < 2)
			println("\$ julia main.jl -i data/input/df-0/cvrp-0-df-0.json -s 2023 -t 18e5 -k 50")

			exit()
	end

	for i = 2 : length(V_S_ARG):2
		local sArg_ = lowercase(V_S_ARG[i])

		if (sArg_ == "-i")
			oArgument.sInputFile = V_S_ARG[i+1]
			if (oArgument.sInputFile === "" || match(r".+\.json", oArgument.sInputFile) === nothing)
				throw("Unexpected file:"+oArgument.sInputFile)
		elseif (sArg_ == "-s")
			arguments.seed = parse(Int64, V_S_ARG[i+1])
		elseif (sArg_ == "-t")
			oArgument.fExecutionTime = parse(Int64, V_S_ARG[i+1])
		elseif (sArg_ == "-k")
			oArgument.iNearestK = parse(Int64, V_S_ARG[i+1])
		else
			throw("Unexpected argument:"+sArg_)
	end

	VRP(oArgument)
end

if (!isinteractive())
    main(V_S_ARG)
end
