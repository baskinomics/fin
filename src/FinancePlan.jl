"Contains structs and methods for a monthly budget."
module FinancePlan

# Module loading
using Pkg: TOML

export ingestbudget

"Parses the given TOML file `file` and serializes it to a `Budget` composite type."
ingestbudget(file) = TOML.parsefile(file)

"Composite type representing a user's budget."
struct Budget
    
end

"Personal information about the user which is used in the report generation."
struct User
    "The user's first name."
    firstname::String
    "The user's last name."
    lastname::String
    "The user's primary state of residence."
    state::String
end # struct

"Represents an income source."
struct Income
    "todo convert this to an enum: `{salary, hourly}`"
    type::String
    "Gross income value."
    gross::Float64
    "Net income value."
    net::Float64
end

"An outflow of money to another person or group to pay for an item or service, or for a category of costs."
struct Expenditure
    "The value of the expenditure"
    amount::Float64
    "[Utility, Bill, General]"
    category::String
    "[ ... ]"
    subcategory::String
end

end # module