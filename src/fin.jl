module fin

# Include external Julia files and modules
include("FinancePlan.jl")
include("Income.jl")
include("Statement.jl")

# todo adding to namespace
using .FinancePlan
using .Income

end # module
