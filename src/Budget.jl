module Budget

include("Income.jl")
include("Accounting.jl")

using .Income
using .Accounting

"Represents the supertype of various financial plans."
abstract type Plan end

"Represents a planned monthly buedget."
struct Monthly <: Plan
    "The gross monthly income."
    income::Salary
    "The collection of monthly expenses."
    expenses::Array{Expenditure,1}
end

end # module
