my_tests = [
	"../main.jl"
]

println("INFO: Running tests...")

for my_test in my_tests
  include(my_test)
end