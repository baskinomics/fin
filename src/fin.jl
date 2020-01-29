module Fin

import Dates

export Salary, BudgetExpenditure, Schedule, Monthly

using Dates
using Pkg: TOML

"Represents a resource owned by an individual."
abstract type Asset end

"todo documentation"
abstract type TangibleAsset <: Asset end

"todo documentation"
abstract type CurrentAsset <: TangibleAsset end

"Represents cash and cash equivalents (CCE)."
abstract type CCE <: CurrentAsset end

"Represents money in the physical form of currency owned by an individual."
struct Cash <: CCE
    value::Float64
end

"Represents a bank account that allows money to be deposited and withdrawn."
abstract type DemandDepositAccount <: CurrentAsset end

"""
A liability is a present obligation of an individual arising from past events,
the settlement of which is expected to result in an outflow from the individual
of resources embodying economic benefits.
"""
abstract type Liability end

"An outflow of cash or other assets from an individual to another entity."
abstract type Expenditure end

"Represents the supertype of various financial plans."
abstract type Plan end

"Represents an individual's liquid cash."
struct Cash <: CCE
    value::Float64
end

"Represents a deposit account held at a commercial bank."
struct TransactionAccount <: DemandDepositAccount
    value::Float64
end

"""
Represents a deposit account at a retail bank that pays interest but cannot be
used directly as money in the narrow sense of a medium of exchange.
"""
struct SavingsAccount <: DemandDepositAccount
    value::Float64
end

"""
    Earning

Represents supertype of earnings received such as wages, salaries,
profits, interest payments, rents, etcetera.
"""
abstract type Earning end

"""
    Schedule

Represents the enumerated type describing payment schedules.
"""
@enum Schedule weekly = 1 biweekly = 2 monthly = 3

"""
"""
struct Salary <: Earning
    gross::Float64
    schedule::Schedule
end

"Represents a budgeted expense."
struct BudgetExpenditure <: Expenditure
    description::String
    value::Float64
    category::String
    # due::Date
    # weight::Int16
end

"Represents a planned monthly buedget."
struct Monthly <: Plan
    "The gross monthly income."
    income::Salary
    "The collection of monthly expenses."
    expenses::Array{BudgetExpenditure,1}
end

"""
Fundamental accounting equation, which represents the relationship between
assets, liabilities, and owner's equity of an individual.
"""
equity(assets, liabilities) = assets - liabilities

"Parses the given TOML file `file` and serializes it to a `Budget` composite type."
extract(file::AbstractString) = TOML.parsefile(file)

"Transforms the given dictionary `earnings` into a vector of `Earning` subtypes."
function transform(earnings::Dict{String,Any})
    # Transform and collect
    if haskey(earnings, "income") # && typeof(earnings["income"] == Array{Dict{String,Any},1})
        # Declare a variable that contains the collection of dictionaries
        income::Array{Dict{String,Any},1} = earnings["income"]
        # Construct and assign an uninitialized `Vector{fin.Income.Earning}`
        _earnings = Vector{Earning}[]
        @info _earnings
        # Extract values from key, construct new instances of `Earning` subtypes, and add to collection
        for i in income
            gross::Float64 = i["gross"]
            schedule::Schedule = Schedule(i["schedule"])
            s = Salary(gross, schedule)
            @info s
            # push!(_earnings, s)
        end
    end
end

"""
See: [Consumer leverage ratio](https://en.wikipedia.org/wiki/Consumer_leverage_ratio)
"""
consumer_leverage_ratio(debt::Float64, di::Float64) = debt / di

end # MODULE
