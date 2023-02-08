using VRP

push!(LOAD_PATH, "src/util")

include("src/util/util.jl")

"""
	main(ARGS)
	Flavio Sergio da Silva
"""

function main(V_S_ARG...)
	oArgument = rArgument()

	println("Antes...")
	if (length(V_S_ARG) < 3)
		println("\$ julia -O 3 main.jl -i data/input/rj_s102_supply.json -s 2023 -t 18e5 -k 50")

		exit()
	end

	for i in 1:length(V_S_ARG):2
		println("V_S_ARG[",i,"] = ", V_S_ARG[i])
		local sArg_ = lowercase(V_S_ARG[i])

		if (sArg_ == "-i")
			oArgument.sInputFile = V_S_ARG[i+1]
			if (oArgument.sInputFile === "" || match(r".+\.json", oArgument.sInputFile) === nothing)
				throw("Unexpected file:"+oArgument.sInputFile)
			end
		elseif (sArg_ == "-s")
			oArgument.iSeed = parse(Int64, V_S_ARG[i+1])
		elseif (sArg_ == "-t")
			oArgument.fExecutionTime = parse(Int64, V_S_ARG[i+1])
		elseif (sArg_ == "-k")
			oArgument.iNearestK = parse(Int64, V_S_ARG[i+1])
		else
			throw("Unexpected argument:"+sArg_)
		end
	end

	#VRP(oArgument)

	println("Depois...")

	VRP.greet()


end

if (!isinteractive())
    main("-i", "data/input/rj_s102_supply.json", "-s", 2023, "-t", 10e5, "-k", 50)
end
