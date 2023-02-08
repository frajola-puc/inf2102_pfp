module VRP
"""
using Dates
using CVRP_Structures
using Load_Instance
using CVRP_Controllers: fixAssignment!
using Cluster_Instance: train
using Initial_Solution: greedySolution
using ClarkeWright: clarkeWrightSolution
using Heuristic_Solution: ils
using LKH_3: lkh
using Verifier
using Random
using Output
using Juno
using Profile
using ProfileSVG

# Global variables used to controll solver
SLOT_LENGTH  = 100
SLOT_COUNTER = 0
LAST_SLOT    = false
INSTANCE_LENGTH = 0
"""


"""
???????
???????
???????
"""


#Apply initial algorithm and then a heuristic method in order to solve DCVRP.

#**Algorithms:**
#* `Clarke-Wright` - Initial Algorithm
#* `Iterated Local-Search (ILS)` - Heuristic Algorithm (improvement step)
#"""


"""
function solve(instance::CvrpData, auxiliar::CvrpAuxiliars; solution::Controller{Array{Route,1}} = nothing, exec_time::Real=9e5)

    global SLOT_COUNTER += 1
    local current_slot = SLOT_COUNTER * SLOT_LENGTH

    if (current_slot >= INSTANCE_LENGTH)
        current_slot = INSTANCE_LENGTH
        global LAST_SLOT = true
    end

    local deliveries = instance.deliveries[1:current_slot]

    if (solution !== nothing)
        solution = clarkeWrightSolution(instance, auxiliar, deliveries; solution = solution)
        global cwSpolution = deepcopy(solution)

        local time = Int(round((exec_time * SLOT_LENGTH) / length(instance.deliveries), RoundUp))
        solution = ils(auxiliar, solution, deliveries; execution_time=time)

    else
        solution = clarkeWrightSolution(instance, auxiliar, deliveries)
        # global cwSpolution = deepcopy(solution)

        local time = Int(round((exec_time * SLOT_LENGTH) / length(instance.deliveries), RoundUp))
        solution = ils(auxiliar, solution, deliveries; execution_time=time)
    end

    fixAssignment!(solution, deliveries)

    if (LAST_SLOT)
        return solution
    end

    return solve(instance, auxiliar; solution = solution, exec_time = exec_time)

end
"""

greet() = print("Hello World!")

end # module VRP
